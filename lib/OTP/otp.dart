import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liveasy/Colors/appcolors.dart';
import 'package:liveasy/CustomWidgets/custom_button.dart';
import 'package:liveasy/CustomWidgets/textwidget.dart';
import 'package:liveasy/Fonts/fonts.dart';
import 'package:liveasy/Images/app_images.dart';
import 'package:liveasy/Profile/profile.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class Otp extends StatefulWidget {
  final String verificationId;

  const Otp({super.key, required this.verificationId});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController _otpController = TextEditingController();

  void _showToastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.blackMain,
      textColor: AppColors.white,
    );
  }

  void _verifyOTP(String otpCode) {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: otpCode,
    );

    FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((userCredential) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Profile()),
      );
    }).catchError((e) {
      _showToastMessage('Failed to verify OTP: $e');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppColors.white,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset(Images.back),
              ),
            ),
          ),
          const SizedBox(height: 48),
          const TextWidget(
            text: 'Verify Phone',
            fontweight: FontWeight.w700,
            fontsize: 20,
            fontfamily: Fonts.roboto,
          ),
          const SizedBox(height: 8),
          const TextWidget(
            text: 'Code is sent to 8094508485',
            fontweight: FontWeight.w400,
            fontsize: 14,
            fontfamily: Fonts.roboto,
            color: AppColors.featherGrey,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 36),
          PinCodeTextField(
            controller: _otpController,
            autofocus: true,
            highlight: true,
            pinBoxColor: AppColors.babyBlue,
            highlightColor: AppColors.royalBlue,
            defaultBorderColor: AppColors.babyBlue,
            hasTextBorderColor: AppColors.babyBlue,
            maxLength: 6,
            pinBoxHeight: 50,
            pinBoxWidth: 50,
            pinBoxBorderWidth: 1,
            pinTextStyle: const TextStyle(fontSize: 20),
            onDone: (pin) {
              print('Entered OTP: $pin');
              _verifyOTP(pin);
            },
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                text: 'Didn\'t receive the code?',
                color: AppColors.featherGrey,
                fontweight: FontWeight.w400,
                fontsize: 14,
              ),
              TextWidget(
                text: ' Request Again',
                color: AppColors.black,
                fontweight: FontWeight.w500,
                fontsize: 14,
              ),
            ],
          ),
          const SizedBox(height: 24),
          CustomButton(
              height: 56, width: double.infinity, text: 'VERIFY AND CONTINUE')
        ],
      ),
    ));
  }
}
