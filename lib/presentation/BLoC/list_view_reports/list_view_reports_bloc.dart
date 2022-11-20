import 'package:bloc/bloc.dart';
import 'package:fastreport/data/repositories/docum/reports.dart';
import 'package:meta/meta.dart';

import '../../../domain/repositories/getFolderRepositoryId/getFolderRepositoryId.dart';

part 'list_view_reports_event.dart';
part 'list_view_reports_state.dart';

class ListViewReportsBloc
    extends Bloc<ListViewReportsEvent, ListViewReportsState> {
  ListViewReportsBloc() : super(ListViewReportsInitial()) {
    on<ListViewReportsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ShowAllReportsEvent>((event, emit) async {
      final id = await GetIdentRepositoryImp().getIdForFolder('Reports');
      await ReportsRepositoryImpl().getCountReports(id['id']).then((value) => countSet(value));
      final data = await ReportsRepositoryImpl().getAllReports(id['id'], "${count['count']}");

      emit(ShowAllReportsState(data));
    });
    on<LoadingGetAllReportsEvent>((event, emit) {
      emit(LoadingGetAllReportsState());
    });
  }
  var count;

  countSet(Map<String, dynamic> value) {
    count = value;
  }
}
