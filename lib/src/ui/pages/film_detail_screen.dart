// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:auto_size_text/auto_size_text.dart';
import 'package:film_critic_app/src/ui/features/widgets/detailpage_widgets/film_artists_listview_widget.dart';
import 'package:film_critic_app/src/ui/features/widgets/detailpage_widgets/genre_listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../providers/detail_page_providers/detail_picked_films_provider.dart';
import '../../providers/detail_page_providers/film_credits_provider.dart';

class FilmDetailScreen extends StatefulWidget {
  FilmDetailScreen({super.key, required this.movie_id});
  final int movie_id;

  @override
  State<FilmDetailScreen> createState() => _FilmDetailScreenState();
}

class _FilmDetailScreenState extends State<FilmDetailScreen> {
  @override
  void initState() {
    //Film sayfasını değiştiren
    DetailPickedFilmsProvider? data3;
    data3 = Provider.of<DetailPickedFilmsProvider>(context, listen: false);
    //data3.getDetailedPickedFilms();
    data3.getChange(widget.movie_id);
    // print(widget.movie_id);
    //Film'deki oynayanlar listesi
    FilmCreditsProvider? data4;
    data4 = Provider.of<FilmCreditsProvider>(context, listen: false);
    data4.getChange(widget.movie_id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Color(0xff303243),
        ),
        body: Consumer<DetailPickedFilmsProvider>(
          builder: (context, value, child) {
            return //value.isPickedFilmLoaded == true
                Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          Color(0xff303243),
                          Color(0xff15151D),
                        ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: value.isPickedFilmLoaded
                        ? SingleChildScrollView(
                            child: Column(children: [
                            Container(
                              height: 50.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(value.isPickedFilmLoaded
                                          ?"https://www.themoviedb.org/t/p/w600_and_h900_bestv2${value.pickedfilms2.backdropPath}"
                                          : "https://msimga.com/Content/images/grey-loader.gif"
                                          ),
                                      fit: BoxFit.fill)),
                              child: Padding(
                                padding:
                                    EdgeInsets.only(bottom: 43.h, left: 5.w),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: SvgPicture.asset(
                                        "assets/arrow_left.svg",
                                        color: Color(0xffFFFFFF),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(left: 2.w),
                                        child: Text(
                                          "Return",
                                          style: GoogleFonts.eagleLake(
                                              fontSize: 2.h,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xffFFFFFF)),
                                        )),
                                    SizedBox(width: 56.2.w),
                                    CircleAvatar(
                                      radius: 2.2.h,
                                      backgroundColor: Color(0xff303243),
                                      child: Center(
                                        child: Icon(Icons.favorite_border,
                                            color: Color(0xffFFFFFF)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              //Resmin altının column'ı
                              padding: EdgeInsets.only(
                                  left: 5.w, right: 5.w, top: 1.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircularPercentIndicator(
                                        radius: 9.w,
                                        lineWidth: 1.w,
                                        arcBackgroundColor: Color(0xff303243),
                                        arcType: ArcType.FULL,
                                        progressColor: Color(0xffFF1F8A),
                                        percent:
                                            (value.pickedfilms2.voteAverage *
                                                    10) /
                                                100,
                                        center: Center(
                                            child: Text(
                                          "${value.pickedfilms2.voteAverage.toStringAsFixed(1)}/10",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 2.h,
                                              fontWeight: FontWeight.w600),
                                        )),
                                      ),
                                      SizedBox(
                                        width: 2.75.w,
                                      ),
                                      FittedBox(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 69.w,
                                              child: AutoSizeText(
                                                "${value.pickedfilms2.title} ",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.eagleLake(
                                                    fontSize: 2.h,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xffFFFFFF)),
                                              ),
                                            ),

                                            //adadadad
                                            value.pickedfilms2
                                                        .originalLanguage !=
                                                    "en"
                                                ? Row(
                                                    // Ülkesinde farklı isimle yayınlanmışsa
                                                    children: [
                                                      SizedBox(
                                                        width: 60.w,
                                                        child: Text(
                                                            "Original Film Name: ${value.pickedfilms2.originalTitle} ",
                                                            style: GoogleFonts.eagleLake(
                                                                fontSize: 1.6.h,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Color(
                                                                    0xffFFFFFF))),
                                                      ),
                                                    ],
                                                  )
                                                : SizedBox(height: 1.h),

                                            Row(
                                              children: [
                                                Text(
                                                  value.pickedfilms2.releaseDate
                                                      .toString(),
                                                  style: GoogleFonts.eagleLake(
                                                      fontSize: 2.h,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xffBBBBBB)),
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Text(
                                                  value
                                                              .pickedfilms2
                                                              .productionCompanies![
                                                                  0]
                                                              .originCountry ==
                                                          ""
                                                      ? ""
                                                      : "(${value.pickedfilms2.productionCompanies![0].originCountry})",
                                                  style: GoogleFonts.eagleLake(
                                                      fontSize: 2.h,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xffBBBBBB)),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 1.h),
                                    child: Divider(
                                      color: Color(0xff000000),
                                      thickness: .1.h,
                                    ),
                                  ),
                                  value.isPickedFilmLoaded
                                  ? Text(value.pickedfilms2.overview.toString(),
                                      style: GoogleFonts.eagleLake(
                                          fontSize: 1.5.h,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffBBBBBB))): Shimmer.fromColors(
                                            child:Center(
                                              child: Text("Loading...",
                                      style: GoogleFonts.eagleLake(
                                          fontSize: 1.5.h,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffBBBBBB))),
                                            ) ,
                                           baseColor: Colors.grey,
                                            highlightColor: Colors.white,)
                                          ,
                                  Padding(
                                    //Trailer button
                                    padding: EdgeInsets.only(top: 1.5.h),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 6.5.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              colors: [
                                                const Color(0xff8000FF),
                                                const Color(0xff540BA1),
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.topRight),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 4.w),
                                              child: SvgPicture.asset(
                                                  "assets/play_icon.svg"),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 3.5.w),
                                              child: Text(
                                                "Watch the Trailer",
                                                style: GoogleFonts.abhayaLibre(
                                                    color: Colors.white,
                                                    fontSize: 3.h,
                                                    letterSpacing: 4,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 2.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("Main Cast",
                                            style: GoogleFonts.abhayaLibre(
                                                color: Colors.white,
                                                fontSize: 3.h,
                                                letterSpacing: 4,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                  FilmArtistsListviewWidget(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Genres",
                                          style: GoogleFonts.abhayaLibre(
                                              color: Colors.white,
                                              fontSize: 3.h,
                                              letterSpacing: 4,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                  GenreListView(),
                                ],
                              ),
                            ),
                          ]))
                        : Shimmer.fromColors(
                            child: Center(
                              child: Text(
                                "Loading...",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9.h,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            baseColor: Colors.grey.shade400,
                            highlightColor: Colors.white));
          },
        ));
  }
}
