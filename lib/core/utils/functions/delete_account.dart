import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_nest/core/utils/widgets/show_custom_snackbar.dart';
import 'package:money_nest/features/auth/presentation/views/login_page.dart';

void deleteAccount(BuildContext context) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await user.delete(); // حذف الحساب
      await FirebaseAuth.instance.signOut(); // تسجيل الخروج

      // عرض رسالة نجاح
      showCustomSnackBar(
        context: context,
        message: '✅ Your account has been deleted successfully.\n✅ تم حذف حسابك بنجاح.',
        isSuccess: true,
      );

      // انتظار صغير علشان تظهر الرسالة قبل الانتقال
      await Future.delayed(Duration(milliseconds: 600));

      // توجيه لصفحة تسجيل الدخول
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginPage()),
      );
    } else {
      showCustomSnackBar(
        context: context,
        message: '❌ No user is currently signed in.\n❌ لا يوجد مستخدم مسجل دخول حالياً.',
        isSuccess: false,
      );
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'requires-recent-login') {
      showCustomSnackBar(
        context: context,
        message: '⚠️ For your security, please log in again before deleting your account.\n⚠️ لأسباب أمنية، يرجى تسجيل الدخول مرة أخرى قبل حذف الحساب.',
        isSuccess: false,
      );
    } else if (e.code == 'network-request-failed') {
      showCustomSnackBar(
        context: context,
        message: '❌ No internet connection. Please check your connection and try again.\n❌ لا يوجد اتصال بالإنترنت، حاول مرة أخرى.',
        isSuccess: false,
      );
    } else {
      debugPrint('Firebase error: ${e.message}');
      showCustomSnackBar(
        context: context,
        message: '❌ Something went wrong. Please try again.\n❌ حدث خطأ ما، يرجى المحاولة مرة أخرى.',
        isSuccess: false,
      );
    }
  } catch (e) {
    debugPrint('Unexpected error: $e');
    showCustomSnackBar(
      context: context,
      message: '❌ An unexpected error occurred. Please try again.\n❌ حصل خطأ غير متوقع، حاول مرة تانية.',
      isSuccess: false,
    );
  }
}
