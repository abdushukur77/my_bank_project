import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_utils/my_utils.dart';

import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/styles/app_text_style.dart';

class TextCardField extends StatefulWidget {
  const TextCardField({super.key, required this.hint, required this.typew, required this.cnt});

  final String hint;
  final TextInputType typew;
  final TextEditingController cnt;



  @override
  State<TextCardField> createState() => _TextCardFieldState();
}

class _TextCardFieldState extends State<TextCardField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 34.w),
      child: TextFormField(
        controller: widget.cnt,
        keyboardType: widget.typew,
        // keyboardType: typew,
        onChanged: (value) {
          setState(() {});
        },
        // validator: widget.validator,
        // controller: widget.controller,
        // obscureText: widget.isPassword && !_isObscure,
        style: AppTextStyle.interMedium
            .copyWith(color: AppColors.black, fontSize: 16.w),
        decoration: InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
          hintStyle: AppTextStyle.interSemiBold,
          hintText: widget.hint,
          // suffixIcon: widget.isPassword
          //     ? IconButton(
          //   onPressed: () {
          //     setState(() {
          //       _isObscure = !_isObscure;
          //     });
          //   },
          //   icon: Icon(
          //     _isObscure ? Icons.visibility : Icons.visibility_off,
          //   ),
          // )
          //     : null,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1.w, color: AppColors.black.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(9),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1.w, color: AppColors.black.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(9),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.w, color: Colors.red),
            borderRadius: BorderRadius.circular(9),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.w, color: Colors.red),
            borderRadius: BorderRadius.circular(9),
          ),
        ),
      ),
    );
  }
}
