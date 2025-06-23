import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:recipe_hub/l10n/app_localizations.dart';
import 'package:recipe_hub/locator.dart';
import 'package:recipe_hub/ui/auth/auth_wrapper.dart';

import 'app_theme/app_style.dart';
import 'data/services/navigation_service.dart';
import 'firebase_options.dart';

Future<void> main() async {
  setUpLocator(); // registers dependencies before app runs

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(414, 896),
        child: MaterialApp(
          title: 'Recipe Hub',
          theme: Styles.themeData(isDark: false),
          debugShowCheckedModeBanner: false,
          navigatorKey: locator<NavigationService>().navigatorKey,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: AuthWrapper(),
        ),
      ),
    );
  }
}
