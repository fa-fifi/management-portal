import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/models/comment.dart';
import 'package:flutter_firebase_login/models/post.dart';
import 'package:flutter_firebase_login/pages/update.dart';
import 'package:flutter_firebase_login/repositories/post.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key, required this.id});
  final int id;

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late Future<Post> _future;
  late Future<List<Comment>> _fetchComments;

  @override
  void initState() {
    super.initState();
    _future = PostRepository.fetchPost(id: widget.id);
    _fetchComments = PostRepository.fetchComments(postId: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post ${widget.id}'),
      ),
      body: Column(
        children: [
          FutureBuilder<Post>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      title: Text(snapshot.data?.title ?? 'Deleted'),
                      subtitle: Text(snapshot.data?.body ?? 'Deleted'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _future = PostRepository.deletePost(
                              snapshot.data!.id.toString(),
                            );
                          });
                        },
                        child: const Text('Delete'),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
              }
              return const CircularProgressIndicator();
            },
          ),
          const Text('Comments'),
          FutureBuilder<List<Comment>>(
            future: _fetchComments,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                debugPrint(snapshot.data.toString());
                return Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text(snapshot.data![index].name),
                            subtitle: Text(snapshot.data![index].body),
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Edit Post',
        onPressed: () => Navigator.of(context).push(
          // ignore: inference_failure_on_instance_creation
          MaterialPageRoute(
            builder: (context) => UpdateScreen(id: widget.id),
          ),
        ),
        child: const Icon(Icons.edit),
      ),
    );
  }
}
