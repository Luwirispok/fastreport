part of 'groups_bloc.dart';

@immutable
abstract class GroupsState {}

class AddNewGroupsState extends GroupsState {
  Map data = Map();
  AddNewGroupsState(this.data);
  //POST
}

class AddNewUserState extends GroupsState {
  Map data = Map();
  AddNewUserState(this.data);
  //PUT
}

class ShowAllUSerGroupState extends GroupsState {
  Map data = Map();
  ShowAllUSerGroupState(this.data);
  //GET
}

class LoadingGetAllGroupsState extends GroupsState {}
