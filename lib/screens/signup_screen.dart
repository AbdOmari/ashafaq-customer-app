import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:scrreens_second_app/widgets/BottomSheet.dart';
import 'package:scrreens_second_app/widgets/check_widget.dart';
import 'package:scrreens_second_app/helper/constants/app_constants.dart';
import 'package:scrreens_second_app/widgets/number_phone_widget.dart';
import 'package:scrreens_second_app/widgets/widget.dart';
import 'package:scrreens_second_app/screens/login_screen.dart';
import 'dart:ui' as ui;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

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
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 180,
                      height: 100,
                      child: Image.asset(
                        "${AppConstants.imagesPath}ashafaq_logo.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      alignment: isArabic ? Alignment.center : Alignment.center,
                      padding: const EdgeInsetsDirectional.only(
                        start: 20,
                        end: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: isArabic
                            ? CrossAxisAlignment.center
                            : CrossAxisAlignment.center,
                        children: [
                          Text(
                            "auth.create_new".tr(),
                            style: const TextStyle(
                              fontSize: 28,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "auth.account".tr(),
                            style: const TextStyle(
                              fontSize: 28,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      alignment: isArabic ? Alignment.center : Alignment.center,
                      padding: const EdgeInsetsDirectional.only(
                        start: 20,
                        end: 20,
                      ),
                      child: Text(
                        "auth.ready_new_account".tr(),
                        style: const TextStyle(
                          color: Color(0x80000000),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: isArabic
                            ? TextAlign.center
                            : TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 50),

                    TextFieldWithIcon(
                      hintText: "auth.full_name".tr(),
                      icon: Icons.person,
                      controller: nameController,
                    ),
                    const SizedBox(height: 20),

                    NumberPhoneWidget(controller: phoneController),
                    const SizedBox(height: 20),

                    TextFieldWithIcon(
                      hintText: "auth.email".tr(),
                      icon: Icons.email,
                      controller: emailController,
                    ),
                    const SizedBox(height: 10),

                    CheckWidget(
                      isChecked: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                      },
                      text: 'auth.accept_terms'.tr(),
                    ),
                    VerifyButton(
                      text: "auth.sign_up".tr(),
                      onpressed: () {
                        showSuccessBottomSheet(context, () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        });
                      },
                    ),

                    RedirectTextWidget(
                      questionText: "auth.already_have_account".tr(),
                      actionText: "auth.sign_in_here".tr(),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                    ),
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
