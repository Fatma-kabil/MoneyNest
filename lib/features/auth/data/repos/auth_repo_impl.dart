// lib/features/auth/data/repos/auth_repo_impl.dart


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:money_nest/features/auth/domain/entites/sign_up_enitity.dart';

import '../../domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> signUp(SignUpEnitity user) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );

    await _firestore.collection('Users').doc(credential.user!.uid).set({
      'name': user.name,
      'email': user.email,
      'income': user.income,
    });
  }
}
