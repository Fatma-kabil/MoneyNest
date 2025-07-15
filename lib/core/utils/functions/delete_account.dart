import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_nest/features/auth/presentation/views/login_page.dart';

void deleteAccount(BuildContext context) async {
  final scaffoldMessenger = ScaffoldMessenger.of(context);
  final navigator = Navigator.of(context);

  try {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final uid = user.uid;
      final firestore = FirebaseFirestore.instance;

      // 🧍‍♀️ 1. حذف بيانات المستخدم
      await firestore.collection('Users').doc(uid).delete();

      // 💸 2. حذف كل المصروفات المرتبطة بالمستخدم
      final expenses = await firestore
          .collection('Expenses')
          .where('userId', isEqualTo: uid)
          .get();

      for (var doc in expenses.docs) {
        await doc.reference.delete();
      }

      // 🗂️ 3. حذف كل التصنيفات المرتبطة بالمستخدم
      final categories = await firestore
          .collection('categories')
          .where('userId', isEqualTo: uid)
          .get();

      for (var doc in categories.docs) {
        await doc.reference.delete();
      }

      // ✅ 4. عرض رسالة نجاح قبل حذف الحساب من Firebase Auth
      scaffoldMessenger.showSnackBar(
         SnackBar(
          content: Text(
            '✅ Account deleted successfully.\n✅ تم حذف حسابك بنجاح.',
          ),
          backgroundColor: Colors.green,
           behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
        ),
      );

      // ⏳ انتظار علشان تظهر الرسالة قبل حذف الحساب
      await Future.delayed(const Duration(seconds: 1));

      // 🔐 5. حذف حساب Firebase Auth
      await user.delete();

      // 🚪 6. تسجيل الخروج
      await FirebaseAuth.instance.signOut();

      // ↩️ 7. التوجيه لصفحة تسجيل الدخول
      navigator.pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => LoginPage()),
        (route) => false,
      );
    } else {
      scaffoldMessenger.showSnackBar(
         SnackBar(
          content: Text('❌ No user is currently signed in.'),
          behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
        ),
      );
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'requires-recent-login') {
      scaffoldMessenger.showSnackBar(
         SnackBar(
          content: Text(
            '⚠️ Please log in again before deleting your account.\n⚠️ يرجى تسجيل الدخول مرة أخرى.',
          ),
          behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
        ),
      );
    } else if (e.code == 'network-request-failed') {
      scaffoldMessenger.showSnackBar(
         SnackBar(
          content: Text(
            '❌ No internet connection. Please try again.\n❌ لا يوجد اتصال بالإنترنت.',
          ), behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
        ),
      );
    } 
  } catch (e) {
    debugPrint('Unexpected error: $e');
    scaffoldMessenger.showSnackBar(
       SnackBar(
        content: Text('❌ Unexpected error occurred. Try again.'),
         behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      ),
    );
  }
}
