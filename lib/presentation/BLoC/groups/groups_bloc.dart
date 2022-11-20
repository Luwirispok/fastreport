import 'package:bloc/bloc.dart';
import 'package:fastreport/data/repositories/groups/group.dart';
import 'package:meta/meta.dart';

part 'groups_event.dart';
part 'groups_state.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  GroupsBloc() : super(LoadingGetAllGroupsState()) {
    on<AddNewGroupsEvent>((event, emit) async {
      final id = await GetGroupRepositoryIdentificatorImpl().get();

      // emit(AddNewGroupsState());
    });
    on<ShowAllUSerGroupEvent>((event, emit) async {
      Map<String, dynamic> data =
          await GetAllGroupsImpl().getAllGroup('6377865f5f620ebfce9a07ce');
      emit(ShowAllUSerGroupState(data));
    });

    on<LoadingGetAllGroupsEvent>((event, emit) {
      emit(LoadingGetAllGroupsState());
    });
    on<AddNewUserEvent>((event, emit) {
      AddNewUserState({});
    });
  }
  var count;

  countSet(Map<String, dynamic> value) {
    count = value;
  }
}








// GroupRepositoryImpl