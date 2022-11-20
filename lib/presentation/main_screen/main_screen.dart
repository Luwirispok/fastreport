import 'package:fastreport/presentation/BLoC/main_file/main_files_bloc.dart';
import 'package:fastreport/presentation/custom_widgets/list_tile.dart';
import 'package:fastreport/presentation/main_screen/about_products_screen.dart';
import 'package:fastreport/presentation/main_screen/api_keys_screen.dart';
import 'package:fastreport/presentation/main_screen/data_screen.dart';
import 'package:fastreport/presentation/main_screen/exports_screen.dart';
import 'package:fastreport/presentation/main_screen/reports_screen;.dart';
import 'package:fastreport/presentation/main_screen/templates_screen.dart';
import 'package:fastreport/presentation/main_screen/group_screen.dart';
import 'package:fastreport/presentation/main_screen/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String title = 'Шаблоны';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(title),
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
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Документы',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      ListTileW(
                        text: 'Шаблоны',
                        icon: Icons.document_scanner_sharp,
                        onTap: () {
                          setState(() {
                            title = 'Шаблоны';
                          });
                          _scaffoldKey.currentState?.openEndDrawer();
                          context.read<MainFilesBloc>().add(TemplatesEvent());

                        },
                      ),
                      ListTileW(
                        text: 'Отчеты',
                        icon: Icons.restore_page_outlined,
                        onTap: () {
                          setState(() {
                            title = 'Отчеты';
                          });
                          _scaffoldKey.currentState?.openEndDrawer();
                          context.read<MainFilesBloc>().add(ReportsEvent());

                        },
                      ),
                      ListTileW(
                        text: 'Экспорты',
                        icon: Icons.import_export,
                        onTap: () {
                          setState(() {
                            title = 'Экспорты';
                          });
                          _scaffoldKey.currentState?.openEndDrawer();
                          context.read<MainFilesBloc>().add(ExportsEvent());

                        },
                      ),
                    ],
                  ),
                ),
                ListTileW(
                  text: 'Данные',
                  icon: Icons.data_object,
                  onTap: () {
                    setState(() {
                      title = 'Данные';
                    });
                    _scaffoldKey.currentState?.openEndDrawer();
                    context.read<MainFilesBloc>().add(DataEvent());
                  },
                ),
                ListTileW(
                  text: 'Группы',
                  icon: Icons.group,
                  onTap: () {
                    setState(() {
                      title = 'Группы';
                    });
                    _scaffoldKey.currentState?.openEndDrawer();
                    context.read<MainFilesBloc>().add(GroupsEvent());
                  },
                ),
                ListTileW(
                  text: 'Пользователи',
                  icon: Icons.supervised_user_circle_sharp,
                  onTap: () {
                    setState(() {
                      title = 'Пользователи';
                    });
                    _scaffoldKey.currentState?.openEndDrawer();
                    context.read<MainFilesBloc>().add(UsersEvent());
                  },
                ),
                ListTileW(
                  text: 'Api ключи',
                  icon: Icons.key,
                  onTap: () {
                    setState(() {
                      title = 'Api ключи';
                    });
                    _scaffoldKey.currentState?.openEndDrawer();
                    context.read<MainFilesBloc>().add(ApiKeysEvent());
                  },
                ),
                ListTileW(
                  text: 'О продукте',
                  icon: Icons.info_outline,
                  onTap: () {
                    setState(() {
                      title = 'О продукте';
                    });
                    _scaffoldKey.currentState?.openEndDrawer();
                    context.read<MainFilesBloc>().add(AboutProductEvent());
                  },
                ),
              ],
            ),
          );
        },
      ),
      body: BlocBuilder<MainFilesBloc, MainFilesState>(builder: (context, state) {
        if (state is TemplatesState) {
          return TemplatesScreen();
        } else if (state is ReportsState) {
          return ReportsScreen();
        } else if (state is ExportsState) {
          return ExportsScreen();
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
        return TemplatesScreen();
      }),
    );
  }
}
