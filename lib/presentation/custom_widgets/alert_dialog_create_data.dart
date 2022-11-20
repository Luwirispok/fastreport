import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:fastreport/data/repositories/docum/data.dart';
import 'package:fastreport/data/repositories/docum/templates.dart';
import 'package:fastreport/presentation/BLoC/add_template/add_template_bloc.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BLoC/list_view_templates/list_view_templates_bloc.dart';

class AlertDialogForCreateData extends StatelessWidget {
  AlertDialogForCreateData({Key? key}) : super(key: key);
  final TextEditingController textEditingControllerCreate = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    // await DataRepositoryImpl().createDataSources(
                    //   id,
                    //   'json',
                    //   'Json="$data64"',
                    //   'JSON',
                    // );
                    // log("Создание json");
                    // updatingListOfFilesAndFolders();
                    // Navigator.of(context).pop();
                  },
                  child: Text('Готово'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
