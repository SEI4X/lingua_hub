import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class CounterView extends StatefulWidget {
  const CounterView({
    super.key,
    required this.initNumber,
    required this.counterCallback,
    required this.increaseCallback,
    required this.decreaseCallback,
    required this.minNumber,
    required this.maxNumber,
  });

  final int initNumber;
  final Function(int) counterCallback;
  final Function increaseCallback;
  final Function decreaseCallback;
  final int minNumber;
  final int maxNumber;
  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  late int _currentCount;
  late Function _counterCallback;
  late Function _increaseCallback;
  late Function _decreaseCallback;
  late int _minNumber;
  late int _maxNumber;

  @override
  void initState() {
    _currentCount = widget.initNumber;
    _counterCallback = widget.counterCallback;
    _increaseCallback = widget.increaseCallback;
    _decreaseCallback = widget.decreaseCallback;
    _minNumber = widget.minNumber;
    _maxNumber = widget.maxNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _createIncrementDicrementButton(
              Symbols.remove_rounded, () => _dicrement()),
          Text(
            _currentCount.toString(),
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          _createIncrementDicrementButton(
              Symbols.add_rounded, () => _increment()),
        ],
      ),
    );
  }

  void _increment() {
    setState(() {
      if (_currentCount < _maxNumber) {
        _currentCount++;
        _counterCallback(_currentCount);
        _increaseCallback();
      }
    });
  }

  void _dicrement() {
    setState(() {
      if (_currentCount > _minNumber) {
        _currentCount--;
        _counterCallback(_currentCount);
        _decreaseCallback();
      }
    });
  }

  Widget _createIncrementDicrementButton(
      IconData icon, VoidCallback onPressed) {
    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      constraints: const BoxConstraints(minWidth: 40.0, minHeight: 40.0),
      onPressed: onPressed,
      elevation: 2.0,
      fillColor: Theme.of(context).colorScheme.surface,
      shape: const CircleBorder(),
      child: Icon(
        icon,
        color: Theme.of(context).colorScheme.onSurface,
        size: 16.0,
        weight: 800,
      ),
    );
  }
}
