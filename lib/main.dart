import 'package:dio/dio.dart';
import 'package:dio_test/home/home_controller.dart';
import 'package:dio_test/home/home_page.dart';
import 'package:dio_test/repository/user_repository_dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dio Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        controller: HomeController(
          userRepository: UserRepositoryDio(Dio()),
        ),
      ),
    );
  }
}
