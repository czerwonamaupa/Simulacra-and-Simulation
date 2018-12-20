import re
from pandocfilters import Para, Str, toJSONFilter, walk
from pyphen import Pyphen

dic = Pyphen(lang='en_US', left=3, right=3)

word_detection_pattern = re.compile(r'\w{7,}', re.UNICODE)

def inpara(key, value, format, meta):
    if key == 'Para':
        return Para(walk(value, hyphenate, format, meta))

def hyphenate(key, value, format, meta):
    if key == 'Str':
        return Str(word_detection_pattern.sub(
            lambda match: dic.inserted(match.group(0), hyphen='­'),
            value))

if __name__ == "__main__":
    toJSONFilter(inpara)
