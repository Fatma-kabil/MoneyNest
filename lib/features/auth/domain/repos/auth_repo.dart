// lib/features/auth/domain/repos/auth_repo.

import 'package:money_nest/features/auth/domain/entites/sign_up_enitity.dart';

abstract class AuthRepo {
  Future<void> signUp(SignUpEnitity user);
}
