part of 'add_template_bloc.dart';

@immutable
abstract class AddTemplateState {}

class AddTemplateInitial extends AddTemplateState {}

class ShowAlertState extends AddTemplateState {
  String id;
  Map<String, String> data;
  ShowAlertState(this.id, this.data);
}

class CloseAlertState extends AddTemplateState {}
