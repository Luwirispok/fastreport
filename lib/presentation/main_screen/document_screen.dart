import 'dart:async';

import 'package:fastreport/core/FileImportAndExport.dart';
import 'package:fastreport/data/repositories/docum/templates.dart';
import 'package:fastreport/presentation/add_template/add_template_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _ackAlert(context);
          },
          child: Icon(Icons.add),
          elevation: 100,
        ),
        body: ListView.separated(
            itemBuilder: ((context, index) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: _buildExpanded('Отсосать у самого себя'),
              );
            }),
            separatorBuilder: ((context, index) {
              return Divider();
            }),
            itemCount: 100));
  }

  _buildExpanded(name) {
    return Row(children: [
      const Expanded(
        flex: 20,
        child: Icon(
          Icons.feed_outlined,
          size: 35,
        ),
      ),
      Expanded(
        flex: 60,
        child: Text(
          name,
          style: TextStyle(fontSize: 20),
        ),
      ),
      Expanded(
        flex: 20,
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_horiz_outlined,
            size: 35,
          ),
        ),
      ),
    ]);
  }

  Future _ackAlert(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialogScreen();
      },
    );
  }
}

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
