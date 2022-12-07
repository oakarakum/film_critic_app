// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:auto_size_text/auto_size_text.dart';
import 'package:film_critic_app/src/ui/pages/film_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../providers/homepage_providers/top_rated_films_provider.dart';

class RandomFilmListListview extends StatefulWidget {
  const RandomFilmListListview({super.key});

  @override
  State<RandomFilmListListview> createState() => _RandomFilmListListviewState();
}

class _RandomFilmListListviewState extends State<RandomFilmListListview> {
  TopRatedFilmsProvider? data;

  @override
  Widget build(BuildContext context) {
    return Consumer<TopRatedFilmsProvider>(
      builder: (context, value, widget) {
        return Container(
          height: 29.h,
          width: 100.w,
          margin: EdgeInsets.only(top: 1.h),
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FilmDetailScreen(
                                    movie_id:
                                        value.topfilms.results![index].id!,
                                  )));
                    },
                    child: value.isAlbumTracksLoaded
                        ? Container(
                            height: 20.h,
                            width: 30.w,
                            margin: EdgeInsets.only(right: 4.5.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(.8.h),
                                image: DecorationImage(
                                    image: NetworkImage(value.topfilms
                                                .results![index].posterPath !=
                                            null
                                        ? "https://image.tmdb.org/t/p/w600_and_h900_bestv2/${value.topfilms.results![index].posterPath!}"
                                        : "https://static8.depositphotos.com/1009634/988/v/600/depositphotos_9883921-stock-illustration-no-user-profile-picture.jpg"),
                                    fit: BoxFit.fitWidth)),
                          )
                        : Shimmer.fromColors(
                            child: Container(
                              height: 20.h,
                              width: 30.w,
                              margin: EdgeInsets.only(right: 4.5.w),
                              color: Colors.purple,
                            ),
                            baseColor: Colors.grey,
                            highlightColor: Colors.white),
                  ),
                  value.isAlbumTracksLoaded
                      ? Container(
                          margin: EdgeInsets.only(top: 1.h, right: 4.w),
                          height: 8.h,
                          width: 22.w,
                          child: AutoSizeText(
                            maxLines: 3,
                            value.topfilms.results![index].title.toString(),
                            style: GoogleFonts.abhayaLibre(
                                color: Colors.white,
                                fontSize: 2.h,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      : Shimmer.fromColors(
                          child: Container(
                            margin: EdgeInsets.only(top: 1.h, right: 5.w),
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
        );
      },
    );
  }
}
