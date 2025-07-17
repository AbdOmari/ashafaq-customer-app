import 'package:flutter/material.dart';
import 'package:scrreens_second_app/helper/color/app_colors.dart';

class AppConstants {
  AppConstants._();

  static const String fontFamily = 'Poppins';

  static const double defaultPadding = 16.0;
  static const double verysmallPadding = 5.0;
  static const double smallPadding = 8.0;
  static const double mediumPadding = 12.0;
  static const double largePadding = 20.0;
  static const double moreLargePadding = 30.0;
  static const double extraLargePadding = 40.0;

  static const double defaultBorderRadius = 16.0;
  static const double smallBorderRadius = 8.0;
  static const double largeBorderRadius = 20.0;

  static const double smallTextSize = 10.0;
  static const double mediumSmallTextSize = 11.0;
  static const double regularTextSize = 12.0;
  static const double mediumTextSize = 13.0;
  static const double largeTextSize = 14.0;
  static const double titleTextSize = 18.0;

  static const double iconSize = 24.0;
  static const double smallIconSize = 14.0;
  static const double chipHeight = 32.0;

  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);

  static const String svgPath = 'assets/svg/';
  static const String imagesPath = 'assets/images/';
  static const String lottiePath = 'assets/lottie/';

  // static const String drawerDeleteSvg = 'assets/icons/drawer/delete.svg';
  // static const String drawerSettingSvg = 'assets/icons/drawer/settings.svg';
  // static const String drawerCustomerSvg = 'assets/icons/drawer/Customer.svg';
  // static const String drawerpeopleSvg = 'assets/icons/drawer/people.svg';
  // static const String drawerSecuritySafeSvg =
  //     'assets/icons/drawer/security-safe.svg';
  // static const String drawerlogoutSvg = 'assets/icons/drawer/logout.svg';
  // static const String drawerWallettSvg = 'assets/icons/wallet.svg';
}

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle regular = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle bold = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle semiBold = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle medium = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontWeight: FontWeight.w500,
  );

  static TextStyle title = bold.copyWith(fontSize: AppConstants.titleTextSize);

  static TextStyle tabSelected = semiBold.copyWith(
    fontSize: AppConstants.regularTextSize,
    color: AppColors.white,
  );

  static TextStyle tabUnselected = semiBold.copyWith(
    fontSize: AppConstants.regularTextSize,
    color: AppColors.black,
  );

  static TextStyle chip = regular.copyWith(
    fontSize: AppConstants.mediumSmallTextSize,
  );

  static TextStyle status = semiBold.copyWith(
    fontSize: AppConstants.regularTextSize,
    color: AppColors.white,
  );
}
