import 'package:flutter/material.dart';
import 'package:liveasy/Colors/appcolors.dart';
import 'package:liveasy/CustomWidgets/custom_radio_button.dart';
import 'package:liveasy/CustomWidgets/textwidget.dart';
import 'package:liveasy/Fonts/fonts.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.radioButton,
    required this.title,
    required this.subTitle,
    required this.image,
  });
  final CustomRadioButton radioButton;
  final String image;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 95,
      decoration: BoxDecoration(border: Border.all()),
      child: Row(
        children: [
          radioButton,
          const SizedBox(width: 16),
          Image.asset(image),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: title,
                fontfamily: Fonts.roboto,
                fontweight: FontWeight.w400,
                fontsize: 18,
                color: AppColors.blackMain,
              ),
              SizedBox(
                width: 160,
                child: TextWidget(
                  text: subTitle,
                  fontfamily: Fonts.roboto,
                  fontweight: FontWeight.w400,
                  fontsize: 12,
                  color: AppColors.featherGrey,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
