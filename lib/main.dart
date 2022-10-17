import 'package:firebase_core/firebase_core.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/bloc/auth_bloc.dart';
import 'package:flutter_firebase_login/bloc/bloc_observer.dart';
import 'package:flutter_firebase_login/firebase_options.dart';
import 'package:flutter_firebase_login/pages/home.dart';
import 'package:flutter_firebase_login/pages/login.dart';
import 'package:flutter_firebase_login/repositories/auth_repository.dart';
import 'package:flutter_firebase_login/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = GlobalBlocObserver();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final authenticationRepository = AuthRepository();
  await authenticationRepository.user.first;

  runApp(MyApp(authenticationRepository: authenticationRepository));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required AuthRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthBloc(
          authenticationRepository: _authenticationRepository,
        ),
        child: const Landing(),
      ),
    );
  }
}

class Landing extends StatelessWidget {
  const Landing({super.key});

  List<Page<dynamic>> onGenerateAppViewPages(
    AuthStatus state,
    List<Page<dynamic>> pages,
  ) {
    switch (state) {
      case AuthStatus.authenticated:
        return [Home.page()];
      case AuthStatus.unauthenticated:
        return [Login.page()];
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: FlowBuilder<AuthStatus>(
        state: context.select((AuthBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
