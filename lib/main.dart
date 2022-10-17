import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/bloc/auth_bloc.dart';
import 'package:flutter_firebase_login/bloc/auth_bloc_observer.dart';
import 'package:flutter_firebase_login/firebase_options.dart';
import 'package:flutter_firebase_login/pages/home_page.dart';
import 'package:flutter_firebase_login/pages/login_page.dart';
import 'package:flutter_firebase_login/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AuthBlocObserver();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  runApp(MyApp(authenticationRepository: authenticationRepository));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

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
        return [HomePage.page()];
      case AuthStatus.unauthenticated:
        return [LoginPage.page()];
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
