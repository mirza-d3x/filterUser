import 'package:creativelabs/Repository/Api/UserApi/user_api.dart';
import 'package:creativelabs/Repository/Bloc/User/user_bloc.dart';
import 'package:creativelabs/View/HomeScreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  UserApi userApi = UserApi();

  runApp(
    BlocProvider<UserBloc>(
      create: (context) => UserBloc(userApi),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Creative Labs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreenHome(),
    );
  }
}
