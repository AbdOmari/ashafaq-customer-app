import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:scrreens_second_app/widgets/custom_arrow_back.dart';
import 'package:scrreens_second_app/widgets/number_phone_widget.dart';
import 'package:scrreens_second_app/widgets/widget.dart';

class ProfileInfo extends StatefulWidget {
  static const String id = "profile_info";
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController(
    text: '964360686',
  );
  @override
  Widget build(BuildContext context) {
    final bool isArabic = context.locale.languageCode == 'ar';

    return Directionality(
      textDirection: isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Align(
              alignment: isArabic ? Alignment.topRight : Alignment.topLeft,
              child: const CustomArrowBack(),
            ),

            const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsetsDirectional.only(start: 10),
              child: Text(
                "settings.profile_info".tr(),
                style: const TextStyle(
                  fontSize: 25,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: isArabic ? TextAlign.right : TextAlign.left,
              ),
            ),

            const SizedBox(height: 25),

            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ImageFiltered(
                      imageFilter: ui.ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                      child: Image.asset(
                        "assets/images/profile_photo.jpg",
                        width: 120,
                        height: 110,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A60),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            TextFieldWithIcon(
              hintText: "settings.email_placeholder".tr(),
              icon: Icons.email,
              controller: nameController,
            ),
            const SizedBox(height: 20),
            TextFieldWithIcon(
              hintText: "settings.name_placeholder".tr(),
              icon: Icons.person,
            ),
            const SizedBox(height: 20),
            NumberPhoneWidget(controller: phoneController),
            const SizedBox(height: 30),

            const ZoneSelector(),
            VerifyButton(
              text: "settings.save".tr(),
              onpressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ZoneSelector extends StatefulWidget {
  const ZoneSelector({super.key});

  @override
  State<ZoneSelector> createState() => _ZoneSelectorState();
}

class _ZoneSelectorState extends State<ZoneSelector> {
  bool isExpanded = false;
  String selectedZone = "settings.zone_selector".tr();

  final List<String> items = [
    'Textrtt',
    'Textrtt',
    'Textrtt',
    'Textrtt',
    'Textrtt',
    'Textrtt',
    'Textrtt',
    'Textrtt',
    'Textrtt',
    'Textrtt',
    'Textrtt',
    'Textrtt',
  ];

  @override
  Widget build(BuildContext context) {
    final bool isArabic = context.locale.languageCode == 'ar';

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 5),
              ],
            ),
            child: Row(
              children: isArabic
                  ? [
                      Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      const Spacer(),
                      Text(
                        selectedZone,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.ac_unit, color: Color(0xFF1A1A60)),
                    ]
                  : [
                      const Icon(Icons.ac_unit, color: Color(0xFF1A1A60)),
                      const SizedBox(width: 10),
                      Text(
                        selectedZone,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                    ],
            ),
          ),
        ),

        if (isExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "settings.zone".tr(args: ["1"]),
                    textAlign: isArabic ? TextAlign.right : TextAlign.left,
                  ),
                  onTap: () {
                    setState(() {
                      selectedZone = "settings.zone".tr(args: ["1"]);
                      isExpanded = false;
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    "settings.zone".tr(args: ["2"]),
                    textAlign: isArabic ? TextAlign.right : TextAlign.left,
                  ),
                  onTap: () {
                    setState(() {
                      selectedZone = "settings.zone".tr(args: ["2"]);
                      isExpanded = false;
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    "settings.zone".tr(args: ["3"]),
                    textAlign: isArabic ? TextAlign.right : TextAlign.left,
                  ),
                  onTap: () {
                    setState(() {
                      selectedZone = "settings.zone".tr(args: ["3"]);
                      isExpanded = false;
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    "settings.zone".tr(args: ["4"]),
                    textAlign: isArabic ? TextAlign.right : TextAlign.left,
                  ),
                  onTap: () {
                    setState(() {
                      selectedZone = "settings.zone".tr(args: ["4"]);
                      isExpanded = false;
                    });
                  },
                ),
              ],
            ),
          ),

        const SizedBox(height: 20),

        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: items.map((item) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF1A1A60)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: isArabic
                    ? [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              items.remove(item);
                            });
                          },
                          child: const Icon(
                            Icons.close,
                            size: 16,
                            color: Color(0xFF1A1A60),
                          ),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          item,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                        ),
                      ]
                    : [
                        Text(
                          item,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 2),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              items.remove(item);
                            });
                          },
                          child: const Icon(
                            Icons.close,
                            size: 16,
                            color: Color(0xFF1A1A60),
                          ),
                        ),
                      ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
