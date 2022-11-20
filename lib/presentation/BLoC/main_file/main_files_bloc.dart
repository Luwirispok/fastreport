import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_files_event.dart';
part 'main_files_state.dart';

class MainFilesBloc extends Bloc<MainFilesEvent, MainFilesState> {
  MainFilesBloc() : super(DocumentsState()) {
    on<DocumentsEvent>((event, emit) {
      emit(DocumentsState());
    });
    on<DataEvent>((event, emit) {
      emit(DataState());
    });
    on<GroupsEvent>((event, emit) {
      emit(GroupsState());
    });
    on<UsersEvent>((event, emit) {
      emit(UsersState());
    });
    on<ApiKeysEvent>((event, emit) {
      emit(ApiKeysState());
    });
    on<AboutProductEvent>((event, emit) {
      emit(AboutProductState());
    });
  }
}
