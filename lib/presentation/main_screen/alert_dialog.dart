import 'dart:async';
import 'package:fastreport/data/repositories/docum/templates.dart';
import 'package:fastreport/presentation/BLoC/add_template/add_template_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertDialogScreen extends StatelessWidget {
  const AlertDialogScreen({Key? key}) : super(key: key);

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
                        state.data[''];
                        TemplatesRepositoryImpl().createTemplate(
                            state.id,
                            state.data['name'] ?? '',
                            state.data['base64'] ?? '');
                        Timer.periodic(Duration(seconds: 1), (timer) {
                          if (timer.tick == 1) {
                            Navigator.of(context).pop();
                            return;
                          }
                        });
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
