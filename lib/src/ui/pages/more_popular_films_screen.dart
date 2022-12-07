// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../providers/homepage_providers/popular_films_provider.dart';

class MorePopularFilms extends StatefulWidget {
  const MorePopularFilms({super.key});

  @override
  State<MorePopularFilms> createState() => _MorePopularFilmsState();
}

class _MorePopularFilmsState extends State<MorePopularFilms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 6.5.h,
        elevation: 0,
        title: Text(
          "Popular Films",
          style:
              GoogleFonts.aclonica(fontSize: 2.h, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
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
                    return Consumer<PopularFilmsProvider>(
                      builder: (context, value, child) {
                        return value.popularfilms!.results![index]
                                    .originalTitle !=
                                null
                            ? Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(value
                                                .isPopularFilmsLoaded
                                            ? "https://www.themoviedb.org/t/p/w600_and_h900_bestv2${value.popularfilms!.results![index].posterPath}"
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
