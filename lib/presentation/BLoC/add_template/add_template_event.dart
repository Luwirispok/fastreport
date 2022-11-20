part of 'add_template_bloc.dart';

@immutable
abstract class AddTemplateEvent {}

class ShowAlertEvent extends AddTemplateEvent {}

class CloseAlertEvent extends AddTemplateEvent {}
