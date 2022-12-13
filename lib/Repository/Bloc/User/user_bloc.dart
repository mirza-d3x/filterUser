import 'package:bloc/bloc.dart';
import 'package:creativelabs/Model/get_user_details.dart';
import 'package:creativelabs/Repository/Api/UserApi/user_api.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  late GetUserDetailsModel getUserDetailsModel;
  UserApi userApi;

  UserBloc(this.userApi) : super(UserInitial()) {
    on<GetAllUserDetailsEvent>((event, emit) async {
      emit(UserLoading());
      try {
        getUserDetailsModel = await userApi.getAllUsers();
        emit(UserLoaded());
      } catch (e) {
        emit(UserError());
      }
    });
  }
}
