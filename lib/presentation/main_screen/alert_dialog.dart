import 'dart:async';
import 'package:fastreport/data/repositories/docum/templates.dart';
import 'package:fastreport/presentation/BLoC/add_template/add_template_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BLoC/list_view_templates/list_view_templates_bloc.dart';

class AlertDialogForTemplatesAddTaskScreen extends StatelessWidget {
  const AlertDialogForTemplatesAddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTemplateBloc, AddTemplateState>(
      builder: (context, state) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: IconButton(
            onPressed: () {
              context.read<AddTemplateBloc>().add(ShowAlertEvent());
            },
            icon: Icon(
              Icons.upload_file,
              size: 40,
              color: Colors.blue,
            ),
          ),
          title: const Center(
              child: Text(
            'Добавить шаблон',
            style: TextStyle(fontSize: 25),
          )),
          actions: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Отмена',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )),
                TextButton(
                    onPressed: () {
                      if (state is ShowAlertState) {
                        TemplatesRepositoryImpl().createTemplate(
                            state.id,
                            state.data['name'] ?? '',
                            state.data['base64'] ?? '');
                        context
                            .read<ListViewTemplatesBloc>()
                            .add(LoadingGetAllTemplatesEvent());
                        context
                            .read<ListViewTemplatesBloc>()
                            .add(ShowAllTemplatesEvent());
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(
                      'Создать',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )),
              ],
            ),
          ],
        );
      },
    );
  }
}
