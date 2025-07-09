import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:money_nest/core/utils/functions/firebase_error_mapper.dart';
import 'package:money_nest/features/auth/domain/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit(this.authRepo) : super(LoginInitial());
  Future<void> Login(user) async {
    emit(LoginLoading());
    try {
      await authRepo.logIn(user);
      emit(LoginSuccess());
    } catch (e) {
       emit(LoginFailure(errMessage: mapFirebaseAuthError(e.toString())));
    }
  }
}
