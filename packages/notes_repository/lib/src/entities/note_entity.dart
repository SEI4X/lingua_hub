import 'package:equatable/equatable.dart';
import 'note_category_entity.dart';

class NoteEntity extends Equatable {
  final String? id;
  final String originalText;
  final String translatedText;
  final String? transcription;
  final String? notes;
  final String? examples;
  final String categoryId;
  final int learnCount;
  final String createDate;
  final String? learnDate;
  final String? lastLearnDate;
  final bool isAutoTranslated;
  final bool isLearned;

  const NoteEntity({
    this.id,
    required this.originalText,
    required this.translatedText,
    this.transcription,
    this.notes,
    this.examples,
    required this.categoryId,
    required this.learnCount,
    required this.createDate,
    this.learnDate,
    this.lastLearnDate,
    required this.isAutoTranslated,
    required this.isLearned,
  });

  Map<String, Object?> toJSON() {
    return {
      'id': id,
      'originalText': originalText,
      'translatedText': translatedText,
      'transcription': transcription,
      'notes': notes,
      'examples': examples,
      'categoryId': categoryId,
      'learnCount': learnCount,
      'createDate': createDate,
      'learnDate': learnDate,
      'lastLearnDate': lastLearnDate,
      'isAutoTranslated': isAutoTranslated,
      'isLearned': isLearned,
    };
  }

  static NoteEntity fromJSON(Map<String, dynamic> json) {
    return NoteEntity(
      id: json['id'],
      originalText: json['originalText'],
      translatedText: json['translatedText'],
      transcription: json['transcription'],
      notes: json['notes'],
      examples: json['examples'],
      categoryId: json['categoryId'],
      learnCount: json['learnCount'],
      createDate: json['createDate'],
      learnDate: json['learnDate'],
      lastLearnDate: json['lastLearnDate'],
      isAutoTranslated: json['isAutoTranslated'],
      isLearned: json['isLearned'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        originalText,
        translatedText,
        transcription,
        notes,
        examples,
        categoryId,
        learnCount,
        createDate,
        learnDate,
        lastLearnDate,
        isAutoTranslated,
        isLearned,
      ];
}
