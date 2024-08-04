import 'package:flutter/material.dart';
import 'package:notes_repository/notes_repository.dart';
import 'package:material_symbols_icons/symbols.dart';

class NoteSettingsCell extends StatelessWidget {
  const NoteSettingsCell({
    super.key,
    required this.note,
    this.category = "",
  });

  final NoteModel note;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Icon(
              size: 30,
              Icons.done_rounded,
              color: !note.isLearned
                  ? Theme.of(context).colorScheme.onBackground.withOpacity(0.3)
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    note.originalText,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    note.translatedText,
                    style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.7),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  category,
                  style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.4),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          Align(
            alignment: Alignment.topCenter,
            child: Icon(
                size: 30,
                Symbols.delete_rounded,
                color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ),
    );
  }
}
