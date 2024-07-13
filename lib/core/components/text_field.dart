import 'package:flutter/material.dart';

class LNTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final String? errorMsg;
  final String? Function(String?)? onChanged;
  final int? minLines;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final String? initialValue;

  const LNTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.keyboardType,
    this.initialValue,
    this.textInputAction,
    this.suffixIcon,
    this.onTap,
    this.prefixIcon,
    this.validator,
    this.focusNode,
    this.errorMsg,
    this.onChanged,
    this.minLines,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      focusNode: focusNode,
      textCapitalization: TextCapitalization.sentences,
      onTap: onTap,
      textInputAction: textInputAction ?? TextInputAction.next,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        fillColor: Theme.of(context).colorScheme.secondary,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.4)),
        errorText: errorMsg,
        contentPadding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
      ),
      minLines: minLines ?? 1,
      maxLines: maxLines ?? 1,
      textAlignVertical: TextAlignVertical.center,
      onTapOutside: (PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
