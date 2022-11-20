import 'package:fastreport/presentation/custom_widgets/list_tile.dart';
import 'package:fastreport/presentation/main_file_bloc/main_files_bloc.dart';
import 'package:fastreport/presentation/main_screen/about_products_screen.dart';
import 'package:fastreport/presentation/main_screen/api_keys_screen.dart';
import 'package:fastreport/presentation/main_screen/data_screen.dart';
import 'package:fastreport/presentation/main_screen/document_screen.dart';
import 'package:fastreport/presentation/main_screen/group_screen.dart';
import 'package:fastreport/presentation/main_screen/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../documents/templates.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Документы'),
      ),
      drawer: BlocBuilder<MainFilesBloc, MainFilesState>(
        builder: (context, state) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(
                    'FastReport Cloud',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTileW(
                  text: 'Документы',
                  icon: Icons.dock,
                  onTap: () {
                    context.read<MainFilesBloc>().add(DocumentsEvent());
                  },
                ),
                ListTileW(
                  text: 'Данные',
                  icon: Icons.dock,
                  onTap: () {
                    context.read<MainFilesBloc>().add(DataEvent());
                  },
                ),
                ListTileW(
                  text: 'Группы',
                  icon: Icons.dock,
                  onTap: () {
                    context.read<MainFilesBloc>().add(GroupsEvent());
                  },
                ),
                ListTileW(
                  text: 'Пользователи',
                  icon: Icons.dock,
                  onTap: () {
                    context.read<MainFilesBloc>().add(UsersEvent());
                  },
                ),
                ListTileW(
                  text: 'Api ключи',
                  icon: Icons.dock,
                  onTap: () {
                    context.read<MainFilesBloc>().add(ApiKeysEvent());
                  },
                ),
                ListTileW(
                  text: 'О продукте',
                  icon: Icons.dock,
                  onTap: () {
                    context.read<MainFilesBloc>().add(AboutProductEvent());
                  },
                ),
              ],
            ),
          );
        },
      ),
      body:
          BlocBuilder<MainFilesBloc, MainFilesState>(builder: (context, state) {
        if (state is DocumentsState) {
          return DocumentScreen();
        } else if (state is DataState) {
          return DataScreen();
        } else if (state is GroupsState) {
          return GroupScreen();
        } else if (state is UsersState) {
          return UsersScreen();
        } else if (state is ApiKeysState) {
          return ApiKeysScreen();
        } else if (state is AboutProductState) {
          return AboutProductScreen();
        }
        return DocumentScreen();
      }),
    );
  }
}
