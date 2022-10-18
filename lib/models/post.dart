import 'package:equatable/equatable.dart';

class Post extends Equatable {
  const Post({
    required this.id,
    this.title,
    required this.image,
    this.body,
    this.categoryId,
    this.status,
    this.label,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String? title;
  final String image;
  final String? body;
  final String? categoryId;
  final Status? status;
  final Label? label;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  /// Determine whether the current user is a premium user or not.
  bool get isPremium => label == Label.premium;

  @override
  List<Object?> get props =>
      [id, title, categoryId, status, label, createdAt, updatedAt];
}

enum Status { draft, published, pending }

enum Label { normal, premium }

List<Post> gallery = [
  Post(
    id: '001',
    title: 'Title',
    image:
        'https://plus.unsplash.com/premium_photo-1663133679087-bc5deb50ab00?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1002&q=80',
    body: 'Body',
    categoryId: '001',
    status: Status.published,
    label: Label.normal,
    createdAt: DateTime(2022, 1, 2),
    updatedAt: DateTime(2022, 1, 3),
  ),
  Post(
    id: '002',
    title: 'Title',
    image:
        'https://images.unsplash.com/photo-1665606133288-10784ac63596?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
    body: 'Body',
    categoryId: '002',
    status: Status.published,
    label: Label.premium,
    createdAt: DateTime(2022, 1, 2),
    updatedAt: DateTime(2022, 1, 3),
  ),
  Post(
    id: '003',
    title: 'Title',
    image:
        'https://images.unsplash.com/photo-1665922907499-9918475de9ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
    body: 'Body',
    categoryId: '003',
    status: Status.published,
    label: Label.normal,
    createdAt: DateTime(2022, 1, 2),
    updatedAt: DateTime(2022, 1, 3),
  ),
  Post(
    id: '004',
    title: 'Title',
    image:
        'https://images.unsplash.com/photo-1665999194714-3cc335925f6f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
    body: 'Body',
    categoryId: '004',
    status: Status.published,
    label: Label.premium,
    createdAt: DateTime(2022, 1, 2),
    updatedAt: DateTime(2022, 1, 3),
  ),
  Post(
    id: '005',
    title: 'Title',
    image:
        'https://plus.unsplash.com/premium_photo-1663127548177-a1bae9639141?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
    body: 'Body',
    categoryId: '005',
    status: Status.published,
    label: Label.premium,
    createdAt: DateTime(2022, 1, 2),
    updatedAt: DateTime(2022, 1, 3),
  ),
  Post(
    id: '006',
    title: 'Title',
    image:
        'https://images.unsplash.com/photo-1665946498289-7036efd34e22?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
    body: 'Body',
    categoryId: '006',
    status: Status.published,
    label: Label.normal,
    createdAt: DateTime(2022, 1, 2),
    updatedAt: DateTime(2022, 1, 3),
  ),
  Post(
    id: '007',
    title: 'Title',
    image:
        'https://images.unsplash.com/photo-1665873183648-649ad63e4df4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
    body: 'Body',
    categoryId: '007',
    status: Status.published,
    label: Label.normal,
    createdAt: DateTime(2022, 1, 2),
    updatedAt: DateTime(2022, 1, 3),
  ),
  Post(
    id: '008',
    title: 'Title',
    image:
        'https://images.unsplash.com/photo-1665916712273-d5d74843683b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=654&q=80',
    body: 'Body',
    categoryId: '008',
    status: Status.published,
    label: Label.premium,
    createdAt: DateTime(2022, 1, 2),
    updatedAt: DateTime(2022, 1, 3),
  ),
  Post(
    id: '009',
    title: 'Title',
    image:
        'https://images.unsplash.com/photo-1665779829294-f2297a628d8b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2072&q=80',
    body: 'Body',
    categoryId: '009',
    status: Status.published,
    label: Label.normal,
    createdAt: DateTime(2022, 1, 2),
    updatedAt: DateTime(2022, 1, 3),
  ),
  Post(
    id: '010',
    title: 'Title',
    image:
        'https://images.unsplash.com/photo-1665875828826-366783aad23e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
    body: 'Body',
    categoryId: '010',
    status: Status.published,
    label: Label.premium,
    createdAt: DateTime(2022, 1, 2),
    updatedAt: DateTime(2022, 1, 3),
  ),
  Post(
    id: '011',
    title: 'Title',
    image:
        'https://images.unsplash.com/photo-1665873202484-20dc430ad6ef?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
    body: 'Body',
    categoryId: '010',
    status: Status.published,
    label: Label.normal,
    createdAt: DateTime(2022, 1, 2),
    updatedAt: DateTime(2022, 1, 3),
  ),
  Post(
    id: '012',
    title: 'Title',
    image:
        'https://images.unsplash.com/photo-1661956602116-aa6865609028?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1064&q=80',
    body: 'Body',
    categoryId: '010',
    status: Status.published,
    label: Label.normal,
    createdAt: DateTime(2022, 1, 2),
    updatedAt: DateTime(2022, 1, 3),
  ),
];
