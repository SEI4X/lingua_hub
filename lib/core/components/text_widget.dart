import 'package:flutter/material.dart';

enum LHTextType {
  standard,
  header,
  title,
  subtitle,
}

class LHText extends StatelessWidget {
  const LHText({
    super.key,
    required this.text,
    required this.textType,
    required this.textAlign,
    required this.textColor,
  });

  final String text;
  final LHTextType textType;
  final TextAlign textAlign;
  final Color textColor;

  TextStyle style(BuildContext context) {
    switch (textType) {
      case LHTextType.standard:
        return TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        );
      case LHTextType.title:
        return TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        );
      case LHTextType.subtitle:
        return TextStyle(
          color: textColor,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        );
      case LHTextType.header:
        return TextStyle(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: style(context),
      textAlign: textAlign,
    );
  }
}
