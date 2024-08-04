import 'package:flutter/material.dart';
import 'package:notes_repository/notes_repository.dart';
import 'package:shimmer/shimmer.dart';

class NoteListCell extends StatelessWidget {
  const NoteListCell(
      {super.key,
      required this.note,
      this.category = "",
      this.isLoading = false});

  final bool isLoading;
  final NoteModel note;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: isLoading
                      ? Shimmer.fromColors(
                          baseColor: Colors.grey.shade100,
                          highlightColor: Colors.white,
                          child: Container(
                            width: 200,
                            height: 20,
                            color: Colors.white,
                          ),
                        )
                      : Text(
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
                  child: isLoading
                      ? Shimmer.fromColors(
                          baseColor: Colors.grey.shade100,
                          highlightColor: Colors.white,
                          child: Container(
                            width: 150,
                            height: 15,
                            color: Colors.white,
                          ),
                        )
                      : Text(
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
                isLoading
                    ? Shimmer.fromColors(
                        baseColor: Colors.grey.shade100,
                        highlightColor: Colors.white,
                        child: Container(
                          width: 100,
                          height: 15,
                          color: Colors.white,
                        ),
                      )
                    : Text(
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
              Icons.done_rounded,
              color: !note.isLearned
                  ? Theme.of(context).colorScheme.onBackground.withOpacity(0.3)
                  : Theme.of(context).colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }
}
