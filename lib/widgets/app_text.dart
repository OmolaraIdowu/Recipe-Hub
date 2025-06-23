import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.text,
    this.align,
    this.color,
    this.font,
    this.fontStyle,
    this.height,
    this.isBold,
    this.maxLines,
    this.overflow,
    this.size,
    this.style,
    this.weight,
    this.onTap,
  });

  final String text;
  final double? size;
  final String? font;
  final Color? color;
  final TextStyle? style;
  final TextOverflow? overflow;
  final FontWeight? weight;
  final bool? isBold;
  final TextAlign? align;
  final double? height;
  final FontStyle? fontStyle;
  final int? maxLines;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        textAlign: align,
        maxLines: maxLines,
        style:
            style ??
            TextStyle(
              fontFamily: font,
              fontSize: size,
              fontStyle: fontStyle ?? FontStyle.normal,
              color: color,
              overflow: overflow,
              height: height,
              fontWeight: weight ?? (isBold == true ? FontWeight.w700 : null),
            ),
      ),
    );
  }
}
