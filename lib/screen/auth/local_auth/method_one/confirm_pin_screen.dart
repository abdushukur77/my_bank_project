import 'package:flutter/material.dart';

import '../../../routes.dart';
import '../../widget/login_button.dart';

class ConfirmPinScreen extends StatelessWidget {
  const ConfirmPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text("Confirm Pin Scree"),
          LogInButton(
            title: "Next",
            onTap: () {
              Navigator.pushNamed(context, RouteNames.touchIdRoute);
            }, isLoading: true, isReady: true,
          ),
        ],
      ),
    );
  }
}
