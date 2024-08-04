import 'dart:math';

import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:lingua_notes/core/components/standard_button.dart';
import 'package:lingua_notes/core/components/text_widget.dart';
import 'package:lingua_notes/screens/learning_swipe/home/card/card_widget.dart';
import 'package:lingua_notes/screens/learning_swipe/settings/cards_learning_settings_screen.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:uuid/uuid.dart';

class LearningCardsScreen extends StatefulWidget {
  const LearningCardsScreen({super.key});

  @override
  State<LearningCardsScreen> createState() => _LearningCardsScreenState();
}

class _LearningCardsScreenState extends State<LearningCardsScreen> {
  CardSwiperController cardSwiperController = CardSwiperController();
  double _currentStep = 0.0;
  int learnedCount = 0;
  int currentCardIndex = 0;
  bool isCardShowed = false;
  CardsLearningSettingsConfig config = CardsLearningSettingsConfig();
  List<LearningCard> cards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 12,
          top: MediaQuery.of(context).viewPadding.top,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LHText(
                    text: "LinguaHub",
                    textType: LHTextType.header,
                    textAlign: TextAlign.left,
                    textColor: Theme.of(context).colorScheme.onBackground),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CardsLearningSettingsScreen(
                          config: config,
                        ),
                      ),
                    ).then((value) {
                      if (value is List) {
                        applySettings(value[0]);
                      }
                    });
                  },
                  icon: const Icon(
                    Symbols.tune_rounded,
                    size: 26,
                    weight: 600,
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              minHeight: 4,
              borderRadius: BorderRadiusDirectional.circular(5),
              backgroundColor:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
              value: _currentStep,
            ),
            Flexible(
              child: Builder(builder: (context) {
                if (cards.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LHText(
                        text: "Setup your learning process",
                        textType: LHTextType.title,
                        textAlign: TextAlign.left,
                        textColor: Theme.of(context).colorScheme.onBackground,
                      ),
                      SizedBox(height: 16),
                      LHButton(
                          text: "Go to settings",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CardsLearningSettingsScreen(
                                  config: config,
                                ),
                              ),
                            ).then((value) {
                              if (value is List) {
                                applySettings(value[0]);
                              }
                            });
                          }),
                    ],
                  );
                } else {
                  return CardSwiper(
                    isLoop: true,
                    initialIndex: 0,
                    controller: cardSwiperController,
                    allowedSwipeDirection: isCardShowed
                        ? const AllowedSwipeDirection.only(left: true)
                        : const AllowedSwipeDirection.symmetric(
                            horizontal: true),
                    threshold: 50,
                    cardBuilder:
                        (context, index, percentThresholdX, percentThresholdY) {
                      currentCardIndex = index;

                      return InkWell(
                        child: cards[index],
                        onTap: () {
                          if (currentCardIndex == 0) {
                            currentCardIndex = cards.length - 1;
                          } else {
                            currentCardIndex--;
                          }

                          if (!isCardShowed) {
                            cards[currentCardIndex].controller.toggleCard();
                          }

                          setState(() {
                            isCardShowed = true;
                          });
                        },
                      );
                    },
                    cardsCount: cards.length,
                    onSwipe: (previousIndex, currentIndex, direction) {
                      if (direction == CardSwiperDirection.right) {
                        learnedCount++;
                        _nextStep();
                      }
                      setState(() {
                        isCardShowed = false;
                      });

                      return true;
                    },
                  );
                }
              }),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Ink(
                  decoration: ShapeDecoration(
                    color: Theme.of(context).colorScheme.error,
                    shape: const CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Symbols.close_rounded,
                      size: 30,
                      weight: 600,
                    ),
                    color: Colors.white,
                    onPressed: () {
                      cardSwiperController.swipe(CardSwiperDirection.left);
                    },
                  ),
                ),
                const SizedBox(width: 24),
                SizedBox(
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (currentCardIndex == 0) {
                          currentCardIndex = cards.length - 1;
                        } else {
                          currentCardIndex--;
                        }
                        if (!isCardShowed) {
                          cards[currentCardIndex].controller.toggleCard();
                        }

                        isCardShowed = true;
                      });
                    },
                    style: TextButton.styleFrom(
                        elevation: 0,
                        backgroundColor: !isCardShowed
                            ? Theme.of(context).colorScheme.surface
                            : Theme.of(context)
                                .colorScheme
                                .surface
                                .withOpacity(0.6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Show card",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                Ink(
                  decoration: ShapeDecoration(
                    color: isCardShowed
                        ? Theme.of(context).colorScheme.primary.withOpacity(0.6)
                        : Theme.of(context).colorScheme.primary,
                    shape: const CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Symbols.done_rounded,
                      size: 30,
                      weight: 600,
                    ),
                    color: Colors.white,
                    onPressed: () {
                      if (isCardShowed == false) {
                        cardSwiperController.swipe(CardSwiperDirection.right);
                      }
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _nextStep() {
    setState(() {
      if (_currentStep < cards.length) {
        _currentStep = learnedCount.toDouble() / cards.length.toDouble();
      }
    });
  }

  void applySettings<T>(T config) {
    if (config is CardsLearningSettingsConfig) {
      setState(() {
        cardSwiperController.moveTo(0);
        this.config = config;
        cards = [];
        _currentStep = 0;
        isCardShowed = false;
        currentCardIndex = 0;
        var shuffledNotes = config.notes;
        shuffledNotes.shuffle();
        cards = List.generate(shuffledNotes.length, (index) {
          var cardStyle = config.cardsStyleType;
          if (cardStyle == CardsStyleType.foreign) {
            return LearningCard(
              frontText: shuffledNotes[index].originalText,
              backText: shuffledNotes[index].translatedText,
              index: const Uuid().v8(),
            );
          } else if (cardStyle == CardsStyleType.native) {
            return LearningCard(
              frontText: shuffledNotes[index].translatedText,
              backText: shuffledNotes[index].originalText,
              index: const Uuid().v8(),
            );
          } else {
            var randomSalt = Random().nextBool();
            return LearningCard(
              frontText: randomSalt
                  ? shuffledNotes[index].originalText
                  : shuffledNotes[index].translatedText,
              backText: randomSalt
                  ? shuffledNotes[index].translatedText
                  : shuffledNotes[index].originalText,
              index: const Uuid().v8(),
            );
          }
        });
      });
    }
  }
}
