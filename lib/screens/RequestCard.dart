import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:scrreens_second_app/helper/color/app_colors.dart';
import 'package:scrreens_second_app/helper/constants/app_constants.dart';
import 'package:scrreens_second_app/screens/Request%20Details.dart';

class RequestCard extends StatefulWidget {
  const RequestCard({super.key});
  static const String id = "RequestCard";

  @override
  State<RequestCard> createState() => _RequestCardState();
}

class _RequestCardState extends State<RequestCard> {
  int _selectedTabIndex = 0;

  final List<String> _tabs = [
    "request.all",
    "request.zone_requests",
    "request.accepted",
    "request.processing",
  ];

  @override
  Widget build(BuildContext context) {
    final bool isRTL = context.locale.languageCode == 'ar';

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: isRTL
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(
              bottom: AppConstants.largePadding,
              left: AppConstants.verysmallPadding,
              right: AppConstants.verysmallPadding,
              top: AppConstants.moreLargePadding,
            ),
            child: Text(
              "request.requests".tr(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: false,
            child: Row(
              mainAxisAlignment: isRTL
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: List.generate(_tabs.length, (index) {
                final tabsToShow = _tabs;
                final displayIndex = index;
                return _buildTab(
                  tabsToShow[displayIndex].tr(),
                  isSelected: _selectedTabIndex == displayIndex,
                  onTap: () => setState(() => _selectedTabIndex = displayIndex),
                );
              }),
            ),
          ),
          const SizedBox(height: 25),

          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RequestDetailsScreen(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: isRTL
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: isRTL
                        ? [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.canceledRed,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                "request.canceled".tr(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SvgPicture.asset(
                              "${AppConstants.svgPath}saving_package.svg",
                              height: 60,
                            ),
                          ]
                        : [
                            SvgPicture.asset(
                              "${AppConstants.svgPath}saving_package.svg",
                              height: 60,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.canceledRed,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                "request.canceled".tr(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                  ),
                  const SizedBox(height: 10),

                  Text(
                    "request.request_number".tr(args: ["240"]),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: isRTL
                        ? [
                            Row(
                              children: [
                                Text(
                                  "request.price_per_wash".tr(args: ["43"]),
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Image.asset(
                                  "${AppConstants.imagesPath}rial.png",
                                  width: 14,
                                  color: AppColors.basicColor,
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Text(
                                  "request.car_name".tr(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Image.asset(
                                  "${AppConstants.imagesPath}car_plate.png",
                                  height: 45,
                                ),
                              ],
                            ),
                          ]
                        : [
                            Row(
                              children: [
                                Image.asset(
                                  "${AppConstants.imagesPath}car_plate.png",
                                  height: 45,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "request.car_name".tr(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "${AppConstants.imagesPath}rial.png",
                                  width: 14,
                                  color: AppColors.basicColor,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "request.price_per_wash".tr(args: ["43"]),
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ],
                  ),
                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: isRTL
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.start,
                    children: [
                      Text(
                        "request.date_label".tr(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          fontFamily: 'Poppins',
                        ),
                        textAlign: isRTL ? TextAlign.right : TextAlign.left,
                      ),
                      const SizedBox(width: 10),
                      Chip(
                        label: Text(
                          "request.date_value".tr(),
                          style: const TextStyle(
                            fontSize: 11,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        backgroundColor: const Color(0xFFF3F3F3),
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(
    String title, {
    bool isSelected = false,
    VoidCallback? onTap,
  }) {
    final bool isRTL = context.locale.languageCode == 'ar';

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: isRTL ? 0 : 5, left: isRTL ? 5 : 0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.basicColor : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black54,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              fontSize: 12,
              fontFamily: 'Poppins',
            ),
            textAlign: isRTL ? TextAlign.right : TextAlign.left,
          ),
        ),
      ),
    );
  }
}
