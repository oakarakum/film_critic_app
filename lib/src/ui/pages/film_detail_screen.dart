// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
        body: Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xff303243),
            Color(0xff15151D),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            child: Consumer<DetailPickedFilmsProvider>(
                builder: (context, value, child) {
              return Column(children: [
                Container(
                  height: 50.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://www.themoviedb.org/t/p/w600_and_h900_bestv2${value.pickedfilms2.backdropPath}"),
                          fit: BoxFit.cover)),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 43.h, left: 5.w),
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
                  padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 1.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 6.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: 9.w,
                              lineWidth: 1.w,
                              arcBackgroundColor: Color(0xff303243),
                              arcType: ArcType.FULL,
                              progressColor: Color(0xffFF1F8A),
                              percent:
                                  (value.pickedfilms2.voteAverage * 10) / 100,
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
                              width: 5.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "${value.pickedfilms2.title} ",
                                      style: GoogleFonts.eagleLake(
                                          fontSize: 2.h,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffFFFFFF)),
                                    ),
                                    Text(
                                        "(${value.pickedfilms2.releaseDate}"
                                            .substring(0, 5),
                                        style: GoogleFonts.eagleLake(
                                            fontSize: 2.h,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffFFFFFF))),
                                    Text(")",
                                        style: GoogleFonts.eagleLake(
                                            fontSize: 2.h,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffFFFFFF)))
                                  ],
                                ),
                                //adadadad
                                value.pickedfilms2.originalLanguage != "en"
                                    ? Row(
                                        // Ülkesinde farklı isimle yayınlanmışsa
                                        children: [
                                          Text(
                                              "Original Film Name: ${value.pickedfilms2.originalTitle} ",
                                              style: GoogleFonts.eagleLake(
                                                  fontSize: 1.6.h,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xffFFFFFF))),
                                        ],
                                      )
                                    : SizedBox(height: 1.h),

                                Row(
                                  children: [
                                    Text(
                                      value.pickedfilms2.releaseDate.toString(),
                                      style: GoogleFonts.eagleLake(
                                          fontSize: 2.h,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffBBBBBB)),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      "(${value.pickedfilms2.productionCompanies![0].originCountry})",
                                      style: GoogleFonts.eagleLake(
                                          fontSize: 2.h,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffBBBBBB)),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: Divider(
                          color: Color(0xff000000),
                          thickness: .1.h,
                        ),
                      ),
                      Text(value.pickedfilms2.overview.toString(),
                          style: GoogleFonts.eagleLake(
                              fontSize: 1.5.h,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffBBBBBB))),
                      Padding(
                        //Trailer button
                        padding: EdgeInsets.only(top: 1.5.h),
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
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 2.w),
                                child: SvgPicture.asset("assets/play_icon.svg"),
                              ),
                              Text(
                                "Watch the Trailer",
                                style: GoogleFonts.abhayaLibre(
                                    color: Colors.white,
                                    fontSize: 3.h,
                                    letterSpacing: 4,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                      Consumer<FilmCreditsProvider>(
                          builder: (context, artistProvider, child) {
                        return SizedBox(
                          height: 13.h,
                          width: 100.w,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: artistProvider.castList.cast![0].name
                                .toString()
                                .length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    //Oyuncuların foto gelecek buraya
                                    height: 10.h,
                                    width: 16.w,
                                    margin: EdgeInsets.only(right: 5.w),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 0.6.w,
                                            color: Color(0xff303243)),
                                        color: Color(0xff303243),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/${artistProvider.castList.cast![index].profilePath}",
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 5.w),
                                    child: Text(
                                        artistProvider
                                            .castList.cast![index].name
                                            .toString(),
                                        style: GoogleFonts.eagleLake(
                                            fontSize: 1.5.h,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffBBBBBB))),
                                  )
                                ],
                              );
                            },
                          ),
                        );
                      }),
                      Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Categories",
                                  style: GoogleFonts.abhayaLibre(
                                      color: Colors.white,
                                      fontSize: 3.h,
                                      letterSpacing: 4,
                                      fontWeight: FontWeight.w500)),
                            ],
                          )),
                      SizedBox(
                        //adad
                        height: 4.5.h,
                        width: 100.w,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 2.h,
                              width: 20.w,
                              margin: EdgeInsets.only(right: 5.w),
                              decoration: BoxDecoration(
                                  color: Color(0xff303243),
                                  borderRadius: BorderRadius.circular(5.w)),
                              child: Padding(
                                padding: EdgeInsets.only(left: 4.w,top: 1.3.h),
                                child: Text("Thriler",
                                    style: GoogleFonts.eagleLake(
                                        fontSize: 1.5.h,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffFFFFFF))),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),

                /* Consumer<DetailPickedFilmsProvider>(
                    builder: (context, value, child) {
                      return Text(
                        value.movie_id.toString(),
                        style: TextStyle(color: Colors.white),
                      );
                    },
                  ), */
                /*    Consumer<DetailPickedFilmsProvider>(
                    builder: (context, value, child) {
                      return Text(
                        value.pickedfilms2.title.toString(),
                        style: TextStyle(color: Colors.white),
                      );
                    },
                  ) */

                /* Image.network(
                          "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/${value.pickedfilms2.backdropPath!}") */
              ]);
            }),
          ),
        ));
  }
}
