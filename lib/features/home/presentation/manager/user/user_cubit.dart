import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:money_nest/features/home/data/user_app_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  
  Future<void> fetchUserData(String uid) async {
    emit(UserLoading());
    try {
      final doc = await FirebaseFirestore.instance.collection('Users').doc(uid).get();
      final user = AppUser.fromFirestore(doc);
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError('Failed to load user data'));
    }
  }
}
