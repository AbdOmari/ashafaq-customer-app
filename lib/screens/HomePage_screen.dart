import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:scrreens_second_app/helper/color/app_colors.dart';
import 'package:scrreens_second_app/helper/constants/app_constants.dart'
    hide AppTextStyles;
import 'package:scrreens_second_app/helper/routes/app_routes.dart';
import 'package:scrreens_second_app/screens/HomeTabScreen.dart';
import 'package:scrreens_second_app/screens/RequestCard.dart';
import 'package:scrreens_second_app/widgets/drawer/CustomDrawer.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key, this.initialIndex = 0});
  static const String id = AppRoutes.homepage;

  final int initialIndex;

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  bool _isDrawerOpen = false;
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  final List<IconData> _icons = [
    Icons.home_rounded,
    Icons.calendar_today,
    Icons.grid_view_rounded,
  ];

  final List<String> _labels = [
    "nav.home".tr(),
    "nav.requests".tr(),
    "nav.more".tr(),
  ];

  final List<Widget> _screens = [
    const HomeTabScreen(),
    const RequestCard(),
    const SizedBox(),
  ];

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  Widget buildNavItem(int index, bool isArabic) {
    final IconData icon = _icons[index];
    final String label = _labels[index];
    final bool isSelected = _selectedIndex == index;

    final bool isMore = index == 2;
    final bool showBubble =
        (index == 0 && _selectedIndex == 0) ||
        (index == 1 && _selectedIndex == 1);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isMore) {
            _isDrawerOpen = true;
          } else {
            _isDrawerOpen = false;
            _selectedIndex = index;
          }
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showBubble)
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: AppColors.basicColor,
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
              ),
              child: Center(
                child: Icon(icon, color: AppColors.white, size: 22),
              ),
            )
          else ...[
            Icon(
              icon,
              color: isSelected ? AppColors.basicColor : AppColors.black,
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.basicColor : AppColors.black,
                fontSize: AppConstants.regularTextSize,
                fontWeight: FontWeight.w600,
              ),
              textAlign: isArabic ? TextAlign.right : TextAlign.left,
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isArabic = context.locale.languageCode == 'ar';

    return Directionality(
      textDirection: isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
            _screens[_selectedIndex],

            if (_isDrawerOpen)
              BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(color: Colors.black.withOpacity(0.2)),
              ),

            if (_isDrawerOpen)
              Align(
                alignment: isArabic
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: CustomDrawer(onClose: _toggleDrawer),
              ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(color: AppColors.shadowColor, blurRadius: 8),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  textDirection: isArabic
                      ? ui.TextDirection.rtl
                      : ui.TextDirection.ltr,
                  children: [
                    buildNavItem(0, isArabic),
                    buildNavItem(1, isArabic),
                    buildNavItem(2, isArabic),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
