import 'package:flutter/material.dart';
import 'package:scrreens_second_app/widgets/check_widget.dart';
import 'package:scrreens_second_app/helper/color/app_colors.dart';
import 'package:scrreens_second_app/helper/constants/app_constants.dart';
import 'package:scrreens_second_app/widgets/number_phone_widget.dart';
import 'package:scrreens_second_app/widgets/widget.dart';
import 'package:scrreens_second_app/screens/otp_screen.dart';
import 'package:scrreens_second_app/screens/signup_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:ui' as ui;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String id = "login_page";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = true;
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bool isArabic = context.locale.languageCode == 'ar';

    return Directionality(
      textDirection: isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr,
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 30),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    SizedBox(
                      width: 180,
                      height: 100,
                      child: Image.asset(
                        "${AppConstants.imagesPath}ashafaq_logo.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Directionality(
                      textDirection: isArabic
                          ? ui.TextDirection.rtl
                          : ui.TextDirection.ltr,
                      child: TwoTextUnder(
                        textFirstRow: 'auth.login_title'.tr(),
                        textSecondRow: 'auth.login_subtitle'.tr(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'auth.provide_info'.tr(),
                      style: const TextStyle(
                        color: Color(0x80000000),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: isArabic ? TextAlign.right : TextAlign.center,
                    ),
                    const SizedBox(height: 50),
                    NumberPhoneWidget(controller: phoneController),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: isArabic
                          ? [
                              CheckWidget(
                                isChecked: isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value ?? false;
                                  });
                                },
                                text: 'auth.remember_me'.tr(),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  start: 15,
                                  end: 15,
                                  top: 20,
                                  bottom: 25,
                                ),
                                child: Align(
                                  alignment: isArabic
                                      ? Alignment.centerLeft
                                      : Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      print("================");
                                    },
                                    child: Text(
                                      'auth.forgot_password'.tr(),
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        color: Color(0xFFFFC436),
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Color(0xFFFFC436),
                                        decorationThickness: 1.5,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                          : [
                              CheckWidget(
                                isChecked: isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value ?? false;
                                  });
                                },
                                text: 'auth.remember_me'.tr(),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  start: 15,
                                  end: 15,
                                  top: 20,
                                  bottom: 25,
                                ),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      print("================");
                                    },
                                    child: Text(
                                      'auth.forgot_password'.tr(),
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        color: Color(0xFFFFC436),
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Color(0xFFFFC436),
                                        decorationThickness: 1.5,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 30,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OtpScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.basicColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'auth.login'.tr(),
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    isArabic
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'auth.dont_have_account'.tr(),
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'auth.sign_up_here'.tr(),
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    color: Color(0xFFFFC436),
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFFFFC436),
                                    decorationThickness: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'auth.dont_have_account'.tr(),
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  decorationThickness: 1.5,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'auth.sign_up_here'.tr(),
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    color: Color(0xFFFFC436),
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFFFFC436),
                                    decorationThickness: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),

                    const SizedBox(height: 30),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
