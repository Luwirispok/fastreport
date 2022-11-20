import 'package:bloc/bloc.dart';
import 'package:fastreport/data/repositories/docum/templates.dart';
import 'package:meta/meta.dart';

import '../../../domain/repositories/getFolderRepositoryId/getFolderRepositoryId.dart';

part 'list_view_templates_event.dart';
part 'list_view_templates_state.dart';

class ListViewTemplatesBloc
    extends Bloc<ListViewTemplatesEvent, ListViewTemplatesState> {
  ListViewTemplatesBloc() : super(ListViewTemplatesInitial()) {
    on<ListViewTemplatesEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ShowAllTemplatesEvent>((event, emit) async {
      final id = await GetIdentRepositoryImp().getIdForFolder();
      final data = await TemplatesRepositoryImpl().getAllTemplates(id['id']);

      emit(ShowAllTemplatesState(data));
    });
    on<LoadingGetAllTemplatesEvent>((event, emit) {
      emit(LoadingGetAllTemplatesState());
    });
  }
}
