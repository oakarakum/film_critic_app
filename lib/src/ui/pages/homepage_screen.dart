// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:film_critic_app/src/ui/features/widgets/homepage_widgets/search_and_profile_upbar.dart';
import 'package:flutter/material.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
            child: Column(
          children: [SearchandProfileUpbar()],
        )),
      ),
    );
  }
}
