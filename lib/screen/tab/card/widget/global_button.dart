import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GlobalButtons extends StatelessWidget {
  const GlobalButtons({
    super.key,
    required this.icons,
    required this.voidCallback,
    required this.title,
  });

  final Icon icons;
  final VoidCallback voidCallback;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ZoomTapAnimation(
          onTap: voidCallback,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.deepPurple,
            ),
            child: icons,
          ),
        ),
        SizedBox(height:3),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}