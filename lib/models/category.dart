import 'package:equatable/equatable.dart';

class Category extends Equatable {
  const Category({
    required this.id,
    this.name,
    this.description,
    this.activated = false,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String? name;
  final String? description;
  final bool activated;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  List<Object?> get props =>
      [id, name, description, activated, createdAt, updatedAt];
}
