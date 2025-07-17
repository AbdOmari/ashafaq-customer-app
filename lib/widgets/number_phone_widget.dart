import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class NumberPhoneWidget extends StatelessWidget {
  final TextEditingController controller;

  const NumberPhoneWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final bool isRTL = context.locale.languageCode == 'ar';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          color: const Color(0x00FFFFFF),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF1A1A60), width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          child: IntrinsicHeight(
            child: Row(
              children: isRTL
                  ? [
                      Expanded(
                        child: TextField(
                          controller: controller,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'auth.phone_number'.tr(),
                            hintStyle: const TextStyle(
                              color: Color(0x801A1A60),
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),

                            alignLabelWithHint: true,
                          ),
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.phone, color: Color(0xFF1A1A60)),
                      const VerticalDivider(
                        color: Color(0x33000000),
                        thickness: 1,
                        width: 15,
                        indent: 5,
                        endIndent: 5,
                      ),
                      const Text(
                        '+966',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: Color(0xFF1A1A60),
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
                            color: Color(0xFF1A1A60),
                          ),
                        ),
                      ),
                    ]
                  : [
                      const Icon(Icons.phone, color: Color(0xFF1A1A60)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: controller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'auth.phone_number'.tr(),
                            hintStyle: const TextStyle(
                              color: Color(0x801A1A60),
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                          ),
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      if (!isRTL) ...[
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
                              color: Color(0xFF1A1A60),
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
                        const Text(
                          '+966',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Color(0xFF1A1A60),
                          ),
                        ),
                      ],
                    ],
            ),
          ),
        ),
      ),
    );
  }
}
