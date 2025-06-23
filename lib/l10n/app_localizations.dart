import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @app_name.
  ///
  /// In en, this message translates to:
  /// **'Recipe Hub'**
  String get app_name;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get welcome;

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get create_account;

  /// No description provided for @create_account_sub.
  ///
  /// In en, this message translates to:
  /// **'Let\'s help you set up your account,\nIt won\'t take long.'**
  String get create_account_sub;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm_password;

  /// No description provided for @enter_email.
  ///
  /// In en, this message translates to:
  /// **'Enter email'**
  String get enter_email;

  /// No description provided for @enter_password.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get enter_password;

  /// No description provided for @enter_name.
  ///
  /// In en, this message translates to:
  /// **'Enter name'**
  String get enter_name;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgot_password;

  /// No description provided for @helper_text.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters, include an uppercase, a lowercase, a number, and a special character.'**
  String get helper_text;

  /// No description provided for @sign_in.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get sign_in;

  /// No description provided for @sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get sign_up;

  /// No description provided for @log_out.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get log_out;

  /// No description provided for @or_sign_in.
  ///
  /// In en, this message translates to:
  /// **'or sign in with'**
  String get or_sign_in;

  /// No description provided for @or_sign_up.
  ///
  /// In en, this message translates to:
  /// **'or sign up with'**
  String get or_sign_up;

  /// No description provided for @dont_have_acct.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get dont_have_acct;

  /// No description provided for @already_member.
  ///
  /// In en, this message translates to:
  /// **'Already a member? '**
  String get already_member;

  /// No description provided for @empty_field.
  ///
  /// In en, this message translates to:
  /// **'Field Cannot be empty'**
  String get empty_field;

  /// No description provided for @passwordNumber.
  ///
  /// In en, this message translates to:
  /// **'A number'**
  String get passwordNumber;

  /// No description provided for @passwordCapital.
  ///
  /// In en, this message translates to:
  /// **'CAPITAL letter'**
  String get passwordCapital;

  /// No description provided for @passwordSmall.
  ///
  /// In en, this message translates to:
  /// **'small letter'**
  String get passwordSmall;

  /// No description provided for @password8.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get password8;

  /// No description provided for @passwordSign.
  ///
  /// In en, this message translates to:
  /// **'Password must contain signs (#/\$-@!*)'**
  String get passwordSign;

  /// No description provided for @confirm_password_hint.
  ///
  /// In en, this message translates to:
  /// **'Confirm password must be equal to password'**
  String get confirm_password_hint;

  /// No description provided for @verify_your_email.
  ///
  /// In en, this message translates to:
  /// **'Please verify your email'**
  String get verify_your_email;

  /// No description provided for @verify_your_email_sub.
  ///
  /// In en, this message translates to:
  /// **'We just sent an email to {email}. Click the link in the email to verify your account.'**
  String verify_your_email_sub(Object email);

  /// No description provided for @verified.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get verified;

  /// No description provided for @didnt_receive_the_link.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the link? '**
  String get didnt_receive_the_link;

  /// No description provided for @resend_email.
  ///
  /// In en, this message translates to:
  /// **'Resend Email'**
  String get resend_email;

  /// No description provided for @account_created.
  ///
  /// In en, this message translates to:
  /// **'Account created! Please check your email to verify.'**
  String get account_created;

  /// No description provided for @something_wrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong.'**
  String get something_wrong;

  /// No description provided for @verify_your_email_2.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t verified your email. Please verify your email before signing in.'**
  String get verify_your_email_2;

  /// No description provided for @welcome_back.
  ///
  /// In en, this message translates to:
  /// **'Welcome back, {name}!'**
  String welcome_back(Object name);

  /// No description provided for @link_sent.
  ///
  /// In en, this message translates to:
  /// **'Verification link sent!'**
  String get link_sent;

  /// No description provided for @email_not_verified.
  ///
  /// In en, this message translates to:
  /// **'Email not verified yet.'**
  String get email_not_verified;

  /// No description provided for @welcome_2.
  ///
  /// In en, this message translates to:
  /// **'Welcome {name}'**
  String welcome_2(Object name);

  /// No description provided for @location_permission.
  ///
  /// In en, this message translates to:
  /// **'Location Permission Required'**
  String get location_permission;

  /// No description provided for @location_permission_sub.
  ///
  /// In en, this message translates to:
  /// **'Location access is permanently denied. Please enable it in app settings.'**
  String get location_permission_sub;

  /// No description provided for @open_settings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get open_settings;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location {address}'**
  String location(Object address);

  /// No description provided for @get_location.
  ///
  /// In en, this message translates to:
  /// **'Get Location'**
  String get get_location;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout?'**
  String get logout;

  /// No description provided for @logout_sub.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logout_sub;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'YES'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'NO'**
  String get no;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
