import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_hub/app_theme/pallet.dart';
import 'package:recipe_hub/ui/auth/verification/verify_email.vm.dart';
import 'package:recipe_hub/ui/base/base_view.dart';
import 'package:recipe_hub/utils/dimensions.dart';
import 'package:recipe_hub/utils/string_extensions.dart';
import 'package:recipe_hub/widgets/app_button.dart';
import 'package:recipe_hub/widgets/app_text.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<VerifyEmailViewModel>(
      builder: (context, model, _) {
        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 40.sp),
              child: Column(
                children: [
                  AppText(
                    text: context.tr.verify_your_email,
                    size: 24.sp,
                    weight: FontWeight.w600,
                  ),
                  10.sp.sbH,
                  AppText(
                    text: context.tr.verify_your_email_sub(model.email),
                    size: 16.sp,
                  ),
                  30.sp.sbH,
                  AppButton(
                    isLoading: model.isLoading,
                    text: context.tr.verified,
                    onTap: () => model.checkIfVerified(),
                  ),
                  20.sp.sbH,
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                      children: [
                        TextSpan(
                          text: context.tr.didnt_receive_the_link,
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: context.tr.resend_email,
                          style: TextStyle(color: primaryColor),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  model.verifyEmail();
                                },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
