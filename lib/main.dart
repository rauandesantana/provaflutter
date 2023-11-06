import 'package:flutter/material.dart';

void main() {
  runApp(const ProvaFlutter());
}

class ProvaFlutter extends StatelessWidget {
  const ProvaFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  Container(),
    );
  }
}