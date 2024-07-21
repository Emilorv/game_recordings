

import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'file_service.dart';

class FolderProvider extends ChangeNotifier {
  final FileService _fileService = FileService();
  List<Directory> _folders = [];

  List<Directory> get folders => _folders;

  FolderProvider() {
    loadFolders();
  }

  void loadFolders() async {
    _folders = await _fileService.getFolders();
    notifyListeners();
  }

  void addFolder(String name) async {
    await _fileService.createFolder(name);
    loadFolders();
  }
}