import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liveasy/Colors/appcolors.dart';
import 'package:liveasy/CustomWidgets/custom_button.dart';
import 'package:liveasy/CustomWidgets/textwidget.dart';
import 'package:liveasy/Fonts/fonts.dart';
import 'package:liveasy/Images/app_images.dart';
import 'package:liveasy/OTP/otp.dart';
import 'package:liveasy/Profile/profile.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FocusNode focusNode = FocusNode();
  Color textFieldColor = AppColors.black;
  double width = 1.0;
  String _inputValue = '';

  _validateInput(String value) {
    if (value.isEmpty) {
      _showToastMessage('Please enter a number');
    } else if (value.isNotEmpty && value.length < 10) {
      _showToastMessage('Please enter a 10 digit number');
    } else if (int.tryParse(value) == null) {
      _showToastMessage('This is not a valid number');
    } else {
      //input is valid
      _verifyPhoneNumber(value);
    }
  }

  void _verifyPhoneNumber(String phoneNumber) {
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Automatically signing in the user.
        await FirebaseAuth.instance.signInWithCredential(credential);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Profile()),
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        _showToastMessage('$e');
        print(e);
      },
      codeSent: (String verificationId, int? resendToken) {
        // Navigate to OTP screen with verificationId
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Otp(verificationId: verificationId)),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-retrieval timeout, handle according to your needs
      },
    );
  }

  void _showToastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.blackMain,
      textColor: AppColors.white,
    );
  }

  @override
  void initState() {
    focusNode.addListener(_handleFocusChange);
    super.initState();
  }

  void _handleFocusChange() {
    if (focusNode.hasFocus) {
      setState(() {
        textFieldColor = AppColors.freshBlue; // Change to blue when focused
        width = 2;
      });
    } else {
      setState(() {
        textFieldColor =
            AppColors.black; // Change back to grey when not focused
        width = 1;
      });
    }
  }

  @override
  void dispose() {
    focusNode.removeListener(_handleFocusChange);
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
                    padding: const EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset(Images.cancel),
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                const TextWidget(
                  text: 'Please enter your mobile number',
                  fontweight: FontWeight.w700,
                  fontsize: 20,
                  fontfamily: Fonts.roboto,
                ),
                const SizedBox(height: 8),
                const SizedBox(
                  width: 200,
                  child: TextWidget(
                    text: 'You\'ll receive a 4 digit code to verify next.',
                    fontweight: FontWeight.w400,
                    fontsize: 14,
                    fontfamily: Fonts.roboto,
                    color: AppColors.featherGrey,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: textFieldColor, width: width)),
                  height: 48,
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      Image.asset(Images.india),
                      const SizedBox(width: 8),
                      const TextWidget(
                        text: ' +91   -    ',
                        fontfamily: Fonts.montserrat,
                        fontweight: FontWeight.w400,
                        fontsize: 16,
                        color: AppColors.blackMain,
                      ),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          autofocus: true,
                          maxLength: 10,
                          focusNode: focusNode,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                            hintText: 'Mobile Number',
                            hintStyle: TextStyle(
                                color: AppColors.featherGrey,
                                fontFamily: Fonts.montserrat,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                          onChanged: (value) {
                            _inputValue = value;
                          },
                          // onSaved: (value) {
                          // _inputValue = value!;
                          // _validateInput(value);
                          // },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                CustomButton(
                  onTap: () {
                    _validateInput(_inputValue);
                  },
                  height: 56,
                  width: double.infinity,
                  text: 'CONTINUE',
                ),
              ],
            ),
          ),
          Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Image.asset(
                Images.background2,
                fit: BoxFit.contain,
              ))
        ],
      ),
    );
  }
}
