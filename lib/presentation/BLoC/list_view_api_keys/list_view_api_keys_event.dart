part of 'list_view_api_keys_bloc.dart';

@immutable
abstract class ListViewApiKeysEvent {}

class ShowAllApiKeysEvent extends ListViewApiKeysEvent {}

class LoadingGetAllApiKeysEvent extends ListViewApiKeysEvent {}
