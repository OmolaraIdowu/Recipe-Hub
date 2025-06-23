import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_hub/app_theme/pallet.dart';
import 'package:recipe_hub/ui/auth/sign_up/signup.vm.dart';
import 'package:recipe_hub/ui/base/base_view.dart';
import 'package:recipe_hub/utils/dimensions.dart';
import 'package:recipe_hub/utils/string_extensions.dart';
import 'package:recipe_hub/utils/validator.dart';
import 'package:recipe_hub/widgets/app_button.dart';
import 'package:recipe_hub/widgets/app_textfield.dart';

import '../../../widgets/app_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SignupViewModel>(
      builder:
          (context, model, _) => Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.sp,
                    vertical: 30.sp,
                  ),
                  child: Form(
                    key: model.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: context.tr.create_account,
                          size: 24.sp,
                          weight: FontWeight.w600,
                        ),
                        AppText(
                          text: context.tr.create_account_sub,
                          size: 16.sp,
                        ),
                        56.sp.sbH,
                        AppTextField(
                          hintText: context.tr.name,
                          hint: context.tr.enter_name,
                          textInputAction: TextInputAction.next,
                          validator: emptyValidator,
                          controller: model.name,
                          onChanged: model.onChanged,
                        ),
                        20.sp.sbH,
                        AppTextField(
                          hintText: context.tr.email,
                          hint: context.tr.enter_email,
                          textInputAction: TextInputAction.next,
                          validator: emailValidator,
                          controller: model.email,
                          onChanged: model.onChanged,
                        ),
                        20.sp.sbH,
                        AppTextField(
                          hintText: context.tr.password,
                          hint: context.tr.enter_password,
                          textInputAction: TextInputAction.next,
                          validator: passwordValidator,
                          controller: model.password,
                          helperText: context.tr.helper_text,
                          isPassword: true,
                          onChanged: model.onChanged,
                        ),
                        20.sp.sbH,
                        AppTextField(
                          hintText: context.tr.confirm_password,
                          hint: context.tr.confirm_password,
                          textInputAction: TextInputAction.done,
                          validator:
                              (v) => confirmPasswordValidator(
                                model.password,
                                model.confirmPassword,
                              ),
                          controller: model.confirmPassword,
                          helperText: context.tr.helper_text,
                          isPassword: true,
                          onChanged: model.onChanged,
                        ),
                        25.sp.sbH,
                        AppButton(
                          isLoading: model.isLoading,
                          text: context.tr.sign_up,
                          onTap:
                              model.formKey.currentState?.validate() == true
                                  ? model.createAccount
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
                                  text: context.tr.already_member,
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                  text: context.tr.sign_in,
                                  style: TextStyle(color: primaryColor),
                                  recognizer:
                                      TapGestureRecognizer()
                                        ..onTap = () {
                                          model.goToSignIn();
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
            ),
          ),
    );
  }
}
