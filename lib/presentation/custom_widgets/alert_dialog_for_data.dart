import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:fastreport/data/repositories/docum/data.dart';
import 'package:fastreport/data/repositories/docum/templates.dart';
import 'package:fastreport/presentation/BLoC/add_template/add_template_bloc.dart';
import 'package:fastreport/presentation/BLoC/list_view_data/list_view_data_bloc.dart';
import 'package:fastreport/presentation/BLoC/list_view_templates/list_view_templates_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertDialogForDataScreen extends StatefulWidget {
  final String id;

  AlertDialogForDataScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<AlertDialogForDataScreen> createState() => _AlertDialogForDataScreenState();
}

class _AlertDialogForDataScreenState extends State<AlertDialogForDataScreen> {
  late final TextEditingController textEditingControllerCreate;

  @override
  void initState() {
    textEditingControllerCreate = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTemplateBloc, AddTemplateState>(
      builder: (context, state) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: expandMenu ? 350 : 250,
            width: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Divider(),
                _buildCreateMethod(
                  context,
                  widget.id,
                ),
                Divider(),
                _buildUpdateMethod(
                  context,
                  widget.id,
                ),
                Divider(),
                _buildRenameMethod(
                  context,
                  widget.id,
                ),
                Divider(),
                _buildDeleteMEthod(
                  context,
                  widget.id,
                )
              ],
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Выбор метода',
                style: TextStyle(color: Colors.blue, fontSize: 25),
              ),
              // const SizedBox(width: 15),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.red,
                  )),
            ],
          ),
        );
      },
    );
  }

  _buildCreateMethod(context, id) {
    return InkWell(
      onTap: () async {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return _buildTextEditAlert(id);
          },
        );

      },
      child: Row(
        children: [
          Text(
            'Создать',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  _buildUpdateMethod(context, id) {
    return InkWell(
      onTap: () async {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return _buildTextEditAlert(id);
          },
        );
      },
      child: Row(
        children: [
          Text(
            'Изменить',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  bool expandMenu = false;
  TextEditingController textEditingController = TextEditingController();

//   () async {
  _buildRenameMethod(context, id) {
    return AnimatedSize(
      duration: Duration(milliseconds: 200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                expandMenu = !expandMenu;
              });
            },
            child: SizedBox(
              width: 250,
              child: Text(
                expandMenu ? 'Введите название (без .frx)' : 'Переименовать',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: expandMenu ? 10 : 0),
          expandMenu
              ? TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                )
              : const SizedBox(),
          SizedBox(height: expandMenu ? 10 : 0),
          expandMenu
              ? Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      print(id);
                      final answer = await DataRepositoryImpl().renameDataSources(id, textEditingController.value.text);
                      FocusScope.of(context).unfocus();
                      updatingListOfFilesAndFolders();
                    },
                    child: const Text('Переименовать'),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  void updatingListOfFilesAndFolders() {
    context.read<ListViewDataBloc>().add(LoadingGetAllDataEvent());
    context.read<ListViewDataBloc>().add(ShowAllDataEvent());
    Navigator.of(context).pop();
  }

  _buildDeleteMEthod(context, id) {
    return BlocBuilder<ListViewTemplatesBloc, ListViewTemplatesState>(
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            final answer = await DataRepositoryImpl().deleteDataSources(id);
            updatingListOfFilesAndFolders();
          },
          child: Row(
            children: [
              Text(
                'Удалить',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  _buildTextEditAlert(String id) {
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            padding: const EdgeInsets.all(5),
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Json',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    height: 400,
                    child: SingleChildScrollView(
                      child: TextField(
                        controller: textEditingControllerCreate,
                        maxLines: null,
                        decoration: const InputDecoration(border: OutlineInputBorder()),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var data = Uint8List.fromList(textEditingControllerCreate.value.text.codeUnits);
                      var data64 = base64Encode(data);
                      await DataRepositoryImpl().createDataSources(
                        id,
                        'json',
                        'Json="$data64"',
                        'JSON',
                      );
                      log("Создание json");
                      updatingListOfFilesAndFolders();
                      Navigator.of(context).pop();
                    },
                    child: Text('Готово'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
