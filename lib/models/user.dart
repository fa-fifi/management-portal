import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    this.username,
    this.fullname,
    this.email,
    this.photo,
    this.isPremium = false,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String? username;
  final String? fullname;
  final String? email;
  final String? photo;
  final bool isPremium;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  /// Empty user which represents an unauthenticated user.
  static const empty = User(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [email, id, username, photo];
}
