// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:film_critic_app/src/services/homepage_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../providers/top_rated_films_provider.dart';

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
        return SizedBox(
          height: 34.h,
          width: 100.w,
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 20.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w600_and_h900_bestv2/${value.topfilms.results![index].posterPath!}"
                                    .toString()))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 1.h),
                    height: 8.h,
                    width: 18.w,
                    child: AutoSizeText(
                      maxLines: 3,
                      value.topfilms.results![index].title.toString(),
                      style: GoogleFonts.abhayaLibre(
                          color: Colors.white,
                          fontSize: 1.8.h,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}
