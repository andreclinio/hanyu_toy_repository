// ignore_for_file: constant_identifier_names, depend_on_referenced_packages, avoid_print

import 'dart:io';

const SOUNDS = ['machine'];

void main() {
  final inputDirectory = Directory('.');
  final outputDirectory = Directory('.');
  final worldIds = getWordIds(inputDirectory);
  moveAllSoundMachineFiles(inputDirectory, worldIds, outputDirectory);
}

void moveAllSoundMachineFiles(Directory inRootDirectory, List<String> worldIds, Directory outRootDirectory) {
  for (final wordId in worldIds) {
    moveSoundMachineFiles(inRootDirectory, wordId, outRootDirectory);
  }
}

void moveSoundMachineFiles(Directory inRootDirectory, String wordId, Directory outRootDirectory) {
  for (final soundMode in SOUNDS) {
    final mp3FilePath = '${inRootDirectory.path}/$wordId/sound.mp3';
    final mp3File = File(mp3FilePath);
    final mp3OutFilePath = '${inRootDirectory.path}/$wordId/sounds/$soundMode/$wordId.mp3';
    moveFile(mp3File, mp3OutFilePath);
  }
}

List<String> getWordIds(Directory rootDirectory) {
  final dirs = rootDirectory.listSync(followLinks: true);
  final wordsDir = dirs.where((wd) => wd.statSync().type == FileSystemEntityType.directory);
  final ids = wordsDir.map((wd) => basename(wd.path)).where((n) => !n.startsWith("."));
  return ids.toList();
}

void moveFile(File srcFile, String targetPath) {
  if (!srcFile.existsSync()) {
    print('[WRN] ${srcFile.path} does not exists!');
    return;
  }

  Directory destinationDir = Directory(targetPath).parent;
  if (!(destinationDir.existsSync())) {
    destinationDir.createSync(recursive: true);
    print('Created directory: ${destinationDir.path}');
  }
  try {
    srcFile.renameSync(targetPath);
    print('[OK] ${srcFile.path} -> $targetPath');
  } catch (e) {
    print('[ERR] ${srcFile.path} -> $targetPath');
  }
}

String basename(String filePath) {
  // Normalize path separators (handles both Unix and Windows styles)
  filePath = filePath.replaceAll('\\', '/');

  // Find the last occurrence of the path separator
  int lastSeparatorIndex = filePath.lastIndexOf('/');

  // Extract and return the substring after the last separator
  if (lastSeparatorIndex != -1) {
    return filePath.substring(lastSeparatorIndex + 1);
  } else {
    // If no separator is found, the entire path is the basename
    return filePath;
  }
}
