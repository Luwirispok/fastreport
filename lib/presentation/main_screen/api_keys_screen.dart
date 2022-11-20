import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../BLoC/list_view_api_keys/list_view_api_keys_bloc.dart';

class ApiKeysScreen extends StatefulWidget {
  const ApiKeysScreen({super.key});

  @override
  State<ApiKeysScreen> createState() => _ApiKeysScreenState();
}

class _ApiKeysScreenState extends State<ApiKeysScreen> {
  @override
  void initState() {
    context.read<ListViewApiKeysBloc>().add(ShowAllApiKeysEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<ListViewApiKeysBloc, ListViewApiKeysState>(
            builder: (context, state) {
      if (state is ShowAllApiKeysState) {
        return RefreshIndicator(
          onRefresh: () async {
            context
                .read<ListViewApiKeysBloc>()
                .add(LoadingGetAllApiKeysEvent());
            context.read<ListViewApiKeysBloc>().add(ShowAllApiKeysEvent());
          },
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: ((context, index) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
                child:
                    _buildExpanded(data: state.data['apiKeys'], index: index),
              );
            }),
            separatorBuilder: ((context, index) {
              return Divider();
            }),
            itemCount:
                state.data.containsKey('count') ? state.data['count'] : 0,
          ),
        );
      } else if (state is LoadingGetAllApiKeysState) {
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
    return InkWell(
      onTap: () {
        Clipboard.setData(ClipboardData(text: data[index]['value']));
        _getFourAlertMethods();
      },
      child: Row(children: [
        Expanded(
          flex: 20,
          child: Icon(
            Icons.feed_outlined,
            size: 35,
          ),
        ),
        Expanded(
          flex: 60,
          child: Text(
            data[index]['description'],
            style: TextStyle(fontSize: 20),
          ),
        ),
      ]),
    );
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

  Future _getFourAlertMethods() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Api-Ключскопирован!'),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Закрыть'))
          ],
        );
      },
    );
  }
}
