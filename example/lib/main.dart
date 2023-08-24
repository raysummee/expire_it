import 'package:expire_it/expire_it.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: ExpireBuilder(
          controller: UserDefineExpireController(
            expiryDate: DateTime.now().subtract(const Duration(hours: 1)),
          ),
          expireBuilder: (context) {
            return const Center(
              child: Text("Expired"),
            );
          },
          builder: (context) {
            return const Center(
              child: Text("Home screen"),
            );
          },
          loadingBuilder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
