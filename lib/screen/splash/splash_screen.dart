import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_bank_project/blocs/auth/auth_bloc.dart';
import 'package:my_bank_project/blocs/user_profile/user_profile_bloc.dart';
import 'package:my_bank_project/data/models/forms_status.dart';
import 'package:my_bank_project/utils/colors/app_colors.dart';
import 'package:my_bank_project/utils/images/app_images.dart';
import 'package:my_bank_project/utils/styles/app_text_style.dart';
import 'package:my_utils/my_utils.dart';
import '../../data/local/storage_repository.dart';
import '../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {

  bool hasPin = false;
  _init(bool isAuthenticated) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    if (!mounted) return;

    if (!isAuthenticated) {
      bool isNewUser = StorageRepository.getBool(key: "is_new_user");
      debugPrint("onBoard: $isNewUser");

      if (isNewUser) {
        Navigator.pushReplacementNamed(context, RouteNames.authRoute);
      } else {
        Navigator.pushReplacementNamed(context, RouteNames.onBoardingRoute);
      }
    } else {

      if(hasPin){
        Navigator.pushReplacementNamed(context, RouteNames.enterPinRoute);


      }else{
        Navigator.pushReplacementNamed(context, RouteNames.setPinRoute);

      }

      Navigator.pushReplacementNamed(context, RouteNames.setPinRoute);
    }
  }

  @override
  void initState() {
    StorageRepository.getString(key: "pin").isNotEmpty;


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == FormsStatus.authenticated) {
          BlocProvider.of<UserProfileBloc>(context)
              .add(GetCurrentEvent(FirebaseAuth.instance.currentUser!.uid));
          _init(true);
        } else {
          _init(false);
        }
      },
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImages.splash,
            width: 200.w,
            height: 200.h,
          ),
          SizedBox(
            height: 39.h,
          ),
          Text(
            "Citibank",
            style: AppTextStyle.interBold.copyWith(
              color: AppColors.c_304FFE,
              fontSize: 66.w,
            ),
          ),
          Text(
            'The right relationship is everything.',
            style: AppTextStyle.interMedium.copyWith(
                color: AppColors.c_304FFE.withOpacity(0.7), fontSize: 18.w),
          )
        ],
      )),
    ));
  }
}
