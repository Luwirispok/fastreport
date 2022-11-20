part of 'list_view_data_bloc.dart';

@immutable
abstract class ListViewDataEvent {}

class ShowAllDataEvent extends ListViewDataEvent {}

class LoadingGetAllDataEvent extends ListViewDataEvent {}
