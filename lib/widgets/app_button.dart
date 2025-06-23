import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../app_theme/pallet.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
    this.height,
    this.width,
    this.isLoading = false,
    this.padding,
    this.useElevation = false,
    this.borderRadius,
  });

  final String text;
  final Icon? icon;
  final void Function()? onTap;
  final double? height;
  final double? width;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final bool isLoading;
  final bool useElevation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed:
            isLoading
                ? null
                : onTap == null
                ? null
                : () {
                  FocusManager.instance.primaryFocus!.unfocus();
                  onTap!();
                },
        style: ElevatedButton.styleFrom(
          backgroundColor: onTap == null ? disabledColor : primaryColor,
          disabledBackgroundColor: disabledColor.withValues(alpha: 0.5),
          padding: padding,
          elevation: useElevation ? 5.sp : 0.sp,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.sp),
          ),
          fixedSize: Size(width ?? double.infinity, height ?? 50.sp),
        ),
        child:
            isLoading
                ? SpinKitDancingSquare(color: primaryColor, size: 26.sp)
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      text: text,
                      size: 16.sp,
                      color: onTap != null ? Colors.white : disabledColor,
                      weight: FontWeight.w500,
                    ),
                    if (icon != null) ...[const SizedBox(width: 10), icon!],
                  ],
                ),
      ),
    );
  }
}
