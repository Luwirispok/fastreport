import 'dart:async';
import 'package:fastreport/data/repositories/docum/templates.dart';
import 'package:fastreport/presentation/BLoC/add_template/add_template_bloc.dart';
import 'package:fastreport/presentation/BLoC/list_view_templates/list_view_templates_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertDialogForTemplatesFourMethodsScreen extends StatelessWidget {
  final String id;
  AlertDialogForTemplatesFourMethodsScreen({Key? key, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTemplateBloc, AddTemplateState>(
      builder: (context, state) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Container(
              width: 70,
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Divider(),
                  _buildDownloadMethod(
                    context,
                    id,
                  ),
                  Divider(),
                  _buildExportMethod(
                    context,
                    id,
                  ),
                  Divider(),
                  _buildRenameMethod(
                    context,
                    id,
                  ),
                  Divider(),
                  _buildDeleteMEthod(
                    context,
                    id,
                  )
                ],
              )),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Выбор метода',
                style: TextStyle(color: Colors.blue, fontSize: 25),
              ),
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

  _buildRenameMethod(context, id) {
    return InkWell(
      onTap: () async {
        print(id);
        final answer =
            await TemplatesRepositoryImpl().updateTemplate(id, 'SuckDickMan');
      },
      child: Row(
        children: [
          Text(
            'Переименовать',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  _buildDeleteMEthod(context, id) {
    return BlocBuilder<ListViewTemplatesBloc, ListViewTemplatesState>(
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            final answer = await TemplatesRepositoryImpl().deleteTemplate(id);
            context
                .read<ListViewTemplatesBloc>()
                .add(LoadingGetAllTemplatesEvent());
            context.read<ListViewTemplatesBloc>().add(ShowAllTemplatesEvent());
            Navigator.of(context).pop();
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
