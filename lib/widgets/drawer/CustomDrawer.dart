import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:scrreens_second_app/screens/HomePage_screen.dart';
import 'package:scrreens_second_app/screens/login_screen.dart';
import 'package:scrreens_second_app/screens/profile_info_screen.dart';

import 'dart:ui' as ui;

class CustomDrawer extends StatelessWidget {
  final VoidCallback onClose;

  const CustomDrawer({super.key, required this.onClose});
  static const String id = "CustomDrawer";

  @override
  Widget build(BuildContext context) {
    final bool isArabic = context.locale.languageCode == 'ar';

    return Directionality(
      textDirection: isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr,
      child: Material(
        elevation: 0,
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: isArabic ? Radius.zero : const Radius.circular(25),
          bottomRight: isArabic ? Radius.zero : const Radius.circular(25),
          topLeft: isArabic ? const Radius.circular(25) : Radius.zero,
          bottomLeft: isArabic ? const Radius.circular(25) : Radius.zero,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: isArabic ? Radius.zero : const Radius.circular(25),
              bottomRight: isArabic ? Radius.zero : const Radius.circular(25),
              topLeft: isArabic ? const Radius.circular(25) : Radius.zero,
              bottomLeft: isArabic ? const Radius.circular(25) : Radius.zero,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: isArabic
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.end,
                  children: isArabic
                      ? [
                          IconButton(
                            icon: const Icon(
                              Icons.close_rounded,
                              color: Colors.red,
                            ),
                            onPressed: onClose,
                          ),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "M. Elmohandes",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "mohamed00@gmail.com",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          const CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                              "assets/images/profile_photo.jpg",
                            ),
                          ),
                        ]
                      : [
                          const CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                              "assets/images/profile_photo.jpg",
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "M. Elmohandes",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "mohamed00@gmail.com",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.close_rounded,
                              color: Color.fromARGB(255, 41, 23, 113),
                            ),
                            onPressed: onClose,
                          ),
                        ],
                ),
              ),

              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 10),

              _buildMenuItem(
                context: context,
                icon: Icons.account_balance_wallet_outlined,
                title: "drawer.account".tr(),
                isArabic: isArabic,
              ),
              _buildMenuItem(
                context: context,
                icon: Icons.account_balance_wallet_outlined,
                title: "drawer.wallet".tr(),
                isArabic: isArabic,
              ),
              _buildMenuItem(
                context: context,
                icon: Icons.phone_outlined,
                title: "drawer.contact".tr(),
                isArabic: isArabic,
              ),
              _buildMenuItem(
                context: context,
                icon: Icons.star_border_outlined,
                title: "drawer.ratings".tr(),
                isArabic: isArabic,
              ),
              _buildMenuItem(
                context: context,
                icon: Icons.settings_outlined,
                title: "drawer.settings".tr(),
                isArabic: isArabic,
              ),
              _buildMenuItem(
                context: context,
                icon: Icons.info_outline,
                title: "drawer.about".tr(),
                isArabic: isArabic,
              ),
              _buildMenuItem(
                context: context,
                icon: Icons.shield_outlined,
                title: "drawer.privacy".tr(),
                isArabic: isArabic,
              ),
              _buildMenuItem(
                context: context,
                icon: Icons.description_outlined,
                title: "drawer.terms".tr(),
                isArabic: isArabic,
              ),

              const Divider(),

              _buildMenuItem(
                context: context,
                icon: Icons.delete_outline,
                title: "drawer.delete".tr(),
                isArabic: isArabic,
                isRed: true,
              ),
              _buildMenuItem(
                context: context,
                icon: Icons.logout_outlined,
                title: "drawer.logout".tr(),
                isArabic: isArabic,
                isRed: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required bool isArabic,
    bool isRed = false,
  }) {
    return InkWell(
      onTap: () {
        if (title == "drawer.account".tr()) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfileInfo()),
          );
        } else if (title == "drawer.logout".tr()) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (Route<dynamic> route) => false,
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            // ✅ أيقونة البداية
            Icon(icon, color: isRed ? Colors.red : Colors.indigo[900]),
            const SizedBox(width: 16),

            // ✅ النص في المنتصف
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: isRed ? Colors.red : Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
                textAlign: isArabic ? TextAlign.right : TextAlign.left,
              ),
            ),

            // ✅ السهم في النهاية حسب اللغة
            Icon(
              isArabic ? Icons.arrow_forward_ios : Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}
