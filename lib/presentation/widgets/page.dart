import 'package:flutter/material.dart';
import 'package:foodiez_flutter/presentation/widgets/navbar.dart';

class FoodiezPage extends StatelessWidget {
  final List<Widget> children;
  const FoodiezPage({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align content to the start
            children: <Widget>[
              const NavBar(),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}
