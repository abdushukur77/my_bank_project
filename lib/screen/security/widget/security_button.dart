import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_bank_project/utils/colors/app_colors.dart';
import 'package:my_bank_project/utils/styles/app_text_style.dart';
import 'package:my_utils/my_utils.dart';

class SecurityButton extends StatelessWidget {
  const SecurityButton(
      {super.key, required this.isEnabled, required this.onTab});

  final bool isEnabled;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTab,
        style: TextButton.styleFrom(
            backgroundColor: AppColors.white,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: Row(
          children: [
            Text(
              "Biometrics",
              style: AppTextStyle.interBold
                  .copyWith(color: AppColors.black, fontSize: 18.w),
            ),
            const Spacer(),
            CupertinoSwitch(
                value: isEnabled,
                autofocus: true,
                onChanged: (v) {
                  onTab.call();
                })
          ],
        ));
  }
}
