import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:recipe_hub/utils/dimensions.dart';

import '../app_theme/pallet.dart';
import '../widgets/app_text.dart';
import 'constants.dart';

showCustomToast(
  String message, {
  bool success = false,
  num? time,
  String? title,
}) {
  // toast message
  showToastWidget(
    toast(message, success: success, title: title),
    duration: const Duration(seconds: 4),
    onDismiss: () {},
  );
}

Widget toast(String message, {bool? success, String? title}) {
  BuildContext context = navigationService.context;

  return Align(
    alignment: Alignment.topCenter,
    child: SafeArea(
      top: true,
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IntrinsicWidth(
            child: Container(
              margin: 16.sp.padH,
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 14.sp),
              decoration: BoxDecoration(
                color: !success! ? errorColor : Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12.sp),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  title != null
                      ? AppText(
                        text: title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                      : 0.0.sbW,
                  title != null ? 2.sp.sbH : 0.0.sbW,
                  AppText(
                    text: message,
                    color: Colors.white,
                    size: 13.sp,
                    weight: FontWeight.w400,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
