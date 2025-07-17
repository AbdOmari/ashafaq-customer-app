import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scrreens_second_app/screens/HomePage_screen.dart';
import 'package:scrreens_second_app/screens/HomeTabScreen.dart';
import 'package:scrreens_second_app/screens/MoreScreen.dart';
import 'package:scrreens_second_app/screens/choose_language.dart';
import 'package:scrreens_second_app/screens/Request%20Details.dart';
import 'package:scrreens_second_app/screens/RequestCard.dart';
import 'package:scrreens_second_app/screens/Request_screen.dart';
import 'package:scrreens_second_app/screens/login_screen.dart';
import 'package:scrreens_second_app/screens/otp_screen.dart';
import 'package:scrreens_second_app/screens/profile_info_screen.dart';
import 'package:scrreens_second_app/screens/splash_screen.dart';
import 'package:scrreens_second_app/widgets/drawer/CustomDrawer.dart';

class AppRoutes {
  AppRoutes._();
  static const String splash = 'splash';
  static const String languageSelection = 'language_selection';
  static const String login = 'login';
  static const String profileInfo = 'profile_info';
  static const String homepage = 'homepage';
  static const String otp = 'otp';
  static const String more = 'more';
  static const String chat = 'chat';
  static const String homeTab = 'home_tab';
  static const String requestCard = 'request_card';
  static const String customDrawer = 'custom_drawer';
  static const String requestDetails = 'request_details';
  static const String requestsScreen = 'requests_screen';

  static const String splashPath = '/splash';
  static const String languageSelectionPath = '/language_selection';
  static const String loginPath = '/login';
  static const String profileInfoPath = '/profile_info';
  static const String homepagePath = '/homepage';
  static const String otpPath = '/otp';
  static const String morePath = '/more';
  static const String chatPath = '/chat';
  static const String homeTabPath = '/home_tab';
  static const String requestCardPath = '/request_card';
  static const String customDrawerPath = '/custom_drawer';
  static const String requestDetailsPath = '/request_details';
  static const String requestsScreenPath = '/requests_screen';
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splashPath,
  routes: [
    GoRoute(path: '/', redirect: (_, __) => AppRoutes.splashPath),
    GoRoute(
      path: AppRoutes.languageSelectionPath,
      name: AppRoutes.languageSelection,
      builder: (context, state) => const LanguageSelectionScreen(),
    ),
    GoRoute(
      path: AppRoutes.splashPath,
      name: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.loginPath,
      name: AppRoutes.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoutes.profileInfoPath,
      name: AppRoutes.profileInfo,
      builder: (context, state) => const ProfileInfo(),
    ),
    GoRoute(
      path: AppRoutes.homepagePath,
      name: AppRoutes.homepage,
      builder: (context, state) => const HomepageScreen(),
    ),
    GoRoute(
      path: AppRoutes.otpPath,
      name: AppRoutes.otp,
      builder: (context, state) => const OtpScreen(),
    ),
    GoRoute(
      path: AppRoutes.morePath,
      name: AppRoutes.more,
      builder: (context, state) => const Morescreen(),
    ),

    GoRoute(
      path: AppRoutes.homeTabPath,
      name: AppRoutes.homeTab,
      builder: (context, state) => const HomeTabScreen(),
    ),
    GoRoute(
      path: AppRoutes.requestCardPath,
      name: AppRoutes.requestCard,
      builder: (context, state) => const RequestCard(),
    ),
    GoRoute(
      path: AppRoutes.customDrawerPath,
      name: AppRoutes.customDrawer,
      builder: (context, state) => CustomDrawer(onClose: () {}),
    ),
    GoRoute(
      path: AppRoutes.requestDetailsPath,
      name: AppRoutes.requestDetails,
      builder: (context, state) => const RequestDetailsScreen(),
    ),
    GoRoute(
      path: AppRoutes.requestsScreenPath,
      name: AppRoutes.requestsScreen,
      builder: (context, state) => const RequestsScreen(),
    ),
  ],
);

extension NavigationExtension on BuildContext {
  void goToNamed(String name, {Map<String, String>? params}) {
    GoRouter.of(this).goNamed(name, pathParameters: params ?? {});
  }

  void pushNamed(String name, {Map<String, String>? params}) {
    GoRouter.of(this).pushNamed(name, pathParameters: params ?? {});
  }

  void pop() {
    GoRouter.of(this).pop();
  }
}
