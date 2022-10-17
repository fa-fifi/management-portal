import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, this.photo, this.size});

  final String? photo;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundImage: photo != null ? NetworkImage(photo!) : null,
      child: photo == null ? Icon(Icons.person_outline, size: size) : null,
    );
  }
}
