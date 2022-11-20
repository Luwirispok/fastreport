import 'dart:async';
import 'package:fastreport/presentation/BLoC/list_view_exports/list_view_exports_bloc.dart';
import 'package:fastreport/presentation/custom_widgets/alert_dialog.dart';
import 'package:fastreport/presentation/main_screen/alert_dialog_for_templates_four_,methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ExportsScreen extends StatefulWidget {
  const ExportsScreen({Key? key}) : super(key: key);

  @override
  State<ExportsScreen> createState() => _ExportsScreenState();
}

class _ExportsScreenState extends State<ExportsScreen> {
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
        body: BlocBuilder<ListViewExportsBloc, ListViewExportsState>(builder: (context, state) {
          if (state is ShowAllExportsState) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<ListViewExportsBloc>().add(LoadingGetAllExportsEvent());
                context.read<ListViewExportsBloc>().add(ShowAllExportsEvent());
              },
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: ((context, index) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: _buildExpanded(data: state.data['files'], index: index),
                  );
                }),
                separatorBuilder: ((context, index) {
                  return Divider();
                }),
                itemCount: state.data.containsKey('count') ? state.data['count'] : 0,
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
          (data[index]['type'] == 'Folder') ? Icons.feed_outlined : Icons.file_present,
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
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey),
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
          id: id,
        );
      },
    );
  }
}
