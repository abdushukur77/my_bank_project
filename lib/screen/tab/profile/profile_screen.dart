import 'package:flutter/material.dart';
import 'package:my_bank_project/utils/styles/app_text_style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile", style: AppTextStyle.interBold.copyWith(
        fontSize: 34
      ),),),
    );
  }
}
