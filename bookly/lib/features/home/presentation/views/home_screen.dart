import 'package:bookly/features/home/presentation/views/widgets/home_screen_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const SafeArea(child: HomeScreenBody()));
  }
}
