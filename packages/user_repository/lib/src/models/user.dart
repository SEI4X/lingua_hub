import 'package:equatable/equatable.dart';
import '../entities/entities.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;

  const UserModel({
    required this.id,
    required this.email,
    required this.name,
  });

  static const empty = UserModel(
    id: '',
    email: '',
    name: '',
  );

  UserModel copyWith({
    String? id,
    String? email,
    String? name,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }

  UserModelEntity toEntity() {
    return UserModelEntity(
      id: id,
      email: email,
      name: name,
    );
  }

  static UserModel fromEntity(UserModelEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      name: entity.name,
    );
  }

  @override
  List<Object?> get props => [id, email, name];
}
