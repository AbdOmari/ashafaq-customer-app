import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:scrreens_second_app/helper/color/app_colors.dart';
import 'package:scrreens_second_app/helper/constants/app_constants.dart';

class AppTextStyles {
  static const TextStyle bold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
  );

  static const TextStyle semiBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle regular = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
  );
}

class PackageAndCarDetailsCard extends StatelessWidget {
  const PackageAndCarDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isRTL = context.locale.languageCode == 'ar';

    return Container(
      padding: const EdgeInsets.all(AppConstants.mediumPadding),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderGrey),
        borderRadius: BorderRadius.circular(AppConstants.smallBorderRadius),
      ),
      child: Column(
        crossAxisAlignment: isRTL
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: isRTL
                ? [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text(
                              "request.washes_count".tr(args: ['2']),
                              style: AppTextStyles.regular.copyWith(
                                fontSize: AppConstants.smallTextSize,
                                color: AppColors.black,
                              ),
                            ),
                            const SizedBox(width: AppConstants.smallPadding),
                            Text(
                              "request.basic_package".tr(),
                              style: AppTextStyles.bold,
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Text(
                              "43",
                              style: AppTextStyles.bold.copyWith(fontSize: 15),
                            ),
                            const SizedBox(width: 4),
                            const Image(
                              image: AssetImage("assets/images/rial.png"),
                              width: 17,
                              height: 17,
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Text(
                              "request.per_wash".tr(args: ['43']),
                              style: AppTextStyles.regular.copyWith(
                                fontSize: AppConstants.regularTextSize,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Image(
                              image: AssetImage("assets/images/rial.png"),
                              width: 14,
                              height: 14,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: AppConstants.mediumPadding),
                    SvgPicture.asset(
                      "assets/svg/saving_package.svg",
                      height: 60,
                    ),
                  ]
                : [
                    SvgPicture.asset(
                      "assets/svg/saving_package.svg",
                      height: 60,
                    ),
                    const SizedBox(width: AppConstants.mediumPadding),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "request.basic_package".tr(),
                              style: AppTextStyles.bold,
                            ),
                            const SizedBox(width: AppConstants.smallPadding),
                            Text(
                              "request.washes_count".tr(args: ['2']),
                              style: AppTextStyles.regular.copyWith(
                                fontSize: AppConstants.smallTextSize,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Image(
                              image: AssetImage("assets/images/rial.png"),
                              width: 17,
                              height: 17,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "43",
                              style: AppTextStyles.bold.copyWith(fontSize: 15),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Image(
                              image: AssetImage("assets/images/rial.png"),
                              width: 14,
                              height: 14,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "request.per_wash".tr(args: ['43']),
                              style: AppTextStyles.regular.copyWith(
                                fontSize: AppConstants.regularTextSize,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
          ),
          const SizedBox(height: AppConstants.largePadding),

          Row(
            mainAxisAlignment: isRTL
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: isRTL
                ? [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.chipBackground,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "E4357",
                        style: AppTextStyles.regular.copyWith(
                          fontSize: AppConstants.smallTextSize,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppConstants.smallPadding),
                    Text("request.car_model".tr(), style: AppTextStyles.bold),
                  ]
                : [
                    Text("request.car_model".tr(), style: AppTextStyles.bold),
                    const SizedBox(width: AppConstants.smallPadding),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.chipBackground,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "E4357",
                        style: AppTextStyles.regular.copyWith(
                          fontSize: AppConstants.smallTextSize,
                        ),
                      ),
                    ),
                  ],
          ),
        ],
      ),
    );
  }
}

class DateCard extends StatelessWidget {
  const DateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.mediumPadding),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderGrey),
        borderRadius: BorderRadius.circular(AppConstants.smallBorderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              "request.date".tr(),
              style: AppTextStyles.semiBold.copyWith(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: AppConstants.smallPadding),
          Flexible(
            child: Chip(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              labelPadding: const EdgeInsets.symmetric(horizontal: 4),
              label: Text(
                "request.request_appointment_date".tr(),
                style: AppTextStyles.regular.copyWith(fontSize: 9),
                overflow: TextOverflow.ellipsis,
              ),
              backgroundColor: AppColors.chipBackground,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            ),
          ),
        ],
      ),
    );
  }
}

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isRTL = context.locale.languageCode == 'ar';

    return Container(
      padding: const EdgeInsets.all(AppConstants.mediumPadding),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderGrey),
        borderRadius: BorderRadius.circular(AppConstants.smallBorderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: isRTL
            ? [
                Row(
                  children: [
                    _buildContactButton(
                      color: const Color(0xFF056900),
                      icon: FontAwesomeIcons.whatsapp,
                      onTap: () {},
                    ),
                    const SizedBox(width: AppConstants.mediumPadding),
                    _buildContactButton(
                      color: const Color(0xFF0066B4),
                      icon: Icons.email,
                      onTap: () {},
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "request.customer_name".tr(),
                        style: AppTextStyles.bold.copyWith(fontSize: 15),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Mostafaahmed@Gmail.Com",
                        style: AppTextStyles.regular.copyWith(
                          fontSize: AppConstants.regularTextSize,
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppConstants.mediumPadding),
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(
                    "assets/images/profile_photo.jpg",
                  ),
                ),
              ]
            : [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(
                    "assets/images/profile_photo.jpg",
                  ),
                ),
                const SizedBox(width: AppConstants.mediumPadding),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "request.customer_name".tr(),
                        style: AppTextStyles.bold.copyWith(fontSize: 15),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Mostafaahmed@Gmail.Com",
                        style: AppTextStyles.regular.copyWith(
                          fontSize: AppConstants.regularTextSize,
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    _buildContactButton(
                      color: const Color(0xFF0066B4),
                      icon: Icons.email,
                      onTap: () {},
                    ),
                    const SizedBox(width: AppConstants.mediumPadding),
                    _buildContactButton(
                      color: const Color(0xFF056900),
                      icon: FontAwesomeIcons.whatsapp,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
      ),
    );
  }

  Widget _buildContactButton({
    required Color color,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Icon(icon, color: Colors.white)),
        ),
      ),
    );
  }
}

class LocationMapCard extends StatelessWidget {
  const LocationMapCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isRTL = context.locale.languageCode == 'ar';

    return Column(
      crossAxisAlignment: isRTL
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Text(
          "request.location".tr(),
          style: AppTextStyles.bold.copyWith(fontSize: 15),
        ),
        const SizedBox(height: AppConstants.smallPadding),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppConstants.smallBorderRadius),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset("assets/images/Maps.png"),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 280,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.cloud_download_outlined),
                      label: Text(
                        "request.show_location".tr(),
                        style: AppTextStyles.semiBold.copyWith(fontSize: 14),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.basicColor,
                        foregroundColor: AppColors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: AppConstants.mediumPadding),

                  SizedBox(
                    width: 280,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/images/maps_mark.png",
                        width: 24,
                        height: 24,
                      ),
                      label: Text(
                        "request.google_maps".tr(),
                        style: AppTextStyles.semiBold.copyWith(
                          fontSize: 14,
                          color: AppColors.black,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Colors.black12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
