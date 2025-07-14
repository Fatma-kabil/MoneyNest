import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_nest/features/auth/presentation/views/login_page.dart';
import 'package:money_nest/features/home/data/user_app_model.dart';
import 'package:money_nest/features/home/presentation/manager/user/user_cubit.dart';
import 'package:money_nest/features/home/presentation/views/widgets/account_info.dart';
import 'package:money_nest/features/home/presentation/views/widgets/account_settings.dart';



class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId != null) {
      context.read<UserCubit>().fetchUserData(userId);
    }

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserLoaded) {
          final AppUser user = state.user;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              AccountInfo(user: user),

              AccountSettings(),
            ],
          );
        } else if (state is UserError) {
          return Center(child: Text(state.message));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
