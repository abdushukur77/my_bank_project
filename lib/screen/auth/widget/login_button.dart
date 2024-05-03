import 'package:flutter/material.dart';
import 'package:my_utils/my_utils.dart';

import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/styles/app_text_style.dart';

class LogInButton extends StatefulWidget {
  const LogInButton({
    super.key,
    required this.title,
    required this.onTap,
     required this.isLoading,
     required this.isReady,
  });

  final String title;
  final VoidCallback onTap;
  final bool isLoading;
  final bool isReady;

  @override
  State<LogInButton> createState() => _LogInButtonState();
}

class _LogInButtonState extends State<LogInButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 34.w),
      width: width,
      child: TextButton(
          onPressed:widget.onTap,
          style: TextButton.styleFrom(
              backgroundColor:
                  AppColors.c_1317DD ,
              padding: EdgeInsets.symmetric(vertical: 16.h)),
          child: Center(
            child: (widget.isLoading)
                ? SizedBox(width: 26.w,height:26.h,child:  CircularProgressIndicator(color: AppColors.white,),)
                : Text(
              widget.title,
                    style: AppTextStyle.interSemiBold
                        .copyWith(color: AppColors.white, fontSize: 13.w),
                  ),
          )),
    );
  }
}
