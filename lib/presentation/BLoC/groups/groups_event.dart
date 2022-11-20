part of 'groups_bloc.dart';

@immutable
abstract class GroupsEvent {}

class AddNewGroupsEvent extends GroupsEvent {
  final name;
  AddNewGroupsEvent(this.name);
  //POST
}

class AddNewUserEvent extends GroupsEvent {
  //PUT
}

class GetAllUSerGroupEvent extends GroupsEvent {
  //GET
}

class LoadingGetAllGroupsEvent extends GroupsEvent {}
