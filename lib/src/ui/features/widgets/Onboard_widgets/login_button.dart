// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:film_critic_app/src/ui/pages/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomepageScreen()));
      },
      child: Container(
        height: 6.5.h,
        width: 100.w,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            const Color(0xff8000FF),
            const Color(0xff540BA1),
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            "Access",
            style: GoogleFonts.abhayaLibre(
                color: Colors.white,
                fontSize: 3.h,
                letterSpacing: 4,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
