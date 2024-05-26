import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua_notes/blocs/note_list/categories/categories_bloc.dart';

class LNChipsList extends StatefulWidget {
  const LNChipsList({super.key});

  @override
  State<LNChipsList> createState() => _LNChipsListState();
}

class _LNChipsListState extends State<LNChipsList> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryListingBloc, CategoryListingState>(
      listener: (context, state) {
        if (state.status == CategoriesStatus.success) {
          setState(() {});
        } else if (state.status == CategoriesStatus.loading) {
          setState(() {});
        }
      },
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 8),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
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
              selected: _value == index,
              onSelected: (bool selected) {
                setState(() {
                  _value = index;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
