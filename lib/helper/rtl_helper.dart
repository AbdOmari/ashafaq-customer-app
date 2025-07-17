import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class RTLHelper {
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
}
