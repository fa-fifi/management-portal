import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/models/post.dart';
import 'package:flutter_firebase_login/repositories/post.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  Future<Post>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      children: [
        TextField(
          controller: _titleController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(hintText: 'Enter Title'),
        ),
        const Divider(),
        TextField(
          controller: _bodyController,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(hintText: 'Enter Body'),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _futureAlbum = PostRepository.createPost(
                  100,
                  _titleController.text,
                  _bodyController.text,
                );
              });
            },
            child: const Text('Upload'),
          ),
        ),
      ],
    );
  }

  FutureBuilder<Post> buildFutureBuilder() {
    return FutureBuilder<Post>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              title: Text(snapshot.data!.title!),
              subtitle: Text(snapshot.data!.body!),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
