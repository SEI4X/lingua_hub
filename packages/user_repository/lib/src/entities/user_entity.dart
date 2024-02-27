import 'package:equatable/equatable.dart';

class UserModelEntity extends Equatable {
  final String id;
  final String email;
  final String name;

  const UserModelEntity({
    required this.id,
    required this.email,
    required this.name,
  });

  Map<String, Object?> toJSON() {
    return {
      'id': id,
      'email': email,
      'name': name,
    };
  }

  static UserModelEntity fromJSON(Map<String, dynamic> json) {
    return UserModelEntity(
      id: json['id'],
      email: json['email'],
      name: json['name'],
    );
  }

  @override
  List<Object?> get props => [id, email, name];
}
