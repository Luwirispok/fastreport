import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:fastreport/data/repositories/docum/templates.dart';
import 'package:fastreport/domain/repositories/getFolderRepositoryId/getFolderRepositoryId.dart';

import 'package:fastreport/presentation/BLoC/list_view_data/list_view_data_bloc.dart';

import 'package:fastreport/presentation/BLoC/list_view_api_keys/list_view_api_keys_bloc.dart';

import 'package:fastreport/presentation/BLoC/list_view_exports/list_view_exports_bloc.dart';
import 'package:fastreport/presentation/BLoC/list_view_reports/list_view_reports_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fastreport/presentation/BLoC/main_file/main_files_bloc.dart';
import 'package:fastreport/presentation/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/BLoC/add_template/add_template_bloc.dart';
import 'presentation/BLoC/list_view_templates/list_view_templates_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainFilesBloc>(
          create: (context) => MainFilesBloc(),
        ),
        BlocProvider<AddTemplateBloc>(
          create: (context) => AddTemplateBloc(),
        ),
        BlocProvider<ListViewApiKeysBloc>(
          create: (context) => ListViewApiKeysBloc(),
        ),
        BlocProvider<ListViewTemplatesBloc>(
          create: (context) => ListViewTemplatesBloc(),
        ),
        BlocProvider<ListViewReportsBloc>(
          create: (context) => ListViewReportsBloc(),
        ),
        BlocProvider<ListViewExportsBloc>(
          create: (context) => ListViewExportsBloc(),
        ),
        BlocProvider<ListViewDataBloc>(
          create: (context) => ListViewDataBloc(),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => MainScreen(),
        },
        initialRoute: '/',
      ),
    );
  }

  Future<void> _buildCatalog() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

    if (selectedDirectory == null) {
      // User canceled the picker
    } else {
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

  // Future<String> getFilePath() async {
  //   Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
  //   // String appDocumentsPath = '${appDocumentsDirectory.path}/folder';
  //   String appDocumentsPath = _catalog;
  //   String filePath = '$appDocumentsPath/text.txt';
  //   await Directory(appDocumentsPath).create(recursive: true);
  //   log(appDocumentsDirectory.absolute.toString());
  //   log(appDocumentsPath);
  //   return filePath;
  // }
  //
  // void saveFile() async {
  //   File file = File(await getFilePath());
  //   log(file.path);
  //   file.writeAsString(
  //       "This is my demo text that will be saved to : demoTextFile.txt");
  // }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   void _incrementCounter() async {
//     final request = await GetIdentRepositoryImp().getIdForFolder();
//     final String id = request['id'];
//     // final lists = await TemplatesRepositoryImpl().getAllTemplates(id);
//     // final DynamicLists = await TemplatesRepositoryImpl().updateTemplate(
//     //   '6377865f5f620ebfce9a07cb',
//     //   'DickDickDickDickDickDickDick',
//     // );
//     // lists;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
