import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:scrreens_second_app/helper/color/app_colors.dart';
import 'package:scrreens_second_app/helper/constants/app_constants.dart'
    hide AppTextStyles;
import 'package:scrreens_second_app/helper/routes/app_routes.dart';
import 'package:scrreens_second_app/widgets/request_details_widgets.dart';

class RequestDetailsScreen extends StatelessWidget {
  const RequestDetailsScreen({super.key});
  static const String id = AppRoutes.requestDetails;

  @override
  Widget build(BuildContext context) {
    final bool isRTL = context.locale.languageCode == 'ar';

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: isRTL
            ? null
            : IconButton(
                icon: Icon(Icons.arrow_back, color: AppColors.basicColor),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
        actions: isRTL
            ? [
                IconButton(
                  icon: Icon(Icons.arrow_forward, color: AppColors.basicColor),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ]
            : null,
        title: Text(
          "request.title".tr(),
          style: AppTextStyles.bold.copyWith(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: isRTL
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: const [
              SizedBox(height: AppConstants.defaultPadding),

              PackageAndCarDetailsCard(),

              SizedBox(height: AppConstants.defaultPadding),
              DateCard(),

              SizedBox(height: AppConstants.defaultPadding),

              UserInfoCard(),

              SizedBox(height: AppConstants.defaultPadding),

              LocationMapCard(),

              SizedBox(height: AppConstants.largePadding),
            ],
          ),
        ),
      ),
    );
  }
}
