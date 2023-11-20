import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DynamicButton extends StatelessWidget {
  final String? text;
  final double? height;
  final double? width;
  final Color? textColor;
  final Color? bgColor;
  final void Function()? function1;
  final TextStyle? style;
  final Widget? child;
  final double? elevation;
  const DynamicButton({
    super.key,
    required this.text,
    this.height,
    this.width,
    this.textColor,
    this.function1,
    this.style,
    this.bgColor,
    this.child,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: elevation,
      minWidth: width ?? double.infinity,
      height: height ?? 50,
      color: bgColor ?? Colors.blue,
      textColor: textColor ?? Colors.white,
      disabledColor: Colors.grey,
      onPressed: function1,
      child: child ??
          Text(
            text ?? '',
            style: style ??
                GoogleFonts.montserrat(
                  fontSize: 14,
                ),
          ),
    );
  }
}
