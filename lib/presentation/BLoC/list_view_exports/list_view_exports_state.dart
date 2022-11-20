part of 'list_view_exports_bloc.dart';

@immutable
abstract class ListViewExportsState {}

class ShowAllExportsState extends ListViewExportsState {
  Map data = Map();
  ShowAllExportsState(this.data);
}

class LoadingGetAllExportsState extends ListViewExportsState {}
