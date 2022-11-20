part of 'main_files_bloc.dart';

@immutable
abstract class MainFilesEvent {}

class DocumentsEvent extends MainFilesEvent {}

class DataEvent extends MainFilesEvent {}

class GroupsEvent extends MainFilesEvent {}

class UsersEvent extends MainFilesEvent {}

class ApiKeysEvent extends MainFilesEvent {}

class AboutProductEvent extends MainFilesEvent {}
