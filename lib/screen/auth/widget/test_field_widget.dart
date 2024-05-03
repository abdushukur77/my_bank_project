// text_form_field_widget.dart
import 'package:flutter/material.dart';
import 'package:my_utils/my_utils.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    Key? key,
    required this.icon,
    required this.text,
    this.isPassword = false,
    required this.controller,
    this.validator,
  }) : super(key: key);

  final String icon;
  final String text;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool _isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 34.w),
      child: TextFormField(
        onChanged: (value) {
          setState(() {});
        },
        validator: widget.validator,
        controller: widget.controller,
        obscureText: widget.isPassword && !_isObscure,
        style: AppTextStyle.interMedium
            .copyWith(color: AppColors.black, fontSize: 16.w),
        decoration: InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
          hintStyle: AppTextStyle.interSemiBold,
          hintText: widget.text,
          suffixIcon: widget.isPassword
              ? IconButton(
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
            icon: Icon(
              _isObscure ? Icons.visibility : Icons.visibility_off,
            ),
          )
              : null,
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
