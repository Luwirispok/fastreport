import 'dart:async';
import 'package:fastreport/data/repositories/docum/templates.dart';
import 'package:fastreport/presentation/BLoC/add_template/add_template_bloc.dart';
import 'package:fastreport/presentation/BLoC/list_view_templates/list_view_templates_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertDialogForTemplatesFourMethodsScreen extends StatefulWidget {
  final String id;

  AlertDialogForTemplatesFourMethodsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<AlertDialogForTemplatesFourMethodsScreen> createState() => _AlertDialogForTemplatesFourMethodsScreenState();
}

class _AlertDialogForTemplatesFourMethodsScreenState extends State<AlertDialogForTemplatesFourMethodsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTemplateBloc, AddTemplateState>(
      builder: (context, state) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: expandMenu ? 350 : 250,
            width: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Divider(),
                _buildDownloadMethod(
                  context,
                  widget.id,
                ),
                Divider(),
                _buildExportMethod(
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

  _buildDownloadMethod(context, id) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Text(
            'Скачать',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  _buildExportMethod(context, id) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Text(
            'Экспортировать',
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
                      final answer =
                          await TemplatesRepositoryImpl().updateTemplate(id, textEditingController.value.text);
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
    context.read<ListViewTemplatesBloc>().add(LoadingGetAllTemplatesEvent());
    context.read<ListViewTemplatesBloc>().add(ShowAllTemplatesEvent());
    Navigator.of(context).pop();
  }

  _buildDeleteMEthod(context, id) {
    return BlocBuilder<ListViewTemplatesBloc, ListViewTemplatesState>(
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            final answer = await TemplatesRepositoryImpl().deleteTemplate(id);
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
}
