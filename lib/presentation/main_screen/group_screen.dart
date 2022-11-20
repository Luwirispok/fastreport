import 'dart:async';
import 'package:fastreport/presentation/BLoC/groups/groups_bloc.dart';
import 'package:fastreport/presentation/BLoC/list_view_exports/list_view_exports_bloc.dart';
// import 'package:fastreport/presentation/main_screen/alert_dialog.dart';
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
    context.read<ListViewExportsBloc>().add(ShowAllExportsEvent());
    super.initState();
  }

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
        body: BlocBuilder<ListViewExportsBloc, ListViewExportsState>(
            builder: (context, state) {
          if (state is ShowAllExportsState) {
            return RefreshIndicator(
              onRefresh: () async {
                context
                    .read<ListViewExportsBloc>()
                    .add(LoadingGetAllExportsEvent());
                context.read<ListViewExportsBloc>().add(ShowAllExportsEvent());
              },
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: ((context, index) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    child:
                        _buildExpanded(data: state.data['files'], index: index),
                  );
                }),
                separatorBuilder: ((context, index) {
                  return Divider();
                }),
                itemCount:
                    state.data.containsKey('count') ? state.data['count'] : 0,
              ),
            );
          } else if (state is LoadingGetAllExportsState) {
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
    data;
    return Row(children: [
      Expanded(
        flex: 20,
        child: Icon(
          (data[index]['type'] == 'Folder')
              ? Icons.feed_outlined
              : Icons.file_present,
          size: 35,
        ),
      ),
      Expanded(
        flex: 60,
        child: Text(
          data[index]['name'],
          style: TextStyle(fontSize: 20),
        ),
      ),
      Expanded(
        flex: 20,
        child: IconButton(
          onPressed: () {
            _getFourAlertMethods(context, data[index]['id']);
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

  Future _ackAlert(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialogForTemplatesAddTaskScreen();
      },
    );
  }

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

class AlertDialogForTemplatesAddTaskScreen extends StatelessWidget {
  const AlertDialogForTemplatesAddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupsBloc, GroupsState>(
      builder: (context, state) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: IconButton(
            onPressed: () {
              // context.read<GroupsBloc>().add(AddNewGroupsEvent());
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
                      // if (state is ShowAlertState) {

                      //   context
                      //       .read<ListViewTemplatesBloc>()
                      //       .add(LoadingGetAllTemplatesEvent());
                      //   context
                      //       .read<ListViewTemplatesBloc>()
                      //       .add(ShowAllTemplatesEvent());
                      //   Navigator.of(context).pop();
                      // }
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
