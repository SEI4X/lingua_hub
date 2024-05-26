import 'package:flutter/material.dart';

class NoteListCell extends StatelessWidget {
  const NoteListCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Text(
                  "Apperitize",
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
                  "Закуска / Апперитив",
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
                "Food",
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
          Expanded(child: Container()),
          Align(
            alignment: Alignment.topCenter,
            child: Icon(
              size: 30,
              Icons.done_rounded,
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
            ),
          )
        ],
      ),
    );
  }
}
