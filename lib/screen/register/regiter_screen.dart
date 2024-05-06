import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bank_project/blocs/auth/auth_bloc.dart';
import 'package:my_bank_project/data/models/user_model.dart';
import 'package:my_bank_project/screen/auth/widget/bottom_information.dart';
import 'package:my_bank_project/screen/auth/widget/login_button.dart';
import 'package:my_bank_project/screen/routes.dart';
import 'package:my_bank_project/utils/constants/app_constants.dart';
import 'package:my_utils/my_utils.dart';

import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/images/app_images.dart';
import '../../../../utils/styles/app_text_style.dart';
import '../../data/models/forms_status.dart';
import '../auth/widget/test_field_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<AuthBloc, AuthState>(
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
                  'REGISTER',
                  style: AppTextStyle.interSemiBold
                      .copyWith(color: AppColors.black, fontSize: 22.w),
                ),
                SizedBox(
                  height: 26.h,
                ),
                TextFormFieldWidget(
                  icon: AppImages.email,
                  text: 'Username',
                  controller: usernameController,
                  validator: (value) {
                    if (value != null &&
                        !AppConstants.textRegExp.hasMatch(value)) {
                      setState(() {});
                      return 'Invalid username';
                    }
                    setState(() {});
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormFieldWidget(
                  icon: AppImages.google,
                  text: 'Last Name',
                  controller: lastnameController,
                  validator: (value) {
                    if (value != null &&
                        !AppConstants.textRegExp.hasMatch(value)) {
                      return 'Invalid last name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormFieldWidget(
                  icon: AppImages.password,
                  text: "Password",
                  isPassword: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value != null &&
                        !AppConstants.passwordRegExp.hasMatch(value)) {
                      setState(() {});
                      return 'Invalid password';
                    }
                    setState(() {});
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                TextFormFieldWidget(
                  icon: AppImages.password,
                  text: "Confirm Password",
                  isPassword: true,
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value != null &&
                        !AppConstants.passwordRegExp.hasMatch(value)) {
                      setState(() {});
                      return 'Passwords does not match';
                    }
                    setState(() {});
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                TextFormFieldWidget(
                  icon: AppImages.google,
                  text: "Phone",
                  isPassword: false,
                  controller: phoneController,
                  validator: (value) {
                    if (value != null &&
                        !AppConstants.phoneRegExp.hasMatch(value)) {
                      setState(() {});
                      return 'Invalid phone number';
                    }
                    setState(() {});
                    return null;
                  },
                ),
                SizedBox(
                  height: 35.h,
                ),
                LogInButton(
                  title: 'Register',
                  onTap: () {
                    if (isValidRegisterCredentials()) {
                      context.read<AuthBloc>().add(
                        RegisterUserEvent(
                          userModel: UserModel(
                              username: usernameController.text,
                              lastname: lastnameController.text,
                              password: passwordController.text,
                              phoneNumber: phoneController.text,
                              email:
                              "${usernameController.text
                                  .toLowerCase()}@gmail.com"
                                  .trim(),
                              imageUrl: '',
                              userId: '',
                              fcm: "",
                              authUid: ""),
                        ),
                      );
                    }
                  },
                  isReady: isValidRegisterCredentials(),
                  isLoading: state.status == FormsStatus.loading,
                ),
                SizedBox(
                  height: 13.h,
                ),
                const InformationWidget(),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Login"),
                )
              ],
            ),
          );
        },

      ),
    );
  }


  bool isValidRegisterCredentials() {
    return AppConstants.passwordRegExp.hasMatch(passwordController.text) &&
        AppConstants.textRegExp.hasMatch(usernameController.text) &&
        AppConstants.textRegExp.hasMatch(lastnameController.text) &&
        AppConstants.phoneRegExp.hasMatch(phoneController.text) &&
        passwordController.text ==
            confirmPasswordController.text;
  }


  @override
  void dispose() {
    passwordController.dispose();
    usernameController.dispose();
    lastnameController.dispose();
    phoneController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
