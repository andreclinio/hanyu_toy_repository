from google.cloud import translate_v2 as translate
import os
import sys

def translate_text(text):
    translate_client = translate.Client()
    result = translate_client.translate(text, target_language='es')
    print(result['translatedText'])

if len(sys.argv) != 2:
    print("Usage: python script.py <argument>")
    sys.exit(1)

pt = sys.argv[1]
translate_text(pt)
