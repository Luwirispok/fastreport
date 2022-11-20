import 'package:bloc/bloc.dart';
import 'package:fastreport/data/repositories/docum/exports.dart';
import 'package:meta/meta.dart';

import '../../../domain/repositories/getFolderRepositoryId/getFolderRepositoryId.dart';

part 'list_view_exports_event.dart';
part 'list_view_exports_state.dart';

class ListViewExportsBloc
    extends Bloc<ListViewExportsEvent, ListViewExportsState> {
  ListViewExportsBloc() : super(LoadingGetAllExportsState()) {
    on<ListViewExportsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ShowAllExportsEvent>((event, emit) async {
      final id = await GetIdentRepositoryImp().getIdForFolder('Exports');
      await ExportsRepositoryImpl()
          .getCountExports(id['id'])
          .then((value) => countSet(value));
      final data = await ExportsRepositoryImpl()
          .getAllExports(id['id'], "${count['count']}");

      emit(ShowAllExportsState(data));
    });
    on<LoadingGetAllExportsEvent>((event, emit) {
      emit(LoadingGetAllExportsState());
    });
  }
  var count;

  countSet(Map<String, dynamic> value) {
    count = value;
  }
}
