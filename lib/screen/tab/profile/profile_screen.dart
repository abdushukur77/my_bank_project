import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bank_project/blocs/auth/auth_bloc.dart';
import 'package:my_bank_project/blocs/user_profile/user_profile_bloc.dart';
import 'package:my_bank_project/data/models/forms_status.dart';
import 'package:my_bank_project/screen/routes.dart';
import 'package:my_bank_project/utils/styles/app_text_style.dart';
import 'package:my_utils/my_utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {





  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: AppTextStyle.interBold.copyWith(fontSize: 34),
        ),
      ),
      body: BlocBuilder<UserProfileBloc, UserProfileState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  state.userModel.email,
                  style: AppTextStyle.interBold.copyWith(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                Text(
                  state.userModel.username,
                  style: AppTextStyle.interBold.copyWith(
                    fontSize: 24,
                  ),
                ),
                Text(
                  state.userModel.lastname,
                  style: AppTextStyle.interBold.copyWith(
                    fontSize: 24,
                  ),
                ),
                Text(
                  state.userModel.email,
                  style: AppTextStyle.interBold.copyWith(
                    fontSize: 24,
                  ),
                ),
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state.status == FormsStatus.unauthenticated) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, RouteNames.authRoute, (route) => false);
                    }
                  },
                  child: IconButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(LogOutUserEvent());
                      },
                      icon: Icon(Icons.logout)),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
