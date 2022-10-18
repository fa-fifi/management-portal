import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    this.username,
    this.fullname,
    this.email,
    this.photo,
    this.membership = Membership.normal,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String? username;
  final String? fullname;
  final String? email;
  final String? photo;
  final Membership membership;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  /// Empty user which represents an unauthenticated user.
  static const empty = User(id: '');

  /// Determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;

  /// Determine whether the current user is a premium user or not.
  bool get isPremium => membership == Membership.premium;

  @override
  List<Object?> get props =>
      [id, username, fullname, email, photo, membership, createdAt, updatedAt];
}

enum Membership { normal, premium }
