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


def create_sound(levelDir, hanzi):
    language = "zh-CN"  # Use the appropriate language code
    speech = gTTS(text=hanzi, lang=language, slow=False)
    outPath = "./%s/%s/sounds/machine.mp3" % (levelDir, hanzi)
    speech.save(outPath)

levelDir = './repository/2'
directories = list_directories(levelDir)
for dir in directories:
    print (dir)
    create_sound(levelDir, dir)
