import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/bloc/auth_bloc.dart';
import 'package:flutter_firebase_login/models/post.dart';
import 'package:flutter_firebase_login/pages/upload.dart';
import 'package:flutter_firebase_login/widgets/avatar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static Page<void> page() => const MaterialPage<void>(child: Home());

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final user = context.select((AuthBloc bloc) => bloc.state.user);
  final List<Widget> fruits = <Widget>[
    const Text('Popular'),
    const Text('Latest'),
    const Text('Oldest'),
  ];
  final List<bool> _selectedFruits = <bool>[true, false, false];

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
                        return const Upload();
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
                  for (var i = 0; i < _selectedFruits.length; i++) {
                    _selectedFruits[i] = i == index;
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
              isSelected: _selectedFruits,
              children: fruits,
            ),
          ),
          Expanded(
            child: GridView.custom(
              padding: const EdgeInsets.all(5),
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: [
                  const QuiltedGridTile(2, 2),
                  const QuiltedGridTile(1, 1),
                  const QuiltedGridTile(1, 1),
                  const QuiltedGridTile(1, 2),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                childCount: gallery.length,
                (context, index) => Stack(
                  fit: StackFit.expand,
                  children: [
                    Card(
                      margin: EdgeInsets.zero,
                      child: Image.network(
                        gallery[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (gallery[index].isPremium)
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Image.asset(
                          kIsWeb ? 'crown.png' : 'assets/crown.png',
                          height: 20,
                        ),
                      ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black45,
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      bottom: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            gallery[index].title!,
                            style:
                                Theme.of(context).primaryTextTheme.bodyMedium,
                          ),
                          Text(
                            'Description',
                            style: Theme.of(context).primaryTextTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
