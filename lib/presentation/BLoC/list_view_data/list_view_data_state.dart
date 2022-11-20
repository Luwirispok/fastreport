part of 'list_view_data_bloc.dart';

@immutable
abstract class ListViewDataState {}

class ListViewDataInitial extends ListViewDataState {}

class ShowAllDataState extends ListViewDataState {
  Map data = Map();
  ShowAllDataState(this.data);
}

class LoadingGetAllDataState extends ListViewDataState {}
