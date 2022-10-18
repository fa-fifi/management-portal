import 'package:equatable/equatable.dart';

class Payment extends Equatable {
  const Payment({
    required this.id,
    this.amount,
    this.method,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String? amount;
  final String? method;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  List<Object?> get props => [id, amount, method, status, createdAt, updatedAt];
}
