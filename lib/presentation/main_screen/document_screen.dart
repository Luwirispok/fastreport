import 'dart:async';
import 'package:fastreport/presentation/BLoC/list_view_templates/list_view_templates_bloc.dart';
import 'package:fastreport/presentation/main_screen/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({Key? key}) : super(key: key);

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  @override
  void initState() {
    context.read<ListViewTemplatesBloc>().add(ShowAllTemplatesEvent());
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
        body: BlocBuilder<ListViewTemplatesBloc, ListViewTemplatesState>(
            builder: (context, state) {
          if (state is ShowAllTemplatesState) {
            return ListView.separated(
                itemBuilder: ((context, index) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: _buildExpanded('Отсосать у самого себя'),
                  );
                }),
                separatorBuilder: ((context, index) {
                  return Divider();
                }),
                itemCount: 100);
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
            ;
          }
          ;
        }));
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
        return AlertDialogScreen();
      },
    );
  }
}
