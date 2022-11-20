import 'dart:async';

import 'package:fastreport/data/repositories/groups/group.dart';
import 'package:fastreport/presentation/BLoC/bloc/show_settings_for_groups_bloc.dart';

import 'package:fastreport/presentation/BLoC/groups/groups_bloc.dart';
import 'package:fastreport/presentation/BLoC/list_view_exports/list_view_exports_bloc.dart';
import 'package:fastreport/presentation/custom_widgets/alert_dialog_document/alert_dialog_for_templates_four_methods.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  State<GroupScreen> createState() => _GroupScreennState();
}

class _GroupScreennState extends State<GroupScreen> {
  @override
  void initState() {
    context.read<GroupsBloc>().add(ShowAllUSerGroupEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<GroupsBloc>().add(ShowAllUSerGroupEvent());
          },
          child: Icon(Icons.add),
          elevation: 100,
        ),
        body: BlocBuilder<GroupsBloc, GroupsState>(builder: (context, state) {
          if (state is ShowAllUSerGroupState) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<GroupsBloc>().add(LoadingGetAllGroupsEvent());
                context.read<GroupsBloc>().add((ShowAllUSerGroupEvent()));
                // context.read<GroupsSettingsBloc>().add(ShowAllUSerGroupEvent());
              },
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: ((context, index) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: _buildExpanded(data: state.data, index: index),
                  );
                }),
                separatorBuilder: ((context, index) {
                  return Divider();
                }),
                itemCount:
                    state.data.containsKey('count') ? state.data['count'] : 0,
              ),
            );
          } else if (state is LoadingGetAllGroupsEvent) {
            return SizedBox(
              child: Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: _buildExpandedShimmer(),
                      );
                    }),
              ),
            );
          } else {
            return SizedBox(
              child: Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: _buildExpandedShimmer(),
                      );
                    }),
              ),
            );
          }
        }));
  }

  _buildExpanded({data, index}) {
    return Row(children: [
      Expanded(
        flex: 20,
        child: Icon(
          Icons.file_present,
          size: 35,
        ),
      ),
      Expanded(
        flex: 60,
        child: Text(
          data['groups'][index]['name'],
          style: TextStyle(fontSize: 20),
        ),
      ),
      Expanded(
        flex: 20,
        child: IconButton(
          onPressed: () {
            _getFourAlertMethods(context, data['groups'][index]['id']);
          },
          icon: const Icon(
            Icons.more_horiz_outlined,
            size: 35,
          ),
        ),
      ),
    ]);
  }

  _buildExpandedShimmer() {
    return Row(children: [
      const Expanded(
        flex: 20,
        child: Icon(
          Icons.circle_rounded,
          size: 45,
        ),
      ),
      Expanded(
          flex: 60,
          child: Container(
            height: 20,
            width: 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.grey),
          )),
      Expanded(
        flex: 20,
        child: Icon(
          Icons.more_horiz_outlined,
          size: 35,
        ),
      ),
    ]);
  }

  // Future _ackAlert(BuildContext context) {
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialogForTemplatesFourMethodsScreen();
  //     },
  //   );
  // }

  Future _getFourAlertMethods(BuildContext context, String id) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialogForTemplatesFourMethodsScreen(
          id: id, onChanged: () {}, funcRename: (String text) {  }, funcDelete: () {},

        );
      },
    );
  }
}

class AlertDialogForTemplatesFourMethodsScreen extends StatefulWidget {
  final String id;

  AlertDialogForTemplatesFourMethodsScreen({Key? key, required this.id})
      : super(key: key);

  @override
  State<AlertDialogForTemplatesFourMethodsScreen> createState() =>
      _AlertDialogForTemplatesFourMethodsScreenState();
}

class _AlertDialogForTemplatesFourMethodsScreenState
    extends State<AlertDialogForTemplatesFourMethodsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowSettingsForGroupsBloc, ShowSettingsForGroupsState>(
      builder: (context, state) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: 250,
            width: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Divider(),
                _buildRenameMethod(
                  context,
                  widget.id,
                ),
                Divider(),
                _buildDeleteMethod(
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
                      print(textEditingController.value.text);
                      final answer = await GroupRepositoryRenameGroupImpl()
                          .renameGroup(id, textEditingController.value.text);
                      print(answer);
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

  _buildDeleteMethod(context, id) {
    return InkWell(
      onTap: () async {
        final answer = GroupRepositoryDeleteGroupImpl().deleteGroup(id);
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
  }

  void updatingListOfFilesAndFolders() {
    context.read<GroupsBloc>().add(LoadingGetAllGroupsEvent());
    context.read<GroupsBloc>().add(ShowAllUSerGroupEvent());
    Navigator.of(context).pop();
  }
}
