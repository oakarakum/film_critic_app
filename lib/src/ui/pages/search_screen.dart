import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              textCapitalization: TextCapitalization.words,
              style: GoogleFonts.abhayaLibre(fontSize: 5.w,fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),
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
          ],
        ),
      ) ,
    );
  }
}