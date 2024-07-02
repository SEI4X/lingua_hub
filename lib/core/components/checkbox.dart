import 'package:flutter/material.dart';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    super.key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
    this.isActive = true,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isActive) {
          onChanged(!value);
        }
      },
      child: Padding(
        padding: padding,
        child: Opacity(
          opacity: isActive ? 1 : 0.3,
          child: Row(
            children: <Widget>[
              Transform.scale(
                scale: 1.6,
                child: Checkbox(
                  value: value,
                  fillColor: WidgetStateProperty.resolveWith((states) {
                    if (!states.contains(WidgetState.selected)) {
                      return Theme.of(context).colorScheme.secondary;
                    }
                    return null;
                  }),
                  activeColor: Theme.of(context).colorScheme.surface,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  side: BorderSide.none,
                  onChanged: (bool? newValue) {
                    onChanged(newValue!);
                  },
                ),
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
