// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchandProfileUpbar extends StatefulWidget {
  const SearchandProfileUpbar({super.key});

  @override
  State<SearchandProfileUpbar> createState() => _SearchandProfileUpbarState();
}

class _SearchandProfileUpbarState extends State<SearchandProfileUpbar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      width: 100.w,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 6.5.h,
                  width: 60.w,
                  child: Text(
                    "What would you like to watch today?",
                    style: GoogleFonts.abhayaLibre(
                        fontSize: 3.h,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                CircleAvatar(
                  radius: 3.5.h,
                  foregroundImage: AssetImage(
                    "assets/circle-profile-picture.png",
                  ),
                  backgroundColor: Colors.white,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.5.h),
            child: TextFormField(
                onTap: () {},
                cursorHeight: 2.w,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 10),
                    hintText: "Search",
                    hintStyle: GoogleFonts.abhayaLibre(
                        color: Color(0xffFFFFFF), fontSize: 2.5.h),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: Icon(
                        Icons.search,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    fillColor: Color(0xff36076B),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.w)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.w)))),
          )
        ],
      ),
    );
  }
}
