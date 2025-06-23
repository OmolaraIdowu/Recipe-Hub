import 'package:flutter/material.dart';
import 'package:recipe_hub/l10n/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get tr => AppLocalizations.of(this)!;
}
