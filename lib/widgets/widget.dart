import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:scrreens_second_app/helper/color/app_colors.dart';
import 'package:scrreens_second_app/helper/constants/app_constants.dart'
    hide AppTextStyles;
import 'package:scrreens_second_app/helper/text_styles/app_text_styles.dart';

class TextFieldWithIcon extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController? controller;

  const TextFieldWithIcon({
    Key? key,
    required this.hintText,
    required this.icon,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isRTL = context.locale.languageCode == 'ar';

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.mediumPadding,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.mediumPadding,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppConstants.smallBorderRadius),
          border: Border.all(color: AppColors.basicColor, width: 1),
        ),
        child: Row(
          children: isRTL
              ? [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: hintText,
                        border: InputBorder.none,
                        hintStyle: AppTextStyles.regular.copyWith(
                          fontSize: AppConstants.largeTextSize,
                          color: AppColors.black.withOpacity(0.5),
                        ),
                        alignLabelWithHint: true,
                      ),
                      style: AppTextStyles.regular.copyWith(
                        fontSize: AppConstants.largeTextSize,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppConstants.smallPadding),
                  Icon(icon, color: AppColors.basicColor),
                ]
              : [
                  Icon(icon, color: AppColors.basicColor),
                  const SizedBox(width: AppConstants.smallPadding),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: hintText,
                        border: InputBorder.none,
                        hintStyle: AppTextStyles.regular.copyWith(
                          fontSize: AppConstants.largeTextSize,
                          color: AppColors.black.withOpacity(0.5),
                        ),
                      ),
                      style: AppTextStyles.regular.copyWith(
                        fontSize: AppConstants.largeTextSize,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
        ),
      ),
    );
  }
}

class TextFieldNumber extends StatelessWidget {
  const TextFieldNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isRTL = context.locale.languageCode == 'ar';
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.smallPadding / 2,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.mediumPadding,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(AppConstants.smallBorderRadius),
          border: Border.all(color: AppColors.basicColor, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
          child: IntrinsicHeight(
            child: Row(
              children: isRTL
                  ? [
                      Text(
                        'auth.country_code'.tr(),
                        style: AppTextStyles.regular.copyWith(
                          fontSize: AppConstants.largeTextSize,
                          color: AppColors.basicColor,
                        ),
                      ),
                      const VerticalDivider(
                        color: Color(0x33000000),
                        thickness: 1,
                        width: 15,
                        indent: 5,
                        endIndent: 5,
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: 'SA',
                          items: const [
                            DropdownMenuItem(
                              value: 'SA',
                              child: CircleAvatar(
                                radius: 10,
                                backgroundImage: AssetImage(
                                  'assets/images/Flag-Saudi-Arabia.png',
                                ),
                              ),
                            ),
                          ],
                          onChanged: (value) {},
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.basicColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'auth.phone_hint'.tr(),
                            hintStyle: AppTextStyles.regular.copyWith(
                              fontSize: AppConstants.largeTextSize,
                              color: AppColors.black.withOpacity(0.5),
                            ),
                            alignLabelWithHint: true,
                          ),
                          style: AppTextStyles.regular.copyWith(
                            fontSize: AppConstants.largeTextSize,
                            color: AppColors.black,
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      const SizedBox(width: AppConstants.smallPadding),
                      const Icon(Icons.phone, color: AppColors.basicColor),
                    ]
                  : [
                      const Icon(Icons.phone, color: AppColors.basicColor),
                      const SizedBox(width: AppConstants.smallPadding),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'auth.phone_hint'.tr(),
                            hintStyle: AppTextStyles.regular.copyWith(
                              fontSize: AppConstants.largeTextSize,
                              color: AppColors.black.withOpacity(0.5),
                            ),
                          ),
                          style: AppTextStyles.regular.copyWith(
                            fontSize: AppConstants.largeTextSize,
                            color: AppColors.black,
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: 'SA',
                          items: const [
                            DropdownMenuItem(
                              value: 'SA',
                              child: CircleAvatar(
                                radius: 10,
                                backgroundImage: AssetImage(
                                  'assets/images/Flag-Saudi-Arabia.png',
                                ),
                              ),
                            ),
                          ],
                          onChanged: (value) {},
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.basicColor,
                          ),
                        ),
                      ),
                      const VerticalDivider(
                        color: Color(0x33000000),
                        thickness: 1,
                        width: 15,
                        indent: 5,
                        endIndent: 5,
                      ),
                      Text(
                        'auth.country_code'.tr(),
                        style: AppTextStyles.regular.copyWith(
                          fontSize: AppConstants.largeTextSize,
                          color: AppColors.basicColor,
                        ),
                      ),
                    ],
            ),
          ),
        ),
      ),
    );
  }
}

class VerifyButton extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;

  const VerifyButton({super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.largePadding,
        vertical: AppConstants.extraLargePadding,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          onPressed: onpressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.basicColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppConstants.defaultBorderRadius,
              ),
            ),
            elevation: 0,
          ),
          child: Text(
            text,
            style: AppTextStyles.semiBold.copyWith(
              fontSize: 16,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class RedirectTextWidget extends StatelessWidget {
  final String questionText;
  final String actionText;
  final VoidCallback onTap;

  const RedirectTextWidget({
    super.key,
    required this.questionText,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isRTL = context.locale.languageCode == 'ar';

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: isRTL
          ? [
              GestureDetector(
                onTap: onTap,
                child: Text(
                  actionText,
                  style: AppTextStyles.bold.copyWith(
                    fontSize: AppConstants.regularTextSize,
                    color: const Color(0xFFFFC436),
                    decoration: TextDecoration.underline,
                    decorationColor: const Color(0xFFFFC436),
                    decorationThickness: 1.5,
                  ),
                ),
              ),
              const SizedBox(width: AppConstants.smallPadding),
              Text(
                questionText,
                style: AppTextStyles.bold.copyWith(
                  fontSize: AppConstants.regularTextSize,
                  color: AppColors.black,
                ),
              ),
            ]
          : [
              Text(
                questionText,
                style: AppTextStyles.bold.copyWith(
                  fontSize: AppConstants.regularTextSize,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(width: AppConstants.smallPadding),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  actionText,
                  style: AppTextStyles.bold.copyWith(
                    fontSize: AppConstants.regularTextSize,
                    color: const Color(0xFFFFC436),
                    decoration: TextDecoration.underline,
                    decorationColor: const Color(0xFFFFC436),
                    decorationThickness: 1.5,
                  ),
                ),
              ),
            ],
    );
  }
}

class TwoTextUnder extends StatelessWidget {
  const TwoTextUnder({
    super.key,
    required this.textFirstRow,
    required this.textSecondRow,
  });

  final String textFirstRow;
  final String textSecondRow;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          textFirstRow,
          style: AppTextStyles.bold.copyWith(fontSize: 28),
          textAlign: TextAlign.center,
        ),
        Text(
          textSecondRow,
          style: AppTextStyles.bold.copyWith(fontSize: 28),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
