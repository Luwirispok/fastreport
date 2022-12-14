import 'package:bloc/bloc.dart';
import 'package:fastreport/core/FileImportAndExport.dart';
import 'package:fastreport/domain/repositories/getFolderRepositoryId/getFolderRepositoryId.dart';
import 'package:flutter/material.dart';
part 'add_template_event.dart';
part 'add_template_state.dart';

class AddTemplateBloc extends Bloc<AddTemplateEvent, AddTemplateState> {
  AddTemplateBloc() : super(AddTemplateInitial()) {
    on<AddTemplateEvent>((event, emit) {});
    on<ShowAlertEvent>((event, emit) async {
      final id = await GetIdentRepositoryImp().getIdForFolder('Templates');
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
