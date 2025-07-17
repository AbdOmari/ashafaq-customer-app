import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:scrreens_second_app/screens/choose_language.dart';
import 'package:scrreens_second_app/helper/constants/app_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String id = "SplashScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          "${AppConstants.lottiePath}intro.json",
          repeat: false,
          onLoaded: (composition) {
            Future.delayed(composition.duration, () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LanguageSelectionScreen(),
                ),
              );
            });
          },
        ),
      ),
    );
  }
}
