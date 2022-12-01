// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:film_critic_app/src/ui/features/widgets/Onboard_widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 97.h,
            width: 100.w,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/on_board_images.png"))),
            child: Column(
              children: [
                SizedBox(height: 60.h),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: .5.h),
                  child: Text(
                    "THE MOVIE DE",
                    style: GoogleFonts.abhayaLibre(
                        color: Colors.white,
                        fontSize: 6.h,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: .5.h),
                  child: Text("All about movies, series, anime and much more.",
                      style: GoogleFonts.abhayaLibre(
                          color: Colors.white,
                          fontSize: 3.h,
                          fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: 1.5.h),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: .5.h),
                  child: Text(
                      "Stay on top of information about movies, series, anime and more.",
                      style: GoogleFonts.abhayaLibre(
                          color: Colors.white,
                          fontSize: 3.h,
                          fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: 3.h),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: .5.h),
                  child: LoginButton(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
