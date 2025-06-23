import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:recipe_hub/ui/auth/sign_in/sign_in.dart';
import 'package:recipe_hub/ui/home/home_screen.dart';

import '../../utils/constants.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: SpinKitChasingDots()));
        } else if (snapshot.hasData) {
          return const HomeScreen();
        } else {
          return const SignInScreen();
        }
      },
    );
  }
}
