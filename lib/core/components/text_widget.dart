import 'package:flutter/material.dart';

enum LHTextType {
  standard,
  title,
  subtitle,
}

class LHText extends StatelessWidget {
  const LHText({super.key, required this.text, required this.textType});

  final String text;
  final LHTextType textType;

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
