import 'package:flutter/material.dart';
import 'package:test_app/core/services/user_service.dart';
import 'package:test_app/data/repositories/user_repository.dart';
import 'package:test_app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:test_app/presentation/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserRepository(userService: UserService()),
        ),
        BlocProvider(
          create: (context) => UserBloc(context.read<UserRepository>()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomePage(),
      ),
    );
  }
}
