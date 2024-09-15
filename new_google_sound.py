import os
from gtts import gTTS
import sys


def create_sound(hanzi):
    language = "zh-CN"  # Use the appropriate language code
    speech = gTTS(text=hanzi, lang=language, slow=False)
    outPath = "machine.mp3"
    speech.save(outPath)



if len(sys.argv) != 2:
    print("Usage: python script.py <argument>")
    sys.exit(1)

hanzi = sys.argv[1]
print(hanzi)
create_sound(hanzi)

