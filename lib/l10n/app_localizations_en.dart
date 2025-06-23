// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_name => 'Recipe Hub';

  @override
  String get hello => 'Hello';

  @override
  String get welcome => 'Welcome Back!';

  @override
  String get create_account => 'Create an account';

  @override
  String get create_account_sub => 'Let\'s help you set up your account,\nIt won\'t take long.';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get name => 'Name';

  @override
  String get confirm_password => 'Confirm Password';

  @override
  String get enter_email => 'Enter email';

  @override
  String get enter_password => 'Enter password';

  @override
  String get enter_name => 'Enter name';

  @override
  String get forgot_password => 'Forgot Password?';

  @override
  String get helper_text => 'Password must be at least 8 characters, include an uppercase, a lowercase, a number, and a special character.';

  @override
  String get sign_in => 'Sign in';

  @override
  String get sign_up => 'Sign up';

  @override
  String get log_out => 'Logout';

  @override
  String get or_sign_in => 'or sign in with';

  @override
  String get or_sign_up => 'or sign up with';

  @override
  String get dont_have_acct => 'Don\'t have an account? ';

  @override
  String get already_member => 'Already a member? ';

  @override
  String get empty_field => 'Field Cannot be empty';

  @override
  String get passwordNumber => 'A number';

  @override
  String get passwordCapital => 'CAPITAL letter';

  @override
  String get passwordSmall => 'small letter';

  @override
  String get password8 => 'Password must be at least 8 characters';

  @override
  String get passwordSign => 'Password must contain signs (#/\$-@!*)';

  @override
  String get confirm_password_hint => 'Confirm password must be equal to password';

  @override
  String get verify_your_email => 'Please verify your email';

  @override
  String verify_your_email_sub(Object email) {
    return 'We just sent an email to $email. Click the link in the email to verify your account.';
  }

  @override
  String get verified => 'Verified';

  @override
  String get didnt_receive_the_link => 'Didn\'t receive the link? ';

  @override
  String get resend_email => 'Resend Email';

  @override
  String get account_created => 'Account created! Please check your email to verify.';

  @override
  String get something_wrong => 'Something went wrong.';

  @override
  String get verify_your_email_2 => 'You haven\'t verified your email. Please verify your email before signing in.';

  @override
  String welcome_back(Object name) {
    return 'Welcome back, $name!';
  }

  @override
  String get link_sent => 'Verification link sent!';

  @override
  String get email_not_verified => 'Email not verified yet.';

  @override
  String welcome_2(Object name) {
    return 'Welcome $name';
  }

  @override
  String get location_permission => 'Location Permission Required';

  @override
  String get location_permission_sub => 'Location access is permanently denied. Please enable it in app settings.';

  @override
  String get open_settings => 'Open Settings';

  @override
  String location(Object address) {
    return 'Location $address';
  }

  @override
  String get get_location => 'Get Location';

  @override
  String get home => 'Home';

  @override
  String get logout => 'Logout?';

  @override
  String get logout_sub => 'Are you sure you want to logout?';

  @override
  String get yes => 'YES';

  @override
  String get no => 'NO';
}
