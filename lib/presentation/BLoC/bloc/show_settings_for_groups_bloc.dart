import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'show_settings_for_groups_event.dart';
part 'show_settings_for_groups_state.dart';

class ShowSettingsForGroupsBloc extends Bloc<ShowSettingsForGroupsEvent, ShowSettingsForGroupsState> {
  ShowSettingsForGroupsBloc() : super(ShowSettingsForGroupsInitial()) {
    on<ShowSettingsForGroupsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
