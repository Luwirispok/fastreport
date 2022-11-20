part of 'list_view_templates_bloc.dart';

@immutable
abstract class ListViewTemplatesEvent {}

class ShowAllTemplatesEvent extends ListViewTemplatesEvent {}

class LoadingGetAllTemplatesEvent extends ListViewTemplatesEvent {}
