import 'dart:convert';
import 'dart:io';

import '../hanyu_toy/lib/services/word/word.dart';

void main() async {
  const outDirPath = '.';
  const inDirPath = '../hanyu_toy/assets/hanzi';
  final words = await _loadWords(inDirPath, 'pt');
  for (final word in words) {
    final hanzi = word.hanzi;
    final wordDirPath = '$outDirPath/$hanzi';
    final wordDir = Directory(wordDirPath);
    if (await wordDir.exists()) {
      print('. $wordDirPath');
    } else {
      print('+ $wordDirPath');
      await wordDir.create();
    }
  }
  const codes = ['pt', 'en'];
  for (final code in codes) {
    final words = await _loadWords(inDirPath, code);
    for (final word in words) {
      final hanzi = word.hanzi;
      final imageInDirPath = '$inDirPath/images/$hanzi.svg';
      final imageOutDirPath = '$outDirPath/$hanzi/image.svg';
      _copyFile(imageInDirPath, imageOutDirPath);

      final soundInDirPath = '$inDirPath/sounds/$hanzi.mp3';
      final soundOutDirPath = '$outDirPath/$hanzi/sound.mp3';
      _copyFile(soundInDirPath, soundOutDirPath);

      final trOutDirPath = '$outDirPath/$hanzi/$code.txt';
      _writeFile(trOutDirPath, word.translation);

      final pyOutDirPath = '$outDirPath/$hanzi/pinyin.txt';
      _writeFile(pyOutDirPath, word.pinyin);
    }
  }
}

void _copyFile(String sourcePath, String destinationPath) async {
  try {
    final sourceFile = File(sourcePath);
    if (await sourceFile.exists()) {
      final destinationFile = await sourceFile.copy(destinationPath);
      print('File copied to ${destinationFile.path}');
    } else {
      print('Source file ($sourcePath) does not exist');
    }
  } catch (e) {
    print('An error occurred while copying the file: $e');
  }
}

Future<AppWordList> _loadWords(String inDirPath, String langCode) async {
  final controlPath = '$inDirPath/control.json';
  final controlJsonStr = await _readFile(controlPath);
  final data = json.decode(controlJsonStr); // Parse the JSON data
  final list = _jsonToHanziList(data, langCode);
  return list;
}

Future<String> _readFile(String path) async {
  final file = File(path);
  final contents = await file.readAsString();
  return contents;
}

void _writeFile(String path, String content) async {
  try {
    final file = File(path);
    await file.writeAsString(content);
    print('Content written to $path');
  } catch (e) {
    print('An error occurred while writing to the file: $e');
  }
}

AppWord _jsonToHanzi(Map<String, dynamic> json, String langCode) {
  final hanzi = jsonToString(json, 'hanzi');
  final pinyin = jsonToString(json, 'pinyin');
  final Map<String, dynamic> trMap = jsonToObject(json, 'translation');
  final translation = jsonToString(trMap, langCode);
  final object = AppWord(hanzi: hanzi, pinyin: pinyin, translation: translation);
  return object;
}

AppWordList _jsonToHanziList(List<dynamic> json, String langCode) {
  final AppWordList list = [];
  for (var value in json) {
    final hanzi = _jsonToHanzi(value, langCode);
    list.add(hanzi);
  }
  return list;
}

String jsonToString(Map<String, dynamic> json, String field) {
  final obj = json[field];
  if (obj == null) return '?';
  return obj as String;
}

Map<String, dynamic> jsonToObject(Map<String, dynamic> json, String field) {
  final obj = json[field];
  if (obj == null) return {};
  return obj as Map<String, dynamic>;
}
