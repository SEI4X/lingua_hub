import 'package:flutter/material.dart';

class LNChipsMultiline extends StatefulWidget {
  const LNChipsMultiline({super.key});

  @override
  State<LNChipsMultiline> createState() => _LNChipsMultilineState();
}

class _LNChipsMultilineState extends State<LNChipsMultiline> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: 10, runSpacing: 4, children: [
      ChoiceChip(
        labelStyle: TextStyle(
          color: 1 == _value
              ? Theme.of(context).colorScheme.onSurface
              : Theme.of(context).colorScheme.onSecondary,
        ),
        pressElevation: 0,
        elevation: 0,
        selectedColor: Theme.of(context).colorScheme.surface,
        disabledColor: Theme.of(context).colorScheme.secondary,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.only(
          left: 40,
          right: 40,
          top: 10,
          bottom: 10,
        ),
        shape: const StadiumBorder(),
        label: const Text(
          "Abvifg",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        selected: _value == 1,
        onSelected: (bool selected) {
          setState(() {
            _value = _value == 1 ? 0 : 1;
          });
        },
      ),
      ChoiceChip(
        labelStyle: TextStyle(
          color: 2 == _value
              ? Theme.of(context).colorScheme.onSurface
              : Theme.of(context).colorScheme.onSecondary,
        ),
        pressElevation: 0,
        elevation: 0,
        selectedColor: Theme.of(context).colorScheme.surface,
        disabledColor: Theme.of(context).colorScheme.secondary,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.only(
          left: 40,
          right: 40,
          top: 10,
          bottom: 10,
        ),
        shape: const StadiumBorder(),
        label: const Text(
          "Abrakadabrta",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        selected: _value == 2,
        onSelected: (bool selected) {
          setState(() {
            _value = _value == 2 ? 0 : 2;
          });
        },
      ),
      ChoiceChip(
        labelStyle: TextStyle(
          color: 3 == _value
              ? Theme.of(context).colorScheme.onSurface
              : Theme.of(context).colorScheme.onSecondary,
        ),
        pressElevation: 0,
        elevation: 0,
        selectedColor: Theme.of(context).colorScheme.surface,
        disabledColor: Theme.of(context).colorScheme.secondary,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.only(
          left: 40,
          right: 40,
          top: 10,
          bottom: 10,
        ),
        shape: const StadiumBorder(),
        label: const Text(
          "Test",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        selected: _value == 3,
        onSelected: (bool selected) {
          setState(() {
            _value = _value == 3 ? 0 : 3;
          });
        },
      ),
      ChoiceChip(
        labelStyle: TextStyle(
          color: 4 == _value
              ? Theme.of(context).colorScheme.onSurface
              : Theme.of(context).colorScheme.onSecondary,
        ),
        pressElevation: 0,
        elevation: 0,
        selectedColor: Theme.of(context).colorScheme.surface,
        disabledColor: Theme.of(context).colorScheme.secondary,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.only(
          left: 40,
          right: 40,
          top: 10,
          bottom: 10,
        ),
        shape: const StadiumBorder(),
        label: const Text(
          "Brisdfg",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        selected: _value == 4,
        onSelected: (bool selected) {
          setState(() {
            _value = _value == 4 ? 0 : 4;
          });
        },
      ),
      ChoiceChip(
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
        ),
        pressElevation: 0,
        elevation: 0,
        selectedColor: Theme.of(context).colorScheme.background,
        disabledColor: Theme.of(context).colorScheme.background,
        backgroundColor: Theme.of(context).colorScheme.background,
        padding: const EdgeInsets.only(
          left: 40,
          right: 40,
          top: 10,
          bottom: 10,
        ),
        shape: StadiumBorder(
          side: BorderSide(
              color: Theme.of(context).colorScheme.onBackground, width: 1.7),
        ),
        label: const Text(
          "+",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        selected: false,
        onSelected: (bool selected) {
          setState(() {});
        },
      ),
    ]);
  }
}
