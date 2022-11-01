import 'package:flutter/material.dart';
import 'package:stock_and_buy_interview/ui/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.deepPurple),
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomeView(),
    );
  }
}
