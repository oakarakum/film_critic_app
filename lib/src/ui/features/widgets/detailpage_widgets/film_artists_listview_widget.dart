// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../providers/detail_page_providers/film_credits_provider.dart';

class FilmArtistsListviewWidget extends StatefulWidget {
  const FilmArtistsListviewWidget({super.key});

  @override
  State<FilmArtistsListviewWidget> createState() =>
      _FilmArtistsListviewWidgetState();
}

class _FilmArtistsListviewWidgetState extends State<FilmArtistsListviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FilmCreditsProvider>(
        builder: (context, artistProvider, child) {
      return SizedBox(
        height: 12.h,
        width: 100.w,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount:
              artistProvider.castList.cast![0].character.toString().length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return artistProvider.isCastListLoaded
                ? Column(
                    children: [
                      Container(
                        //Oyuncuların foto gelecek buraya
                        height: 9.h,
                        width: 16.w,
                        margin: EdgeInsets.only(right: 5.w),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 0.6.w, color: Color(0xff303243)),
                            color: Color(0xff303243),
                            image: DecorationImage(
                                image: NetworkImage(artistProvider.castList
                                            .cast![index].profilePath !=
                                        null
                                    ? "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/${artistProvider.castList.cast![index].profilePath}"
                                    : "https://static8.depositphotos.com/1009634/988/v/600/depositphotos_9883921-stock-illustration-no-user-profile-picture.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5.w),
                        child: Text(
                            artistProvider.castList.cast![index].name
                                .toString(),
                            style: GoogleFonts.eagleLake(
                                fontSize: 1.5.h,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffBBBBBB))),
                      )
                    ],
                  )
                : Shimmer.fromColors(
                    child: Container(
                      height: 8.h,
                      width: 16.w,
                      margin: EdgeInsets.only(right: 5.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    baseColor: Colors.grey.shade600,
                    highlightColor: Colors.white60);
          },
        ),
      );
    });
  }
}
