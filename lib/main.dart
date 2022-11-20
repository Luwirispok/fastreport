import 'package:fastreport/data/repositories/docum/templates.dart';
import 'package:fastreport/domain/repositories/getFolderRepositoryId/getFolderRepositoryId.dart';
import 'package:fastreport/presentation/add_template/add_template_bloc.dart';

import 'package:fastreport/presentation/main_file_bloc/main_files_bloc.dart';
import 'package:fastreport/presentation/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

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
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => MainScreen(),
        },
        initialRoute: '/',
      ),
    );
  }
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
