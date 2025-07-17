import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:ui' as ui;

class AppTheme {
  static bool isRTL(BuildContext context) {
    return context.locale.languageCode == 'ar';
  }

  static TextAlign getTextAlign(BuildContext context) {
    return isRTL(context) ? TextAlign.right : TextAlign.left;
  }

  static EdgeInsets getEdgeInsetsDirectional({
    required BuildContext context,
    double start = 0,
    double end = 0,
    double top = 0,
    double bottom = 0,
  }) {
    return isRTL(context)
        ? EdgeInsets.only(right: start, left: end, top: top, bottom: bottom)
        : EdgeInsets.only(left: start, right: end, top: top, bottom: bottom);
  }

  static double flipValue(BuildContext context, double value) {
    return isRTL(context) ? -value : value;
  }

  static MainAxisAlignment getMainAxisAlignment(
    BuildContext context,
    MainAxisAlignment defaultAlignment,
  ) {
    if (!isRTL(context)) return defaultAlignment;

    switch (defaultAlignment) {
      case MainAxisAlignment.start:
        return MainAxisAlignment.end;
      case MainAxisAlignment.end:
        return MainAxisAlignment.start;
      default:
        return defaultAlignment;
    }
  }

  static CrossAxisAlignment getCrossAxisAlignment(
    BuildContext context,
    CrossAxisAlignment defaultAlignment,
  ) {
    if (!isRTL(context)) return defaultAlignment;

    switch (defaultAlignment) {
      case CrossAxisAlignment.start:
        return CrossAxisAlignment.end;
      case CrossAxisAlignment.end:
        return CrossAxisAlignment.start;
      default:
        return defaultAlignment;
    }
  }

  static Widget wrapWithRTL(BuildContext context, Widget child) {
    return Container(
      alignment: isRTL(context) ? Alignment.centerRight : Alignment.centerLeft,
      child: child,
    );
  }

  static Widget wrapWithDirectionality(BuildContext context, Widget child) {
    final isArabic = context.locale.languageCode == 'ar';
    return Directionality(
      textDirection: isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr,
      child: child,
    );
  }

  static ui.TextDirection getTextDirection(BuildContext context) {
    return isRTL(context) ? ui.TextDirection.rtl : ui.TextDirection.ltr;
  }

  static List<T> getDirectionalList<T>(BuildContext context, List<T> list) {
    final isArabic = context.locale.languageCode == 'ar';
    return isArabic ? list.reversed.toList() : list;
  }

  static BoxDecoration getDirectionalBorder({
    required BuildContext context,
    double startBorder = 0,
    double endBorder = 0,
    Color borderColor = Colors.transparent,
  }) {
    final isArabic = context.locale.languageCode == 'ar';

    return BoxDecoration(
      border: Border(
        left: BorderSide(
          width: isArabic ? endBorder : startBorder,
          color: borderColor,
        ),
        right: BorderSide(
          width: isArabic ? startBorder : endBorder,
          color: borderColor,
        ),
      ),
    );
  }
}
