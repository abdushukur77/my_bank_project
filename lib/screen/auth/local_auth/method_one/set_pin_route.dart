import 'package:flutter/material.dart';
import 'package:my_bank_project/screen/auth/widget/login_button.dart';
import 'package:my_bank_project/screen/routes.dart';
import 'package:my_bank_project/utils/styles/app_text_style.dart';

class SetPinRouteScreen extends StatelessWidget {
  const SetPinRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Set Pin Route",style: AppTextStyle.interBlack,),
          LogInButton(
            title: "Next",
            onTap: () {
              Navigator.pushNamed(context, RouteNames.confirmPinRoute);
            }, isLoading: true, isReady: true,
          ),
        ],
      ),
    );
  }
}
