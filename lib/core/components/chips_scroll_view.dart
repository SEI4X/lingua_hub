import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:notes_repository/notes_repository.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  List<NoteCategoryModel> categories = [];

  @override
  Widget build(BuildContext context) {
    categories = [];
    categories.add(const NoteCategoryModel(id: "", name: "All"));
    categories.addAll(widget.categories);

    return ListView.builder(
      padding: const EdgeInsets.only(left: 8),
      scrollDirection: Axis.horizontal,
      itemCount: widget.isLoading ? 5 : categories.length,
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
              : GestureDetector(
                  onLongPressStart: (details) {
                    if (index != 0) {
                      _showCustomMenu(
                        context,
                        details.globalPosition,
                        categories[index],
                      );
                    }
                  },
                  child: ChoiceChip(
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
                      left: 20,
                      right: 20,
                      top: 10,
                      bottom: 10,
                    ),
                    shape: const StadiumBorder(),
                    label: Text(
                      categories[index].name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    selected: _value == index,
                    onSelected: (bool selected) {
                      setState(() {
                        _value = index;
                        widget.completion(categories[index].id);
                      });
                    },
                  ),
                ),
        );
      },
    );
  }

  void _showCustomMenu(
      BuildContext context, Offset offset, NoteCategoryModel category) {
    final RenderObject overlay =
        Overlay.of(context).context.findRenderObject()!;

    showMenu(
        context: context,
        items: [
          PopupMenuItem(
            child: Row(children: [
              const Icon(Symbols.edit_rounded),
              const SizedBox(width: 16),
              Text(
                '${AppLocalizations.of(context)!.edit} ${category.name}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.left,
              )
            ]),
            onTap: () {
              // tap on menu entry: do something
            },
          ),
          PopupMenuItem(
            child: Row(children: [
              const Icon(Symbols.delete_rounded),
              const SizedBox(width: 16),
              Text(
                '${AppLocalizations.of(context)!.delete} ${category.name}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.left,
              )
            ]),
            onTap: () {
              // tap on menu entry: do something
            },
          ),
        ],
        position: RelativeRect.fromRect(
          Rect.fromLTWH(offset.dx, offset.dy, 30, 30),
          Rect.fromLTWH(0, 0, overlay.paintBounds.size.width,
              overlay.paintBounds.size.height),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))));
  }
}
