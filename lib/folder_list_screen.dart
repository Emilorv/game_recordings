import 'package:flutter/material.dart';
import 'package:game_recordings/recording_screen.dart';
import 'package:provider/provider.dart';

import 'folder_provider.dart';

class FolderListScreen extends StatelessWidget {
  final TextEditingController _folderController = TextEditingController();

  FolderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Folders')),
      body: Consumer<FolderProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.folders.length,
            itemBuilder: (context, index) {
              final folder = provider.folders[index];
              final folderName = folder.path.split('\\').last;
              return ListTile(
                title: Text(folderName),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RecordingsScreen(folderName: folderName),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('New Folder'),
              content: TextField(
                controller: _folderController,
                decoration: const InputDecoration(hintText: 'Folder name'),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Provider.of<FolderProvider>(context, listen: false)
                        .addFolder(_folderController.text);
                    Navigator.pop(context);
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
