// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:film_critic_app/src/providers/homepage_providers/top_rated_films_provider.dart';
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
                  itemCount: 20,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 43.h,
                      crossAxisCount: 2,
                      crossAxisSpacing: 2.h,
                      mainAxisSpacing: 4.w),
                  itemBuilder: (context, index) {
                    return Consumer<TopRatedFilmsProvider>(
                      builder: (context, value, child) {
                        return value.topfilms.results![index].originalTitle !=
                                null
                            ? Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(value
                                                .isAlbumTracksLoaded
                                            ? "https://www.themoviedb.org/t/p/w600_and_h900_bestv2${value.topfilms.results![index].posterPath}"
                                            : "https://static8.depositphotos.com/1009634/988/v/600/depositphotos_9883921-stock-illustration-no-user-profile-picture.jpg"))),
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
