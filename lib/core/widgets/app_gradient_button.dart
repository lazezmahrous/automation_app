import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';

class AppGradientButton extends StatelessWidget {
  AppGradientButton(
      {super.key,
      required this.size,
      required this.text,
      required this.onPressed});
  final Size size;
  final String text;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // لون الظل مع شفافية
              spreadRadius: .2, // مدى انتشار الظل
              blurRadius: 10, // مقدار التمويه
              offset: const Offset(0, 10), // موقع الظل (x,y)
            ),
          ],
          gradient: LinearGradient(
            colors: [
              ColorsManager.secondBlueColor,
              ColorsManager.mainBlue,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(50.r),
        ),
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
