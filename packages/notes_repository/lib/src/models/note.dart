import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_repository/notes_repository.dart';
import '../entities/entities.dart';

class NoteModel extends Equatable {
  final String? id;
  final String originalText;
  final String translatedText;
  final String? transcription;
  final String? notes;
  final String? examples;
  final String categoryId;
  final int learnCount;
  final Timestamp? createDate;
  final Timestamp? learnDate;
  final Timestamp? lastLearnDate;
  final bool isAutoTranslated;
  final bool isLearned;

  const NoteModel({
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

  static const empty = NoteModel(
    id: '',
    originalText: '',
    translatedText: '',
    transcription: '',
    notes: '',
    examples: '' '',
    categoryId: '0',
    learnCount: 0,
    createDate: null,
    learnDate: null,
    lastLearnDate: null,
    isAutoTranslated: false,
    isLearned: false,
  );

  NoteModel copyWith({
    String? id,
    String? originalText,
    String? translatedText,
    String? transcription,
    String? notes,
    String? examples,
    String? categoryId,
    int? learnCount,
    Timestamp? createDate,
    Timestamp? learnDate,
    Timestamp? lastLearnDate,
    bool? isAutoTranslated,
    bool? isLearned,
  }) {
    return NoteModel(
      id: id ?? this.id,
      originalText: originalText ?? this.originalText,
      translatedText: translatedText ?? this.translatedText,
      transcription: transcription ?? this.transcription,
      notes: notes ?? this.notes,
      examples: examples ?? this.examples,
      categoryId: categoryId ?? this.categoryId,
      learnCount: learnCount ?? this.learnCount,
      createDate: createDate ?? this.createDate,
      learnDate: learnDate ?? this.learnDate,
      lastLearnDate: lastLearnDate ?? this.lastLearnDate,
      isAutoTranslated: isAutoTranslated ?? this.isAutoTranslated,
      isLearned: isLearned ?? this.isLearned,
    );
  }

  NoteEntity toEntity() {
    return NoteEntity(
      id: id,
      originalText: originalText,
      translatedText: translatedText,
      transcription: transcription,
      notes: notes,
      examples: examples,
      categoryId: categoryId,
      learnCount: learnCount,
      createDate: createDate,
      learnDate: learnDate,
      lastLearnDate: lastLearnDate,
      isAutoTranslated: isAutoTranslated,
      isLearned: isLearned,
    );
  }

  static NoteModel fromEntity(NoteEntity entity) {
    return NoteModel(
      id: entity.id,
      originalText: entity.originalText,
      translatedText: entity.translatedText,
      transcription: entity.transcription,
      notes: entity.notes,
      examples: entity.examples,
      categoryId: entity.categoryId,
      learnCount: entity.learnCount,
      createDate: entity.createDate,
      learnDate: entity.learnDate,
      lastLearnDate: entity.lastLearnDate,
      isAutoTranslated: entity.isAutoTranslated,
      isLearned: entity.isLearned,
    );
  }

  static NoteModel fromLocal(NoteLocal entity) {
    return NoteModel(
      id: entity.serverId,
      originalText: entity.originalText ?? "",
      translatedText: entity.translatedText ?? "",
      transcription: entity.transcription,
      notes: entity.notes,
      examples: entity.examples,
      categoryId: entity.categoryId ?? "",
      learnCount: entity.learnCount ?? 0,
      createDate: Timestamp.fromDate(entity.createDate ?? DateTime.now()),
      learnDate: Timestamp.fromDate(entity.learnDate ?? DateTime.now()),
      lastLearnDate: Timestamp.fromDate(entity.lastLearnDate ?? DateTime.now()),
      isAutoTranslated: entity.isAutoTranslated ?? false,
      isLearned: entity.isLearned ?? false,
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
