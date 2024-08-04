import 'package:flutter/material.dart';
import 'package:lingua_notes/core/components/standard_button.dart';
import 'package:lingua_notes/core/components/text_field.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:notes_repository/notes_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LNChipsMultiline extends StatefulWidget {
  const LNChipsMultiline({
    super.key,
    required this.categories,
    required this.callback,
    required this.tapCallBack,
    this.isAddNewCategoryButton = true,
  });

  final List<NoteCategoryModel> categories;
  final void Function(NoteCategoryModel category) callback;
  final void Function(String category) tapCallBack;
  final bool isAddNewCategoryButton;

  @override
  State<LNChipsMultiline> createState() => _LNChipsMultilineState();
}

class _LNChipsMultilineState extends State<LNChipsMultiline> {
  String _categoryId = "";
  List<NoteCategoryModel> categories = [];
  final categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 10,
      runSpacing: 4,
      children: setList(),
    );
  }

  List<ChoiceChip> setList() {
    categories = widget.categories;
    List<ChoiceChip> chipList = categories.map(
      (category) {
        return ChoiceChip(
          labelStyle: TextStyle(
            color: category.id == _categoryId
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
            category.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          selected: _categoryId == category.id,
          onSelected: (bool selected) {
            setState(() {
              if (_categoryId == category.id) {
                _categoryId = "";
              } else {
                _categoryId = category.id;
              }
              widget.tapCallBack(_categoryId);
            });
          },
        );
      },
    ).toList();
    if (widget.isAddNewCategoryButton) {
      chipList.add(ChoiceChip(
        label: const Icon(
          Symbols.add_rounded,
          size: 20,
        ),
        pressElevation: 0,
        elevation: 0,
        selectedColor: Theme.of(context).colorScheme.background,
        disabledColor: Theme.of(context).colorScheme.background,
        backgroundColor: Theme.of(context).colorScheme.background,
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 7,
          bottom: 7,
        ),
        shape: StadiumBorder(
            side: BorderSide(
                color: Theme.of(context).colorScheme.onBackground, width: 1.5)),
        selected: false,
        onSelected: (value) {
          _dialogBuilder(context);
        },
      ));
    }

    return chipList;
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          title: Text(
            AppLocalizations.of(context)!.newCategory,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LNTextField(
                controller: categoryController,
                hintText: AppLocalizations.of(context)!.categoryName,
                obscureText: false,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: LHButton(
                  text: AppLocalizations.of(context)!.addNewCategory,
                  onPressed: () {
                    widget.callback(NoteCategoryModel(
                        id: "", name: categoryController.text));
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
