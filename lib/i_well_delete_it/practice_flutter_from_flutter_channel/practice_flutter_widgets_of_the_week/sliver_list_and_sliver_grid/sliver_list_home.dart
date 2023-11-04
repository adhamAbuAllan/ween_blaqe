import 'package:flutter/material.dart';

class SliverListHome extends StatefulWidget {
  const SliverListHome({super.key});

  @override
  State<SliverListHome> createState() => _SliverListHomeState();
}

class _SliverListHomeState extends State<SliverListHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return null;
        }),
      ),
    );
  }
}
