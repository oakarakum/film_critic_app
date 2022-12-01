// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:film_critic_app/src/ui/features/widgets/Onboard_widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [
            Container(
              height: 100,
              width: 75,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  image: DecorationImage(
                      image: AssetImage("assets/on_board_images.png"))),
              child: Column(
                children: [
                  Text("THE MOVIE DE"),
                  Text("All about movies, series, anime and much more."),
                  Text(
                      "Stay on top of information about movies, series, anime and more."),
                  LoginButton()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
