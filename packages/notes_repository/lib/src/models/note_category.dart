import 'package:equatable/equatable.dart';
import '../entities/entities.dart';

class NoteCategoryModel extends Equatable {
  final String id;
  final String name;

  const NoteCategoryModel({
    required this.id,
    required this.name,
  });

  static const empty = NoteCategoryModel(
    id: '',
    name: '',
  );

  NoteCategoryModel copyWith({
    String? id,
    String? name,
  }) {
    return NoteCategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  NoteCategoryEntity toEntity() {
    return NoteCategoryEntity(
      id: id,
      name: name,
    );
  }

  static NoteCategoryModel fromEntity(NoteCategoryEntity entity) {
    return NoteCategoryModel(
      id: entity.id,
      name: entity.name,
    );
  }

  @override
  List<Object?> get props => [id, name];
}
