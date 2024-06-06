from google.cloud import translate_v2 as translate
import os

def translate_text(text, target_language='es'):
    """Translates text into the target language.
    
    Args:
        text (str): The text to translate.
        target_language (str): The language to translate the text into.

    Returns:
        str: The translated text.
    """
    translate_client = translate.Client()

    # Text can also be a sequence of strings, in which case this method
    # will return a sequence of results for each text.
    result = translate_client.translate(text, target_language=target_language)
    
    return result['translatedText']

def translate_file(input_file_path, output_file_path, target_language='es'):
    """Translates the content of an input file and writes it to an output file.

    Args:
        input_file_path (str): The path to the input file.
        output_file_path (str): The path to the output file.
        target_language (str): The language to translate the text into.
    """
    # Read the content of the input file
    with open(input_file_path, 'r', encoding='utf-8') as file:
        text = file.read()

    # Translate the text
    translated_text = translate_text(text, target_language)

    # Write the translated text to the output file
    with open(output_file_path, 'w', encoding='utf-8') as file:
        file.write(translated_text)


def list_directories(path):
    # List to store directory names
    directories = []
    
    # Iterate over all the entries in the specified path
    for entry in os.listdir(path):
        # Create the full path
        full_path = os.path.join(path, entry)
        
        # Check if the entry is a directory
        if os.path.isdir(full_path) and not entry.startswith('.'):
            directories.append(entry)
    
    return directories


def create_file(hanzi):
    inPath = "./%s/pt.txt" % hanzi
    outPath = "./%s/es.txt" % hanzi
    translate_file(inPath, outPath, target_language='es')


directories = list_directories('.')
for dir in directories:
    print(dir)
    create_file(dir)
