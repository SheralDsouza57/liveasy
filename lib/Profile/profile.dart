import 'package:flutter/material.dart';
import 'package:liveasy/Colors/appcolors.dart';
import 'package:liveasy/CustomWidgets/custom_button.dart';
import 'package:liveasy/CustomWidgets/custom_card.dart';
import 'package:liveasy/CustomWidgets/custom_radio_button.dart';
import 'package:liveasy/CustomWidgets/textwidget.dart';
import 'package:liveasy/Fonts/fonts.dart';
import 'package:liveasy/Images/app_images.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppColors.white,
      child: Column(
        children: [
          const SizedBox(height: 112),
          const TextWidget(
            text: 'Please select your profile',
            fontfamily: Fonts.roboto,
            fontweight: FontWeight.w700,
            fontsize: 20,
          ),
          const SizedBox(height: 26),
          CustomCard(
            radioButton: CustomRadioButton(
              value: 1,
              onChanged: (newValue) {
                setState(() {
                  _selectedValue = newValue!;
                });
              },
              groupValue: _selectedValue,
            ),
            title: 'Shipper',
            subTitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
            image: Images.shipper,
          ),
          const SizedBox(height: 24),
          CustomCard(
            radioButton: CustomRadioButton(
              value: 2,
              onChanged: (newValue) {
                setState(() {
                  _selectedValue = newValue!;
                });
              },
              groupValue: _selectedValue,
            ),
            title: 'Transporter',
            subTitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
            image: Images.transporter,
          ),
          const SizedBox(height: 24),
          const CustomButton(
              height: 56, width: double.infinity, text: 'CONTINUE')
        ],
      ),
    ));
  }
}
