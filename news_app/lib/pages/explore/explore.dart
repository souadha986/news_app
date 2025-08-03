import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // use Center to see it easily
        child: Text(
          "explore".tr(),
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}
