import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bank_project/blocs/auth/auth_bloc.dart';
import 'package:my_bank_project/screen/routes.dart';
import 'package:my_bank_project/utils/colors/app_colors.dart';
import 'package:my_utils/my_utils.dart';
import '../../../blocs/user_profile/user_profile_bloc.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Screen"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.updateProfile);
            },
            icon: Icon(Icons.edit, size: 25),
          )
        ],
      ),
      body: BlocBuilder<UserProfileBloc, UserProfileState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 50,
                      child: Icon(
                        Icons.account_circle_rounded,
                        size: 100,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                buildInfoContainer(
                  title: "Name",
                  value: state.userModel.username,
                ),
                SizedBox(height: 15),
                buildInfoContainer(
                  title: "Last Name",
                  value: state.userModel.lastname,
                ),
                SizedBox(height: 15),
                buildInfoContainer(
                  title: "Email",
                  value: state.userModel.email,
                ),
                SizedBox(height: 15),
                buildInfoContainer(
                  title: "Phone",
                  value: state.userModel.phoneNumber,
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.securityRoute);
                  },
                  child: buildInfoContainer(
                    title: "Security",
                    value: "",
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  child: TextButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(LogOutUserEvent());
                    },
                    child: Text(
                      "Log Out",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.h,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildInfoContainer({required String title, required String value}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.c_1A72DD,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 10,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
