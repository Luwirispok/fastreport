part of 'list_view_reports_bloc.dart';

@immutable
abstract class ListViewReportsEvent {}

class ShowAllReportsEvent extends ListViewReportsEvent {}

class LoadingGetAllReportsEvent extends ListViewReportsEvent {}
