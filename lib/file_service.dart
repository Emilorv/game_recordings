import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileService {
  Future<String> getAppDirectoryPath() async {
    final directory = await getApplicationDocumentsDirectory();
    final appDirectory = Directory('${directory.path}/voice_recorder_app');
    if (!await appDirectory.exists()) {
      await appDirectory.create();
    }
    return appDirectory.path;
  }

  Future<List<Directory>> getFolders() async {
    final appDirectoryPath = await getAppDirectoryPath();
    final appDirectory = Directory(appDirectoryPath);
    return appDirectory.listSync().whereType<Directory>().toList();
  }

  Future<void> createFolder(String name) async {
    final appDirectoryPath = await getAppDirectoryPath();
    final folder = Directory('$appDirectoryPath/$name');
    if (!await folder.exists()) {
      await folder.create();
    }
  }

  Future<List<File>> getFilesInFolder(String folderName) async {
    final appDirectoryPath = await getAppDirectoryPath();
    final folder = Directory('$appDirectoryPath/$folderName');
    return folder.listSync().whereType<File>().toList();
  }

  Future<String> getFilePath(String folderName, String fileName) async {
    final appDirectoryPath = await getAppDirectoryPath();
    return '$appDirectoryPath/$folderName/$fileName';
  }
}
