import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipe_hub/ui/base/base_viewmodel.dart';
import 'package:recipe_hub/ui/home/home_screen.dart';
import 'package:recipe_hub/utils/constants.dart';
import 'package:recipe_hub/utils/string_extensions.dart';

import '../../../utils/snack_bar.dart';

class VerifyEmailViewModel extends BaseViewModel {
  String get email => authService.currentUser?.email ?? 'you';

  verifyEmail() async {
    startLoader();
    try {
      await authService.sendEmailVerification();
      showCustomToast(navigationService.context.tr.link_sent, success: true);
      stopLoader();
    } on FirebaseAuthException catch (e) {
      stopLoader();
      showCustomToast(e.message ?? '', success: false);
    } catch (e) {
      stopLoader();
      showCustomToast(e.toString(), success: false);
    }
  }

  Future<void> checkIfVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();
    if (FirebaseAuth.instance.currentUser!.emailVerified) {
      navigationService.navigateToRoute(HomeScreen());
    } else {
      showCustomToast(
        navigationService.context.tr.email_not_verified,
        success: false,
      );
    }
  }
}
