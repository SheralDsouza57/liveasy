import 'package:flutter/material.dart';
import 'package:liveasy/Colors/appcolors.dart';
import 'package:liveasy/CustomWidgets/textwidget.dart';
import 'package:liveasy/Fonts/fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.height,
    required this.width,
    this.onTap,
    required this.text,
  });
  final double height;
  final double width;
  final Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        color: AppColors.royalBlue,
        child: Center(
          child: TextWidget(
            text: text,
            fontfamily: Fonts.montserrat,
            color: AppColors.white,
            fontweight: FontWeight.w700,
            fontsize: 16,
          ),
        ),
      ),
    );
  }
}
