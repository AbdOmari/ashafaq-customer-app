import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:scrreens_second_app/screens/login_screen.dart';
import 'package:scrreens_second_app/helper/color/app_colors.dart';
import 'package:scrreens_second_app/helper/constants/app_constants.dart';
import 'dart:ui' as ui;

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});
  static const String id = "LanguageSelectionScreen";

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String selectedLanguage = "en";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          selectedLanguage = context.locale.languageCode;
        });
      }
    });
  }

  final List<Map<String, dynamic>> languages = [
    {
      "code": "ar",
      "label": "عربي",
      "flag": "${AppConstants.imagesPath}Flags/sau.png",
    },
    {
      "code": "en",
      "label": "English",
      "flag": "${AppConstants.imagesPath}Flags/usa.png",
    },
    {
      "code": "hi",
      "label": "हिन्दी",
      "flag": "${AppConstants.imagesPath}Flags/ind.png",
    },
    {
      "code": "bn",
      "label": "বাংলা",
      "flag": "${AppConstants.imagesPath}Flags/bd.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final bool isArabic = context.locale.languageCode == 'ar';

    return Directionality(
      textDirection: isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColors.white,

        body: Padding(
          padding: const EdgeInsetsDirectional.only(
            start: AppConstants.defaultPadding,
            end: AppConstants.defaultPadding,
            top: AppConstants.extraLargePadding,
          ),
          child: Directionality(
            textDirection: isArabic
                ? ui.TextDirection.rtl
                : ui.TextDirection.ltr,
            child: Column(
              children: [
                Text(
                  "settings.language".tr(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                ),
                const SizedBox(height: 20),

                ...languages.map((lang) {
                  final isSelected = selectedLanguage == lang["code"];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedLanguage = lang["code"];
                        context.setLocale(Locale(lang["code"]));
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF1A1E51)
                              : Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: isSelected
                            ? const Color(0xFFF7F7FF)
                            : Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: isArabic
                            ? [
                                Image.asset(
                                  lang["flag"],
                                  width: 34,
                                  height: 34,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    lang["label"],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                    ),

                                    textAlign: isArabic
                                        ? TextAlign.right
                                        : TextAlign.left,
                                  ),
                                ),
                                if (isSelected)
                                  const Icon(
                                    Icons.check_box_rounded,
                                    color: Color(0xFF1A1E51),
                                  ),
                              ]
                            : [
                                Image.asset(
                                  lang["flag"],
                                  width: 34,
                                  height: 34,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    lang["label"],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                if (isSelected)
                                  const Icon(
                                    Icons.check_box_rounded,
                                    color: Color(0xFF1A1E51),
                                  ),
                              ],
                      ),
                    ),
                  );
                }).toList(),

                const Spacer(),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.basicColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppConstants.smallBorderRadius,
                        ),
                      ),
                    ),
                    child: Text(
                      "auth.continue".tr(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
