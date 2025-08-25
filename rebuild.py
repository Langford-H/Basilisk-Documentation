import subprocess
import time
import argparse
from pathlib import Path

# === CONFIG ===
SRC_DIR = Path("texfile")        # folder with your .tex contents
OUT_DIR = Path("pdfoutput")
MASTER = Path("singlepdftest.tex")   # temporary build file
CLASS_FILE = Path("BasiliskD.cls") # class file dependency
CLASS_NAME = "BasiliskD"           # your class name (without .cls)
CLEAN_EXTS = [".aux", ".log", ".out", ".bbl", ".blg", ".bcf", ".run.xml"]

OUT_DIR.mkdir(exist_ok=True)

# track last compile times
timestamp_file = Path(".timestamps")
timestamps = {}

if timestamp_file.exists():
    for line in timestamp_file.read_text().splitlines():
        f, t = line.split("::", 1)
        timestamps[f] = float(t)

def run(cmd):
    subprocess.run(cmd, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=False)

def compile_for(texfile: Path):
    name = texfile.stem
    relpath = texfile.with_suffix("")  # remove .tex, keep folder/name
    print(f"🔨 Compiling {name}...")

    # generate singlepdf.tex wrapper
    content = f"""\\documentclass[single,bibpath=./reference.bib]{{{CLASS_NAME}}}
\\begin{{document}}
\\include{{{relpath.as_posix()}}}
\\end{{document}}
"""
    MASTER.write_text(content, encoding="utf-8")

    # compile pdflatex-biber-pdflatex-pdflatex
    run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error", str(MASTER)])
    run(["biber", MASTER.stem])
    run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error", str(MASTER)])
    run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error", str(MASTER)])

    pdf = MASTER.with_suffix(".pdf")
    if pdf.exists():
        target = OUT_DIR / f"{name}.pdf"
        pdf.replace(target)
        print(f"✅ Created {target}")
        timestamps[str(texfile)] = time.time()
    else:
        print(f"❌ Failed for {name}")

    # clean aux/log
    for ext in CLEAN_EXTS:
        f = MASTER.with_suffix(ext)
        if f.exists():
            f.unlink()

def need_recompile(texfile: Path):
    """Check if file or class is newer than last build"""
    last_time = timestamps.get(str(texfile), 0.0)
    if texfile.stat().st_mtime > last_time:
        return True
    if CLASS_FILE.exists() and CLASS_FILE.stat().st_mtime > last_time:
        return True
    return False

# === MAIN ===
if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Build Basilisk docs")
    parser.add_argument("--all", action="store_true", help="Rebuild all tex files")
    parser.add_argument("--changed", action="store_true", help="Rebuild only changed tex files")
    args = parser.parse_args()

    texfiles = list(SRC_DIR.glob("*.tex"))
    if not texfiles:
        print("⚠️ No .tex files found in", SRC_DIR)
        exit(1)

    if args.all:
        for texfile in texfiles:
            compile_for(texfile)
    elif args.changed:
        for texfile in texfiles:
            if need_recompile(texfile):
                compile_for(texfile)
            else:
                print(f"👌 Skipping {texfile.stem}, no changes")
    else:
        print("⚠️ Please specify either --all or --changed")

    # save updated timestamps
    with open(timestamp_file, "w") as f:
        for k, v in timestamps.items():
            f.write(f"{k}::{v}\n")
