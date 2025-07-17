import 'package:flutter/material.dart';
import 'package:scrreens_second_app/helper/theme/app_theme.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isRTL = AppTheme.isRTL(context);

    return AppTheme.wrapWithDirectionality(
      context,
      SafeArea(
        child: Row(
          mainAxisAlignment: isRTL
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Padding(
              padding: AppTheme.getEdgeInsetsDirectional(
                context: context,
                top: 16,
                start: 16,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: IconButton(
                  icon: Icon(
                    isRTL ? Icons.arrow_forward_ios : Icons.arrow_back_ios_new,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
