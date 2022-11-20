import 'package:bloc/bloc.dart';
import 'package:fastreport/data/repositories/apikeys/apikeys.dart';
import 'package:meta/meta.dart';

import '../../../data/repositories/docum/templates.dart';
import '../../../domain/repositories/getFolderRepositoryId/getFolderRepositoryId.dart';

part 'list_view_api_keys_event.dart';
part 'list_view_api_keys_state.dart';

class ListViewApiKeysBloc
    extends Bloc<ListViewApiKeysEvent, ListViewApiKeysState> {
  ListViewApiKeysBloc() : super(ListViewApiKeysInitial()) {
    on<ShowAllApiKeysEvent>((event, emit) async {
      final data = await ApiKeysImpl().getAllTokens();
      print(data);

      emit(ShowAllApiKeysState(data));
    });
    on<LoadingGetAllApiKeysEvent>((event, emit) {
      emit(LoadingGetAllApiKeysState());
    });
  }
  var count;

  countSet(Map<String, dynamic> value) {
    count = value;
  }
}
