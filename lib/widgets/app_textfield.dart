import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_hub/utils/dimensions.dart';
import 'package:recipe_hub/widgets/app_text.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.hintText,
    this.useBorder = true,
    this.isPassword = false,
    this.showError = true,
    this.hint,
    this.onChanged,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.start,
    this.onTap,
    this.validator,
    this.suffixIcon,
    this.textSize,
    this.haveText,
    this.obscureText,
    this.helperText,
    this.contentPadding,
    this.maxHeight = 1,
    this.hintColor,
    this.hintTextColor,
    this.hintSize,
    this.textColor,
    this.fillColor,
    this.enabledBorder,
    this.autoValidateMode,
    this.borderRadius,
    this.textInputAction,
    this.border,
    this.style,
    this.hintTextStyle,
    this.hintStyle,
  });

  final String? hintText;
  final String? helperText;
  final String? Function(String?)? validator;
  final String? hint;
  final bool useBorder;
  final bool isPassword;
  final InputBorder? border;
  final bool showError;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final double? textSize;
  final double? borderRadius;
  final TextAlign textAlign;
  final Color? hintTextColor;
  final Color? fillColor;
  final Color? textColor;
  final VoidCallback? onTap;
  final AutovalidateMode? autoValidateMode;
  final InputBorder? enabledBorder;
  final int? maxHeight;
  final TextStyle? style;
  final TextStyle? hintTextStyle;
  final TextStyle? hintStyle;
  final double? hintSize;
  final Color? hintColor;
  final bool? haveText;
  final bool? obscureText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  String? errorText;
  bool isVisible = false;
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.hintText != null
            ? Padding(
              padding: 8.sp.padB,
              child: AppText(text: widget.hintText ?? ""),
            )
            : 0.0.sbH,
        TextFormField(
          maxLines: widget.maxHeight,
          focusNode: _focusNode,
          onChanged: (val) {
            setState(() {
              errorText = null;
            });
            widget.onChanged?.call(val);
          },
          onTap: widget.onTap,
          textAlign: widget.textAlign,
          validator: (v) {
            if (widget.validator != null) {
              final err = widget.validator!(v);
              setState(() {
                errorText = err;
              });
              return err;
            }
            return null;
          },
          obscuringCharacter: widget.obscureText == true ? '*' : '•',
          obscureText:
              widget.obscureText ?? widget.isPassword ? !isVisible : false,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          style:
              widget.style ??
              Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 16.sp,
                color: Colors.black,
              ),
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            contentPadding: widget.contentPadding ?? 14.sp.padA,
            border: widget.border,
            focusedBorder: widget.border,
            focusedErrorBorder: widget.border,
            enabledBorder: widget.border,
            errorBorder: widget.border,
            errorMaxLines: 3,
            errorText: null,
            hintText: widget.hint,
            helperText: widget.helperText,
            hintStyle:
                widget.hintStyle ??
                Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontSize: widget.hintSize,
                  fontWeight: FontWeight.w400,
                  color: widget.hintColor,
                ),
            fillColor: widget.fillColor,
            suffixIcon:
                widget.suffixIcon ??
                (widget.isPassword
                    ? IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      icon: Icon(
                        isVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    )
                    : widget.suffixIcon),
            errorStyle: Theme.of(
              context,
            ).inputDecorationTheme.errorStyle?.copyWith(fontSize: 12.sp),
          ),
        ),
      ],
    );
  }
}
