// ignore_for_file: prefer_const_constructors

import 'package:film_critic_app/src/providers/homepage_providers/popular_films_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class MoreTopRatedFilms extends StatefulWidget {
  const MoreTopRatedFilms({super.key});

  @override
  State<MoreTopRatedFilms> createState() => _MoreTopRatedFilmsState();
}

class _MoreTopRatedFilmsState extends State<MoreTopRatedFilms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 6.5.h,
        elevation: 0,
        title: Text(
          "Top Rated Films",
          style:
              GoogleFonts.aclonica(fontSize: 2.h, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              child: SizedBox(
                height: 90.h,
                width: 100.w,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2.h,
                      mainAxisSpacing: 5.w),
                  itemBuilder: (context, index) {
                    return Consumer<PopularFilmsProvider>(
                      builder: (context, value, child) {
                        return value.popularfilms!.results![index]
                                    .originalTitle ==
                                null
                            ? Container(
                                height: 10.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    image: DecorationImage(
                                        image: NetworkImage(""))),
                              )
                            : Shimmer.fromColors(
                                child: Container(
                                    height: 10.h,
                                    width: 20.w,
                                    decoration:
                                        BoxDecoration(color: Colors.white)),
                                baseColor: Colors.grey,
                                highlightColor: Colors.white);
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
