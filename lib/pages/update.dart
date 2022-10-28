import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/models/post.dart';
import 'package:flutter_firebase_login/repositories/post.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key, required this.id});
  final int id;

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  late Future<Post> _future;

  @override
  void initState() {
    super.initState();
    _future = PostRepository.fetchPost(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Post ${widget.id}'),
      ),
      body: FutureBuilder<Post>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        title: Text(snapshot.data!.title!),
                        subtitle: Text(snapshot.data!.body!),
                      ),
                    ),
                    const Divider(),
                    TextField(
                      controller: _titleController,
                      textInputAction: TextInputAction.next,
                      decoration:
                          const InputDecoration(hintText: 'Enter Title'),
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
                            _future = PostRepository.updatePost(
                              snapshot.data!.userId!,
                              snapshot.data!.id!,
                              _titleController.text,
                              _bodyController.text,
                            );
                          });
                        },
                        child: const Text('Update Post'),
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
