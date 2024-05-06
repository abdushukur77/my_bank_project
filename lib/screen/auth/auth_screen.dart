import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bank_project/blocs/auth/auth_bloc.dart';
import 'package:my_bank_project/blocs/user_profile/user_profile_bloc.dart';
import 'package:my_bank_project/data/repositories/user_profile_repository.dart';
import 'package:my_bank_project/screen/auth/widget/bottom_information.dart';
import 'package:my_bank_project/screen/auth/widget/login_button.dart';
import 'package:my_bank_project/screen/auth/widget/test_field_widget.dart';
import 'package:my_bank_project/screen/payment/payment_screen.dart';
import 'package:my_bank_project/screen/routes.dart';
import 'package:my_bank_project/utils/constants/app_constants.dart';
import 'package:my_utils/my_utils.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/images/app_images.dart';
import '../../../../utils/styles/app_text_style.dart';
import '../../data/models/forms_status.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool k = false;

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    User? user = FirebaseAuth.instance.currentUser;
    Future.microtask(() {
      if (user != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const PaymentScreen();
        }));
      }
    });
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  isValid() {
    return AppConstants.passwordRegExp.hasMatch(passwordController.text) &&
        AppConstants.textRegExp.hasMatch(emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  AppImages.top,
                  width: 218.w,
                  height: 225.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'LOGIN',
                  style: AppTextStyle.interSemiBold
                      .copyWith(color: AppColors.black, fontSize: 22.w),
                ),
                SizedBox(
                  height: 26.h,
                ),
                TextFormFieldWidget(
                  icon: AppImages.email,
                  text: 'Username',
                  controller: emailController,
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormFieldWidget(
                  icon: AppImages.password,
                  text: "Password",
                  isPassword: true,
                  controller: passwordController,
                ),
                SizedBox(
                  height: 35.h,
                ),
                LogInButton(
                  title: 'LOGIN',
                  onTap: () {
                    context.read<AuthBloc>().add(LoginUserEvent(
                          password: passwordController.text,
                          username: emailController.text,
                        ));
                  },
                  isReady: isValid(),
                  isLoading: state.status == FormsStatus.loading,
                ),
                SizedBox(
                  height: 13.h,
                ),
                const InformationWidget()
              ],
            ),
          );
        },
        listener: (context, state) {

          if (state.status == FormsStatus.authenticated) {
            if (state.statusMessage == "registered") {
              BlocProvider.of<UserProfileBloc>(context)
                  .add(AddUserEvent(state.userModel));
            }
            Navigator.pushNamedAndRemoveUntil(
                context, RouteNames.tabRoute, (route) => false);
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
