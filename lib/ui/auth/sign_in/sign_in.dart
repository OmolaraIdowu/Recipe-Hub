import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_hub/app_theme/pallet.dart';
import 'package:recipe_hub/ui/auth/sign_in/sign_in.vm.dart';
import 'package:recipe_hub/ui/base/base_view.dart';
import 'package:recipe_hub/utils/dimensions.dart';
import 'package:recipe_hub/utils/string_extensions.dart';
import 'package:recipe_hub/utils/validator.dart';
import 'package:recipe_hub/widgets/app_button.dart';
import 'package:recipe_hub/widgets/app_text.dart';
import 'package:recipe_hub/widgets/app_textfield.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SignInViewModel>(
      builder: (context, model, _) {
        return Scaffold(
          body: SafeArea(
            child: Form(
              key: model.formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.sp,
                  vertical: 30.sp,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: context.tr.hello,
                      size: 24.sp,
                      weight: FontWeight.w700,
                    ),
                    AppText(text: context.tr.welcome, size: 16.sp),
                    56.sp.sbH,
                    AppTextField(
                      hintText: context.tr.email,
                      hint: context.tr.enter_email,
                      validator: emailValidator,
                      controller: model.email,
                      onChanged: model.onChanged,
                    ),
                    20.sp.sbH,
                    AppTextField(
                      hintText: context.tr.password,
                      hint: context.tr.enter_password,
                      validator: passwordValidator,
                      controller: model.password,
                      isPassword: true,
                      onChanged: model.onChanged,
                    ),
                    20.sp.sbH,
                    Align(
                      alignment: Alignment.topRight,
                      child: AppText(
                        text: context.tr.forgot_password,
                        size: 14.sp,
                        onTap: () {},
                      ),
                    ),
                    25.sp.sbH,
                    AppButton(
                      isLoading: model.isLoading,
                      text: context.tr.sign_in,
                      onTap:
                          model.formKey.currentState?.validate() == true
                              ? model.goToHome
                              : null,
                    ),
                    55.sp.sbH,
                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: context.tr.dont_have_acct,
                              style: TextStyle(color: textColor),
                            ),
                            TextSpan(
                              text: context.tr.sign_up,
                              style: TextStyle(color: primaryColor),
                              recognizer:
                                  TapGestureRecognizer()
                                    ..onTap = () {
                                      model.goToSignUp();
                                    },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
