import 'dart:async';
import 'package:fastreport/presentation/BLoC/list_view_data/list_view_data_bloc.dart';
import 'package:fastreport/presentation/custom_widgets/alert_dialog.dart';
import 'package:fastreport/presentation/custom_widgets/alert_dialog_create_data.dart';
import 'package:fastreport/presentation/custom_widgets/alert_dialog_for_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  @override
  void initState() {
    context.read<ListViewDataBloc>().add(ShowAllDataEvent());
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
        body: BlocBuilder<ListViewDataBloc, ListViewDataState>(builder: (context, state) {
          if (state is ShowAllDataState) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<ListViewDataBloc>().add(LoadingGetAllDataEvent());
                context.read<ListViewDataBloc>().add(ShowAllDataEvent());
              },
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: ((context, index) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: _buildExpanded(data: state.data['dataSources'], index: index),
                  );
                }),
                separatorBuilder: ((context, index) {
                  return Divider();
                }),
                itemCount: state.data.containsKey('count') ? state.data['count'] : 0,
              ),
            );
          } else if (state is LoadingGetAllDataState) {
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
      const Expanded(
        flex: 20,
        child: Icon(
          Icons.dataset,
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
        return AlertDialogForCreateData();
      },
    );
  }

  Future _getFourAlertMethods(BuildContext context, String id) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialogForDataScreen(
          id: id,
        );
      },
    );
  }
}
