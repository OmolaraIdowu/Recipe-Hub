import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_hub/ui/base/base_view.dart';
import 'package:recipe_hub/ui/home/home.vm.dart';
import 'package:recipe_hub/utils/dimensions.dart';
import 'package:recipe_hub/utils/string_extensions.dart';
import 'package:recipe_hub/widgets/app_button.dart';

import '../../widgets/app_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) => model.init(),
      builder: (context, model, _) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
            title: AppText(text: context.tr.home, size: 24.sp),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 30.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText(
                  text: context.tr.welcome_2(model.name ?? ''),
                  size: 20.sp,
                  weight: FontWeight.w600,
                ),
                12.sp.sbH,
                AppText(
                  text: context.tr.location(model.city ?? '...'),
                  size: 16.sp,
                ),
                20.sp.sbH,
                AppText(
                  text: context.tr.get_location,
                  size: 16.sp,
                  onTap: () => model.getLocation(),
                ),
                50.sp.sbH,
                AppButton(
                  isLoading: model.isLoading,
                  text: context.tr.log_out,
                  onTap: model.showLogoutDialog,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
