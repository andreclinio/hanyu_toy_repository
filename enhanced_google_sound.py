import sys

from google.cloud import texttospeech


def create_sound_file(text, gender, output_file):
    client = texttospeech.TextToSpeechClient()
    synthesis_input = texttospeech.SynthesisInput(text=text)
    # Escolher voz masculina para chinês
    voice = texttospeech.VoiceSelectionParams(
        language_code="zh-CN", 
        ssml_gender=gender
    )

    audio_config = texttospeech.AudioConfig(audio_encoding=texttospeech.AudioEncoding.MP3)

    response = client.synthesize_speech(input=synthesis_input, voice=voice, audio_config=audio_config)

    with open(output_file, "wb") as out:
        out.write(response.audio_content)
    print(f"Saved {output_file}")


def create_sound(hanzi):
    create_sound_file(hanzi, texttospeech.SsmlVoiceGender.FEMALE, "female.mp3") 
    create_sound_file(hanzi, texttospeech.SsmlVoiceGender.MALE, "male.mp3") 
    
if len(sys.argv) != 2:
   print("Usage: python script.py <argument>")
   sys.exit(1)

hanzi = sys.argv[1]
print(hanzi)
create_sound(hanzi)

