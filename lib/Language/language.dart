import 'package:flutter/material.dart';
import 'package:liveasy/Colors/appcolors.dart';
import 'package:liveasy/CustomWidgets/custom_button.dart';
import 'package:liveasy/CustomWidgets/textwidget.dart';
import 'package:liveasy/Fonts/fonts.dart';
import 'package:liveasy/Images/app_images.dart';
import 'package:liveasy/Login/login.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  List<String> list = <String>['English', 'Hindi', 'French', 'Arabic'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: AppColors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Images.icon),
                const SizedBox(height: 30),
                const TextWidget(
                  text: 'Please select your Language',
                  fontweight: FontWeight.w700,
                  fontsize: 20,
                  fontfamily: Fonts.roboto,
                ),
                const SizedBox(height: 8),
                const SizedBox(
                  width: 200,
                  child: TextWidget(
                    text: 'You can change the language at any time.',
                    fontweight: FontWeight.w400,
                    fontsize: 14,
                    fontfamily: Fonts.roboto,
                    color: AppColors.featherGrey,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  decoration: BoxDecoration(border: Border.all()),
                  height: 48,
                  child: DropdownMenu<String>(
                    menuHeight: null,
                    width: 216,
                    trailingIcon: Image.asset(Images.dropdown),
                    initialSelection: list.first,
                    textStyle: const TextStyle(
                        fontFamily: Fonts.montserrat,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.blackMain),
                    onSelected: (String? value) {
                      setState(() {});
                    },
                    inputDecorationTheme: const InputDecorationTheme(
                        border: InputBorder.none,
                        constraints: BoxConstraints.expand(height: 40),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                    dropdownMenuEntries:
                        list.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 24),
                CustomButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  height: 48,
                  width: 216,
                  text: 'NEXT',
                ),
              ],
            ),
          ),
          Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Image.asset(
                Images.background,
                fit: BoxFit.contain,
              ))
        ],
      ),
    );
  }
}
