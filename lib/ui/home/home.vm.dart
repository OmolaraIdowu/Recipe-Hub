import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:recipe_hub/app_theme/pallet.dart';
import 'package:recipe_hub/ui/auth/sign_in/sign_in.dart';
import 'package:recipe_hub/ui/base/base_viewmodel.dart';
import 'package:recipe_hub/utils/string_extensions.dart';

import '../../utils/constants.dart';
import '../../utils/snack_bar.dart';
import '../../widgets/app_text.dart';

class HomeViewModel extends BaseViewModel {
  String? city;
  String? name;
  bool locationDeniedForever = false;

  init() {
    getLocation();
    getName();
  }

  Future<void> getLocation() async {
    startLoader();
    try {
      final permission = await locationService.checkAndRequestPermission();
      if (permission == LocationPermission.deniedForever) {
        locationDeniedForever = true;
        stopLoader();
        notifyListeners();
        showPermissionDialog();
        return;
      }
      city = await locationService.getCurrentLocation();
      stopLoader();
    } catch (e) {
      stopLoader();
      showCustomToast(e.toString(), success: false);
    }
    notifyListeners();
  }

  getName() {
    name = authService.currentUser?.displayName ?? 'User';
    notifyListeners();
  }

  Future<void> signOutUser() async {
    await authService.signOut();
  }

  showPermissionDialog() {
    showDialog(
      context: navigationService.context,
      builder:
          (_) => AlertDialog(
            title: AppText(
              text: navigationService.context.tr.location_permission,
              color: Colors.black,
            ),
            content: AppText(
              text: navigationService.context.tr.location_permission_sub,
            ),
            actions: [
              AppText(
                text: navigationService.context.tr.open_settings,
                onTap: () {
                  Geolocator.openAppSettings();
                  navigationService.goBack();
                },
              ),
            ],
          ),
    );
  }

  showLogoutDialog() {
    showDialog(
      context: navigationService.context,
      builder:
          (_) => AlertDialog(
            title: AppText(
              text: navigationService.context.tr.logout,
              color: Colors.black,
            ),
            content: AppText(text: navigationService.context.tr.logout_sub),
            actions: [
              AppText(
                text: navigationService.context.tr.no,
                size: 16.sp,
                weight: FontWeight.w500,
                onTap: () {
                  navigationService.goBack();
                },
              ),
              Spacer(),
              AppText(
                text: navigationService.context.tr.yes,
                color: primaryColor,
                size: 16.sp,
                weight: FontWeight.w500,
                onTap: () async {
                  await signOutUser();
                  navigationService.navigateToAndRemoveUntilWidget(
                    SignInScreen(),
                  );
                },
              ),
            ],
          ),
    );
  }
}
