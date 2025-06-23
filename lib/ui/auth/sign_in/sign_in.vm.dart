import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipe_hub/ui/auth/sign_up/signup.dart';
import 'package:recipe_hub/ui/base/base_viewmodel.dart';
import 'package:recipe_hub/ui/home/home_screen.dart';
import 'package:recipe_hub/utils/constants.dart';
import 'package:recipe_hub/utils/snack_bar.dart';
import 'package:recipe_hub/utils/string_extensions.dart';

import '../verification/verify_email.dart';

class SignInViewModel extends BaseViewModel {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  onChanged(String? val) {
    formKey.currentState!.validate();
    notifyListeners();
  }

  goToSignUp() {
    navigationService.navigateToRoute(SignUpScreen());
  }

  goToHome() async {
    startLoader();
    try {
      var response = await authService.signIn(
        email: email.text,
        password: password.text,
      );
      final user = response.user;
      if (user != null && user.emailVerified) {
        showCustomToast(
          navigationService.context.tr.welcome_back(user.displayName ?? 'User'),
          success: true,
        );
        navigationService.navigateToRoute(HomeScreen());
      } else if (user != null && !user.emailVerified) {
        await authService.sendEmailVerification();
        await authService.signOut();
        showCustomToast(
          navigationService.context.tr.verify_your_email_2,
          success: false,
        );
        navigationService.navigateToRoute(VerifyEmailScreen());
      }
      stopLoader();
    } on FirebaseAuthException catch (e) {
      stopLoader();
      showCustomToast(e.message ?? 'Login failed.', success: false);
    } catch (e) {
      stopLoader();
      showCustomToast(e.toString(), success: false);
    }
  }
}
