from pygments.lexers.c_cpp import CLexer
from pygments.token import *

class DiffLexer(CLexer):
    name = 'Diff'
    aliases = ['diff']
    filenames = ['*.diff']

    EXTRA_KEYWORDS = ['scalar',  'vector']

    def get_tokens_unprocessed(self, text):
        for index, token, value in CLexer.get_tokens_unprocessed(self, text):
            if token is Name and value in self.EXTRA_KEYWORDS:
                yield index, Keyword, value
            else:
                yield index, token, value