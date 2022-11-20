part of 'list_view_reports_bloc.dart';

@immutable
abstract class ListViewReportsState {}

class ListViewReportsInitial extends ListViewReportsState {}

class ShowAllReportsState extends ListViewReportsState {
  Map data = Map();
  ShowAllReportsState(this.data);
}

class LoadingGetAllReportsState extends ListViewReportsState {}
