import 'dart:convert';
import 'package:flutter_firebase_login/models/comment.dart';
import 'package:flutter_firebase_login/models/post.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  static const String url = 'https://jsonplaceholder.typicode.com';
  static const Map<String, String> header = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  static Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('$url/posts'));

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load posts.');
    }
  }

  static Future<Post> fetchPost({required int id}) async {
    final response = await http.get(Uri.parse('$url/posts/$id'));

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load post $id.');
    }
  }

  static Future<List<Comment>> fetchComments({required int postId}) async {
    final response = await http.get(Uri.parse('$url/posts/$postId/comments'));

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load comments.');
    }
  }

  static Future<Post> createPost(int userId, String title, String body) async {
    final response = await http.post(
      Uri.parse('$url/posts'),
      headers: header,
      body: jsonEncode(
        <String, dynamic>{'userId': userId, 'title': title, 'body': body},
      ),
    );

    if (response.statusCode == 201) {
      return Post.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to create post.');
    }
  }

  static Future<Post> updatePost(
    int userId,
    int id,
    String title,
    String body,
  ) async {
    final uri = Uri.parse('$url/posts/$id');
    final jsonString = jsonEncode(<String, dynamic>{
      'userId': userId,
      if (title.isNotEmpty) 'title': title,
      if (body.isNotEmpty) 'body': body
    });

    final response = title.isNotEmpty || body.isNotEmpty
        ? await http.patch(
            uri,
            headers: header,
            body: jsonString,
          )
        : await http.put(
            uri,
            headers: header,
            body: jsonString,
          );

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to update post.');
    }
  }

  static Future<Post> deletePost(String id) async {
    final response = await http.delete(
      Uri.parse('$url/posts/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to delete post.');
    }
  }
}
