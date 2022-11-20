import 'package:bloc/bloc.dart';
import 'package:fastreport/data/repositories/docum/data.dart';
import 'package:meta/meta.dart';

import '../../../domain/repositories/getFolderRepositoryId/getFolderRepositoryId.dart';

part 'list_view_data_event.dart';
part 'list_view_data_state.dart';

class ListViewDataBloc
    extends Bloc<ListViewDataEvent, ListViewDataState> {
  ListViewDataBloc() : super(ListViewDataInitial()) {
    on<ListViewDataEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ShowAllDataEvent>((event, emit) async {
      final id = await GetIdentRepositoryImp().getIdForFolder('Exports');
      // await DataRepositoryImpl().getCountData(id['subscriptionId']).then((value) => countSet(value));
      final data = await DataRepositoryImpl().getAllData(id['subscriptionId']);

      emit(ShowAllDataState(data));
    });
    on<LoadingGetAllDataEvent>((event, emit) {
      emit(LoadingGetAllDataState());
    });
  }
  var count;

  countSet(Map<String, dynamic> value) {
    count = value;
  }
}
