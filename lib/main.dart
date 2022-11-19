import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:fastreport/data/repositories/docum/templates.dart';
import 'package:fastreport/domain/repositories/getFolderRepositoryId/getFolderRepositoryId.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

  var _file;
  var _fileBase64;
  var _catalog;


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() async {
    final request = await GetIdentRepositoryImp().getIdForFolder();
    final String id = request['id'];
    final lists = await TemplatesRepositoryImpl().createTemplate(
      id,
      'Cock',
      'PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4KPFJlcG9ydCBTY3JpcHRMYW5ndWFnZT0iQ1NoYXJwIj4KICA8RGljdGlvbmFyeS8+CiAgPFJlcG9ydFBhZ2UgTmFtZT0iUGFnZTEiIFdhdGVybWFyay5Gb250PSJBcmlhbCwgNjBwdCI+CiAgICA8UmVwb3J0VGl0bGVCYW5kIE5hbWU9IlJlcG9ydFRpdGxlMSIgV2lkdGg9IjcxOC4yIiBIZWlnaHQ9IjM3LjgiLz4KICAgIDxQYWdlSGVhZGVyQmFuZCBOYW1lPSJQYWdlSGVhZGVyMSIgVG9wPSI0MS44IiBXaWR0aD0iNzE4LjIiIEhlaWdodD0iMjguMzUiLz4KICAgIDxEYXRhQmFuZCBOYW1lPSJEYXRhMSIgVG9wPSI3NC4xNSIgV2lkdGg9IjcxOC4yIiBIZWlnaHQ9Ijc1LjYiLz4KICAgIDxQYWdlRm9vdGVyQmFuZCBOYW1lPSJQYWdlRm9vdGVyMSIgVG9wPSIxNTMuNzUiIFdpZHRoPSI3MTguMiIgSGVpZ2h0PSIxOC45Ii8+CiAgPC9SZXBvcnRQYWdlPgo8L1JlcG9ydD4=',
    );
    lists;
  }

  void _buildFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
    } else {
      // User canceled the picker
    }

    if (result != null) {
      File file = File(result.files.single.path!);
      _file = file;

      log(file.toString());
      var fileBytes = file.readAsBytesSync();
      // log(fileBytes.toString());
      String base64 = base64Encode(fileBytes);
      _fileBase64 = base64;
      log(base64);
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _buildFile();
              },
              child: const Text('выбор файла'),
            ),
            ElevatedButton(
              onPressed: () {
                _buildCatalog();
              },
              child: const Text('каталог'),
            ),
            ElevatedButton(
              onPressed: () {
                saveFile();
              },
              child: const Text('Сохранить'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _buildCatalog() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

    if (selectedDirectory == null) {
      // User canceled the picker
    } else{
      log(selectedDirectory.toString());
      _catalog = selectedDirectory;
    }
  }

  Future<void> _buildSave() async {
    String? outputFile = await FilePicker.platform.saveFile(
      dialogTitle: 'Please select an output file:',
      fileName: 'lib/data/repositories/docum/templates.dart',
    );

    if (outputFile == null) {
      // User canceled the picker
    }
  }

  Future<String> getFilePath() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    // String appDocumentsPath = '${appDocumentsDirectory.path}/folder';
    String appDocumentsPath = _catalog;
    String filePath = '$appDocumentsPath/text.txt';
    await Directory(appDocumentsPath).create(recursive: true);
    log(appDocumentsDirectory.absolute.toString());
    log(appDocumentsPath);
    return filePath;
  }

  void saveFile() async {
    File file = File(await getFilePath());
    log(file.path);
    file.writeAsString(
        "This is my demo text that will be saved to : demoTextFile.txt");
  }

}
