import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension WidgetExtensions on num {
  Widget get sbH => SizedBox(height: h);

  Widget get sbW => SizedBox(width: w);

  Widget get sbHW => SizedBox(width: w, height: h);

  EdgeInsetsGeometry get padA => EdgeInsets.all(toDouble());

  EdgeInsetsGeometry get padV => EdgeInsets.symmetric(vertical: h);
  EdgeInsetsGeometry get padT => EdgeInsets.only(top: h);
  EdgeInsetsGeometry get padL => EdgeInsets.only(left: h);
  EdgeInsetsGeometry get padR => EdgeInsets.only(right: h);
  EdgeInsetsGeometry get padB => EdgeInsets.only(bottom: h);

  EdgeInsetsGeometry get padH => EdgeInsets.symmetric(horizontal: w);
}
