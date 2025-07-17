import 'package:flutter/material.dart';
import 'package:scrreens_second_app/helper/routes/app_routes.dart';
import 'package:scrreens_second_app/widgets/drawer/CustomDrawer.dart';

class Morescreen extends StatelessWidget {
  const Morescreen({super.key});
  static const String id = AppRoutes.more;

  @override
  Widget build(BuildContext context) {
    return CustomDrawer(onClose: () {});
  }
}
