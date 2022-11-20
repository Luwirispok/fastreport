part of 'list_view_api_keys_bloc.dart';

@immutable
abstract class ListViewApiKeysState {}

class ListViewApiKeysInitial extends ListViewApiKeysState {}

class ListViewInitial extends ListViewApiKeysState {}

class ShowAllApiKeysState extends ListViewApiKeysState {
  Map data = Map();
  ShowAllApiKeysState(this.data);
}

class LoadingGetAllApiKeysState extends ListViewApiKeysState {}
