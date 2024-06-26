import 'package:flutter/material.dart';
import 'package:my_bank_project/screen/auth/local_auth/method_one/entry_pin_screen.dart';

import 'package:my_bank_project/screen/payment/payment_screen.dart';
import 'package:my_bank_project/screen/register/regiter_screen.dart';
import 'package:my_bank_project/screen/security/security_screen.dart';
import 'package:my_bank_project/screen/splash/splash_screen.dart';
import 'package:my_bank_project/screen/tab/card/add_card_screen.dart';
import 'package:my_bank_project/screen/tab/card/card_screen.dart';
import 'package:my_bank_project/screen/tab/tab_screen.dart';
import 'package:my_bank_project/screen/transfer/transfer_screen.dart';
import 'package:my_bank_project/screen/update_screen/update_profile_screen.dart';

import 'auth/auth_screen.dart';
import 'auth/local_auth/bio_auth/touch_id_screen.dart';
import 'auth/local_auth/method_one/confirm_pin_screen.dart';
import 'auth/local_auth/method_one/set_pin_route.dart';
import 'no_internet/no_internet_screen.dart';
import 'on_boarding/on_boarding_screen.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return navigate(const SplashScreen());

      case RouteNames.tabRoute:
        return navigate(const TabScreen());

      case RouteNames.noInternetRoute:
        return navigate(NoInternetScreen(
            onInternetComeBack: settings.arguments as VoidCallback));

      case RouteNames.transferRoute:
        return navigate(const TransferScreen());
      case RouteNames.paymentRoute:
        return navigate(const PaymentScreen());
      case RouteNames.authRoute:
        return navigate(const AuthScreen());
      case RouteNames.onBoardingRoute:
        return navigate(const OnBoardingScreen());
      case RouteNames.register:
        return navigate(const RegisterScreen());
      case RouteNames.setPinRoute:
        return navigate(const SetPinScreen());
      case RouteNames.confirmPinRoute:
        return navigate(ConfirmPinScreen(pin: settings.arguments as String));
      case RouteNames.touchIdRoute:
        return navigate(const TouchIdScreen());
      case RouteNames.enterPinRoute:
        return navigate(const EntryPinScreen());
      case RouteNames.updateProfile:
        return navigate(const UpdateProfileScreen());
      case RouteNames.cardScreen:
        return navigate(const CardScreen());

      case RouteNames.addCardScreen:
        return navigate(AddCardScreen());

      case RouteNames.securityRoute:
        return navigate(const SecurityScreen());
      default:
        return navigate(
          const Scaffold(
            body: Center(
              child: Text("This kind of rout does not exist!"),
            ),
          ),
        );
    }
  }

  static navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

class RouteNames {
  static const String splashScreen = "/";
  static const String tabRoute = "/tab_route";
  static const String authRoute = "/auth_route";
  static const String noInternetRoute = "/no_internet_route";
  static const String paymentRoute = "/payment_route";
  static const String transferRoute = "/transfer_route";
  static const String onBoardingRoute = "/on_boarding_route";
  static const String register = "/register";
  static const String setPinRoute = "/set_pin_route";
  static const String enterPinRoute = "/enter_pin_route";
  static const String confirmPinRoute = "/confirm_pin_route";
  static const String touchIdRoute = "/touch_id_route";
  static const String updateProfile = "/update_profile";
  static const String securityRoute = "/security_route";
  static const String cardScreen = "/add_card";
  static const String addCardScreen = "/add_card_screen";
}
