import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CheckWidget extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final String text;

  const CheckWidget({
    Key? key,
    required this.isChecked,
    required this.onChanged,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isRTL = context.locale.languageCode == 'ar';
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 0),
      child: Row(
        mainAxisAlignment: isRTL
            ? MainAxisAlignment.start
            : MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: isRTL
                ? [
                    Text(
                      text,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Color(0x80000000),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Checkbox(
                      value: isChecked,
                      onChanged: onChanged,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      checkColor: Colors.white,
                      activeColor: const Color(0xFF1A1A60),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                    ),
                  ]
                : [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 0),
                      child: Checkbox(
                        value: isChecked,
                        onChanged: onChanged,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        checkColor: Colors.white,
                        activeColor: const Color(0xFF1A1A60),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      text,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Color(0x80000000),
                      ),
                    ),
                  ],
          ),
        ],
      ),
    );
  }
}
