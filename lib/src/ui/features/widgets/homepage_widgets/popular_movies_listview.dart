// ignore_for_file: sort_child_properties_last

import 'package:auto_size_text/auto_size_text.dart';
import 'package:film_critic_app/src/providers/homepage_providers/popular_films_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../pages/film_detail_screen.dart';

class PopularMovies extends StatefulWidget {
  const PopularMovies({super.key});

  @override
  State<PopularMovies> createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PopularFilmsProvider>(
      builder: (context, value, widget) {
        return value.popularfilms != null
            ? Container(
                height: 29.h,
                width: 100.w,
                margin: EdgeInsets.only(top: 1.h),
                child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            //print(value.topfilms.results![index].id!);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FilmDetailScreen(
                                        movie_id:
                                            //value.topfilms.results![index].id!,
                                            value.popularfilms!.results![index]
                                                .id!)));
                          },
                          child: value.isPopularFilmsLoaded == true
                              ? Container(
                                  height: 20.h,
                                  width: 30.w,
                                  margin: EdgeInsets.only(right: 4.5.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(.8.h),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/${value.popularfilms!.results![index].posterPath}"
                                                  .toString()),
                                          fit: BoxFit.fitWidth)),
                                )
                              : Shimmer.fromColors(
                                  child: Container(
                                    height: 20.h,
                                    width: 30.w,
                                    margin: EdgeInsets.only(right: 2.w),
                                    color: Colors.purple,
                                  ),
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.white),
                        ),
                        value.isPopularFilmsLoaded
                            ? Container(
                                margin: EdgeInsets.only(top: 1.h, right: 3.w),
                                height: 8.h,
                                width: 22.w,
                                child: AutoSizeText(
                                  maxLines: 3,
                                  value.popularfilms!.results![index]
                                      .originalTitle
                                      .toString(),
                                  style: GoogleFonts.alikeAngular(
                                      color: Colors.white,
                                      fontSize: 2.h,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            : Shimmer.fromColors(
                                child: Container(
                                  margin: EdgeInsets.only(top: 1.h,right: 2.w),
                            height: 2.h,
                            width: 28.w,
                                  color: Colors.purple,
                                ),
                                baseColor: Colors.grey,
                                highlightColor: Colors.white)
                      ],
                    );
                  },
                ),
              )
            : Shimmer.fromColors(
                child: Container(
                  margin: EdgeInsets.only(top: 1.h),
                  height: 29.h,
                  width: 100.w,
                  color: Colors.purple,
                ),
                baseColor: Colors.grey,
                highlightColor: Colors.white);
      },
    );
  }
}
