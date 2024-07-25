import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'folder_list_screen.dart';
import 'folder_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FolderProvider(),
      child: MaterialApp(
        home: FolderListScreen(),
      ),
    );
  }
}
