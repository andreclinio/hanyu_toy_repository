import os
from gtts import gTTS

def list_directories(path):
    # List to store directory names
    directories = []
    
    # Iterate over all the entries in the specified path
    for entry in os.listdir(path):
        # Create the full path
        full_path = os.path.join(path, entry)
        
        # Check if the entry is a directory
        if os.path.isdir(full_path):
            directories.append(entry)
    
    return directories


def create_sound(hanzi):
    language = "zh-CN"  # Use the appropriate language code
    speech = gTTS(text=hanzi, lang=language, slow=False)
    outPath = "./%s/sound.mp3" % hanzi
    speech.save(outPath)

directories = list_directories('.')
for dir in directories:
    create_sound(dir)
