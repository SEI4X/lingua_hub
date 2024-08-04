// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

import 'package:lingua_notes/core/components/text_widget.dart';

class LearningCard extends StatelessWidget {
  LearningCard({
    super.key,
    required this.frontText,
    required this.backText,
    required this.index,
  });

  final String frontText;
  final String backText;
  final String index;
  final FlipCardController controller = FlipCardController();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('flip$index'),
      child: FlipCard(
        controller: controller,
        flipOnTouch: false,
        fill: Fill.fillBack,
        side: CardSide.FRONT,
        front: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 2,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LHText(
                  text: frontText,
                  textType: LHTextType.header,
                  textAlign: TextAlign.center,
                  textColor: Theme.of(context).colorScheme.onSecondary,
                ),
                const SizedBox(height: 16),
                LHText(
                  text:
                      "Tap to see translate\n (Word would be сounted as unstudied)",
                  textType: LHTextType.subtitle,
                  textAlign: TextAlign.center,
                  textColor: Theme.of(context)
                      .colorScheme
                      .onSecondary
                      .withOpacity(0.7),
                ),
              ],
            ),
          ),
        ),
        back: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 2,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LHText(
                  text: backText,
                  textType: LHTextType.title,
                  textAlign: TextAlign.center,
                  textColor: Theme.of(context).colorScheme.onSecondary,
                ),
                const SizedBox(height: 10),
                LHText(
                    text: "This is translate",
                    textType: LHTextType.standard,
                    textAlign: TextAlign.center,
                    textColor: Theme.of(context).colorScheme.onSecondary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
