import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'list_view_templates_event.dart';
part 'list_view_templates_state.dart';

class ListViewTemplatesBloc
    extends Bloc<ListViewTemplatesEvent, ListViewTemplatesState> {
  ListViewTemplatesBloc() : super(ListViewTemplatesInitial()) {
    on<ListViewTemplatesEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ShowAllTemplatesEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoadingGetAllTemplatesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
