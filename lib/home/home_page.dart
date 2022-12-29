import 'package:dio_test/home/home_controller.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required HomeController controller})
      : _controller = controller,
        super(key: key);

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: FutureBuilder<List<User>>(
        future: _controller.findAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<User> users = snapshot.data ?? [];

            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Text(users[index].name),
                    ],
                  ),
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
