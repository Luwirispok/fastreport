part of 'list_view_templates_bloc.dart';

@immutable
abstract class ListViewTemplatesState {}

class ListViewTemplatesInitial extends ListViewTemplatesState {}

class ShowAllTemplatesState extends ListViewTemplatesState {}

class LoadingGetAllTemplatesState extends ListViewTemplatesState {}
