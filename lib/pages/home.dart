import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/bloc/auth_bloc.dart';
import 'package:flutter_firebase_login/models/post.dart';
import 'package:flutter_firebase_login/pages/post.dart';
import 'package:flutter_firebase_login/pages/upload.dart';
import 'package:flutter_firebase_login/repositories/post.dart';
import 'package:flutter_firebase_login/widgets/avatar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomeScreen());

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final user = context.select((AuthBloc bloc) => bloc.state.user);
  final List<Widget> categories = <Widget>[
    const Text('Popular'),
    const Text('Latest'),
    const Text('Oldest'),
  ];
  final List<bool> _selectedCategories = <bool>[true, false, false];
  late Future<List<Post>> _fetchPosts;

  Future<void> openDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierColor: Colors.grey.withOpacity(0.1),
      builder: (context) {
        return Dialog(
          elevation: 0,
          insetPadding: const EdgeInsets.only(right: 20, top: 70),
          alignment: Alignment.topRight,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            side: BorderSide(color: Colors.black12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Upgrade to Premium',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(LogoutRequested());
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Logout',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchPosts = PostRepository.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (str) {},
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.black38,
                      ),
                      hintText: 'Search',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextButton(
                    onPressed: () => showGeneralDialog(
                      context: context,
                      barrierColor: Colors.black12.withOpacity(0.6),
                      pageBuilder: (_, __, ___) {
                        return const UploadScreen();
                      },
                    ),
                    child: const Text('Upload'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    openDialog(context);
                  },
                  child: CircleAvatar(
                    radius: 26,
                    backgroundColor:
                        user.isPremium ? Colors.amber : Colors.blue,
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.white,
                      child: Avatar(photo: user.photo, size: 22),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20),
            child: ToggleButtons(
              onPressed: (int index) {
                setState(() {
                  for (var i = 0; i < _selectedCategories.length; i++) {
                    _selectedCategories[i] = i == index;
                  }
                });
              },
              fillColor: Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              selectedBorderColor: Colors.transparent,
              borderColor: Colors.transparent,
              selectedColor: Colors.teal,
              constraints: const BoxConstraints(
                minHeight: 40,
                minWidth: 80,
              ),
              isSelected: _selectedCategories,
              children: categories,
            ),
          ),
          FutureBuilder<List<Post>>(
            future: _fetchPosts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        onTap: () => Navigator.of(context).push(
                          // ignore: inference_failure_on_instance_creation
                          MaterialPageRoute(
                            builder: (context) =>
                                PostScreen(id: snapshot.data![index].id!),
                          ),
                        ),
                        title: Text(snapshot.data![index].title!),
                        subtitle: Text(snapshot.data![index].body!),
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('${snapshot.error}'));
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
