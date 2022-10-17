import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/bloc/auth_bloc.dart';
import 'package:flutter_firebase_login/widgets/avatar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static Page<void> page() => const MaterialPage<void>(child: Home());

  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthBloc bloc) => bloc.state.user);
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
                  child:
                      TextButton(onPressed: () {}, child: const Text('Submit')),
                ),
                Avatar(photo: user.photo, size: 25),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            user.email ?? '',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 4),
          Text(
            user.username ?? '',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => context.read<AuthBloc>().add(LogoutRequested()),
          ),
        ],
      ),
    );
  }
}
