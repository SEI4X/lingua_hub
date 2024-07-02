import 'package:flutter/material.dart';
import 'package:notes_repository/notes_repository.dart';
import 'package:shimmer/shimmer.dart';

class LNChipsList extends StatefulWidget {
  const LNChipsList({
    super.key,
    required this.categories,
    this.isLoading = false,
    required this.completion,
  });

  final List<NoteCategoryModel> categories;
  final bool isLoading;
  final ValueSetter<String> completion;

  @override
  State<LNChipsList> createState() => _LNChipsListState();
}

class _LNChipsListState extends State<LNChipsList> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 8),
      scrollDirection: Axis.horizontal,
      itemCount: widget.isLoading ? 5 : widget.categories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: widget.isLoading
              ? Shimmer.fromColors(
                  baseColor: Colors.grey.shade100,
                  highlightColor: Colors.white,
                  child: const ChoiceChip(
                    label: SizedBox(
                      width: 100,
                      height: 30,
                    ),
                    selected: false,
                  ))
              : ChoiceChip(
                  labelStyle: TextStyle(
                    color: index == _value
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
                  label: Text(
                    widget.categories[index].name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  selected: _value == index,
                  onSelected: (bool selected) {
                    setState(() {
                      _value = index;
                      widget.completion(widget.categories[index].id);
                    });
                  },
                ),
        );
      },
    );
  }
}
