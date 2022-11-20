import 'package:bloc/bloc.dart';
import 'package:fastreport/core/FileImportAndExport.dart';
import 'package:fastreport/data/repositories/docum/templates.dart';
import 'package:meta/meta.dart';

import '../../domain/repositories/getFolderRepositoryId/getFolderRepositoryId.dart';

part 'add_template_event.dart';
part 'add_template_state.dart';

class AddTemplateBloc extends Bloc<AddTemplateEvent, AddTemplateState> {
  AddTemplateBloc() : super(AddTemplateInitial()) {
    on<AddTemplateEvent>((event, emit) {});
    on<ShowAlertEvent>((event, emit) async {
      final id = await GetIdentRepositoryImp().getIdForFolder();
      Map<String, String> data =
          await FileImportAndExport().importFileToBase64().then((value) => {
                'name': '${value!["name"]}',
                'base64': '${value!["base64"]}',
              });
      emit(ShowAlertState(id['id'], data));
    });
    on<CloseAlertEvent>((event, emit) {
      emit(CloseAlertState());
    });
  }
}
