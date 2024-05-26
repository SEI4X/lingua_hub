import 'package:equatable/equatable.dart';

class NoteCategoryEntity extends Equatable {
  final String id;
  final String name;

  const NoteCategoryEntity({
    required this.id,
    required this.name,
  });

  Map<String, Object?> toJSON() {
    return {
      'id': id,
      'name': name,
    };
  }

  static NoteCategoryEntity fromJSON(Map<String, dynamic> json) {
    return NoteCategoryEntity(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  List<Object?> get props => [id, name];
}
