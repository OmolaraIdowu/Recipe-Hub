import 'package:flutter/material.dart';
import 'package:recipe_hub/utils/string_extensions.dart';

import 'constants.dart';

const emailRegex =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regEx = RegExp(r"(?=.*[a-z])(?=.*[0-9])\w+");

String? Function(String?)? emailValidator = (String? val) {
  String validate = val!.replaceAll(RegExp(r"\s+"), "");
  if (validate.isEmpty || !RegExp(emailRegex).hasMatch(validate)) {
    return 'Enter valid email';
  }
  return null;
};

String? Function(String?)? passwordValidator = (String? val) {
  BuildContext context = navigationService.context;
  String value = val ?? "";
  RegExp regex = RegExp(r'[A-Z]');
  RegExp smallRegex = RegExp(r"[a-z]");
  RegExp numberRegex = RegExp(r'\d');
  RegExp signRegex = RegExp(r'[!@#$%^&*(),\-_.?":;{}|<>]');
  if (value.length < 7) {
    return context.tr.password8;
  } else if (!regex.hasMatch(value)) {
    return context.tr.passwordCapital;
  } else if (!smallRegex.hasMatch(value)) {
    return context.tr.passwordSmall;
  } else if (!numberRegex.hasMatch(value)) {
    return context.tr.passwordNumber;
  } else if (!signRegex.hasMatch(value)) {
    return context.tr.passwordSign;
  }
  return null;
};

String? Function(TextEditingController newPass, TextEditingController confirm)
confirmPasswordValidator = (
  TextEditingController newPass,
  TextEditingController confirm,
) {
  if (confirm.text.trim().isEmpty) {
    return "Form field should not be empty";
  }
  if (newPass.text.trim() != confirm.text.trim()) {
    return "Confirm password must be the same as password";
  }
  return null;
};

String? Function(String?)? emptyValidator = (String? val) {
  BuildContext context = navigationService.context;
  String value = val ?? "";
  if (value.trim().isEmpty) {
    return context.tr.empty_field;
  }
  return null;
};
