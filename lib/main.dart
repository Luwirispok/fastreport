import 'package:fastreport/data/repositories/docum/templates.dart';
import 'package:fastreport/domain/repositories/getFolderRepositoryId/getFolderRepositoryId.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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
    final lists = await TemplatesRepositoryImpl().createTemplate(id, 'Cock',
        'PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4KPFJlcG9ydCBTY3JpcHRMYW5ndWFnZT0iQ1NoYXJwIj4KICA8RGljdGlvbmFyeS8+CiAgPFJlcG9ydFBhZ2UgTmFtZT0iUGFnZTEiIFdhdGVybWFyay5Gb250PSJBcmlhbCwgNjBwdCI+CiAgICA8UmVwb3J0VGl0bGVCYW5kIE5hbWU9IlJlcG9ydFRpdGxlMSIgV2lkdGg9IjcxOC4yIiBIZWlnaHQ9IjM3LjgiLz4KICAgIDxQYWdlSGVhZGVyQmFuZCBOYW1lPSJQYWdlSGVhZGVyMSIgVG9wPSI0MS44IiBXaWR0aD0iNzE4LjIiIEhlaWdodD0iMjguMzUiLz4KICAgIDxEYXRhQmFuZCBOYW1lPSJEYXRhMSIgVG9wPSI3NC4xNSIgV2lkdGg9IjcxOC4yIiBIZWlnaHQ9Ijc1LjYiLz4KICAgIDxQYWdlRm9vdGVyQmFuZCBOYW1lPSJQYWdlRm9vdGVyMSIgVG9wPSIxNTMuNzUiIFdpZHRoPSI3MTguMiIgSGVpZ2h0PSIxOC45Ii8+CiAgPC9SZXBvcnRQYWdlPgo8L1JlcG9ydD4=');
    lists;
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
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
