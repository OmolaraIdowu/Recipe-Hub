import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_hub/ui/auth/sign_in/sign_in.dart';
import 'package:recipe_hub/ui/auth/verification/verify_email.dart';
import 'package:recipe_hub/ui/base/base_viewmodel.dart';
import 'package:recipe_hub/utils/constants.dart';
import 'package:recipe_hub/utils/string_extensions.dart';

import '../../../utils/snack_bar.dart';

class SignupViewModel extends BaseViewModel {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  onChanged(String? val) {
    formKey.currentState!.validate();
    notifyListeners();
  }

  createAccount() async {
    startLoader();
    try {
      var response = await authService.signUp(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      final user = response.user;
      if (user != null) {
        await authService.updateName(name: name.text.trim());
        await user.sendEmailVerification();
        showCustomToast(
          navigationService.context.tr.account_created,
          success: true,
        );
        navigationService.navigateToRoute(VerifyEmailScreen());
      }
      stopLoader();
    } on FirebaseAuthException catch (e) {
      stopLoader();
      showCustomToast(
        e.message ?? navigationService.context.tr.something_wrong,
        success: false,
      );
    } catch (e) {
      stopLoader();
      showCustomToast(e.toString());
    }
  }

  goToSignIn() {
    navigationService.navigateToRoute(SignInScreen());
  }
}
