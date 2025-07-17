import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:scrreens_second_app/helper/color/app_colors.dart';
import 'package:scrreens_second_app/widgets/custom_arrow_back.dart';
import 'package:scrreens_second_app/widgets/widget.dart';
import 'package:scrreens_second_app/screens/HomePage_screen.dart';
import 'dart:ui' as ui;

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});
  static const String id = "OtpScreen";

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  bool isOtpComplete = false;

  void _onChanged(String value, int index) {
    if (value.length == 1 && index < 3) {
      _focusNodes[index + 1].requestFocus();
    }

    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    bool complete = _controllers.every(
      (controller) => controller.text.trim().length == 1,
    );
    setState(() {
      isOtpComplete = complete;
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isArabic = context.locale.languageCode == 'ar';

    return Directionality(
      textDirection: isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Image.asset(
                        'assets/images/ashafaq_logo.png',
                        height: 75,
                        width: 150,
                      ),
                    ),
                  ),

                  isArabic
                      ? const Positioned(
                          top: 40,

                          left: null,
                          right: 0,
                          child: CustomArrowBack(),
                        )
                      : const Positioned(
                          top: 40,

                          left: 0,
                          right: null,
                          child: CustomArrowBack(),
                        ),
                ],
              ),
            ),

            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: TwoTextUnder(
                    textFirstRow: 'auth.write_otp'.tr(),
                    textSecondRow: '',
                  ),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "auth.enter_code".tr(args: ["+966 6677 628910"]),
                    textAlign: isArabic ? TextAlign.center : TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: TextField(
                            controller: _controllers[index],
                            focusNode: _focusNodes[index],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              counterText: '',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onChanged: (value) => _onChanged(value, index),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 75),

                Center(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      side: const BorderSide(color: Colors.black),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    child: Text(
                      "auth.no_code_received".tr(),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: isArabic ? TextAlign.right : TextAlign.center,
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: isOtpComplete
                        ? () {
                            String otp = _controllers.map((c) => c.text).join();
                            print("OTP is: $otp");
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomepageScreen(),
                              ),
                            );
                          }
                        : null,
                    style:
                        ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 0,
                        ).copyWith(
                          backgroundColor: WidgetStateProperty.all(
                            AppColors.basicColor,
                          ),
                        ),
                    child: Text(
                      "auth.send_otp".tr(),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
