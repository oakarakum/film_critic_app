// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:film_critic_app/src/providers/search_page_providers/search_provider.dart';
import 'package:film_critic_app/src/services/searchpage_service.dart';
import 'package:film_critic_app/src/ui/features/widgets/searchpage_widgets/search_bar_widget.dart';
import 'package:film_critic_app/src/ui/pages/film_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    // Textformfield search list data
    getSearchListService("a");
    SearchProvider data;
    data = Provider.of<SearchProvider>(context, listen: false);
    data.getSearchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Consumer<SearchProvider>(
          builder: (context, value, child) {
            return  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SearchbarWidget(),
                          SizedBox(height: 2.h),
                          Text("Films:",
                              style: GoogleFonts.abhayaLibre(
                                  color: Colors.white,
                                  fontSize: 5.h,
                                  fontWeight: FontWeight.w800)),
                          Divider(
                            color: Colors.white,
                            thickness: 0.5,
                          ),
                          SizedBox(
                            height: 80.h,
                            width: 100.w,
                            child: value.isSearchLoaded
                            ? ListView.builder(
                              itemCount:
                                  value.searchlist?.results![0].title?.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FilmDetailScreen(
                                                  movie_id: value.searchlist!
                                                      .results![index].id!,
                                                )));
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      value.isSearchLoaded
                                          ? Container(
                                              height: 11.h,
                                              width: 22.w,
                                              margin:
                                                  EdgeInsets.only(bottom: 3.h),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: value
                                                                .searchlist!
                                                                .results![index]
                                                                .backdropPath ==
                                                            null
                                                        ? NetworkImage(
                                                            "https://static8.depositphotos.com/1009634/988/v/600/depositphotos_9883921-stock-illustration-no-user-profile-picture.jpg",
                                                          )
                                                        : NetworkImage(
                                                            "https://www.themoviedb.org/t/p/w600_and_h900_bestv2${value.searchlist!.results![index].posterPath}")),
                                              ),
                                            )
                                          : Shimmer.fromColors(
                                              child: Container(
                                                height: 11.h,
                                                width: 22.w,
                                                margin: EdgeInsets.only(
                                                    bottom: 3.h),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              baseColor: Colors.grey.shade300,
                                              highlightColor: Colors.white60),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          value.isSearchLoaded
                                              ? SizedBox(
                                                  height: 2.4.h,
                                                  width: 54.w,
                                                  child: Text(
                                                    value.searchlist!
                                                        .results![index].title
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 2.3.h,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                )
                                              : info_text_shimmer(),
                                          SizedBox(height: 1.h),
                                          value.isSearchLoaded
                                              ? Text(
                                                  "Release Date:${value.searchlist!.results![index].releaseDate.toString()}",
                                                  style:
                                                      GoogleFonts.abhayaLibre(
                                                          color: Colors.white,
                                                          fontSize: 2.3.h,
                                                          fontWeight:
                                                              FontWeight.w600))
                                              : info_text_shimmer(),
                                          SizedBox(height: 1.4.h),
                                          value.isSearchLoaded
                                              ? Text(
                                                  "Rating: ${value.searchlist!.results![index].voteAverage.toString()} / 10",
                                                  style: GoogleFonts.aclonica(
                                                      color: Colors.white,
                                                      fontSize: 2.1.h,
                                                      fontWeight:
                                                          FontWeight.w400))
                                              : info_text_shimmer(),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 1,
                                      ),
                                      value.isSearchLoaded
                                          ? CircularPercentIndicator(
                                              radius: 5.w,
                                              lineWidth: .5.w,
                                              progressColor: Color(0xffFF1F8A),
                                              backgroundColor: Colors.black,
                                              percent: (value
                                                          .searchlist!
                                                          .results![index]
                                                          .voteAverage *
                                                      10) /
                                                  100,
                                              center: Center(
                                                  child: Text(
                                                "${value.searchlist!.results![index].voteAverage.toStringAsFixed(1)}/10",
                                                style: GoogleFonts.abhayaLibre(
                                                    color: Colors.white,
                                                    fontSize: 1.4.h,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              )),
                                            )
                                          : Shimmer.fromColors(
                                              child: Container(
                                                height: 4.h,
                                                width: 10.w,
                                                margin: EdgeInsets.only(
                                                    bottom: 3.h),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              baseColor: Colors.grey.shade300,
                                              highlightColor: Colors.white60
                                              )
                                    ],
                                  ),
                                );
                              },
                            ): Shimmer.fromColors(child: 
                            SizedBox(
                              height: 80.h,
                            width: 100.w,
                            child: Center(
                              child: Text("Loading...",style : TextStyle(color: Colors.white))),
                            ),
                            baseColor: Colors.grey.shade300,
                                              highlightColor: Colors.white60
                            )
                            ,
                          )
                        ],
                      ),
                    ),
                  );
                /* : Shimmer.fromColors(
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
                    highlightColor: Colors.white); */
          },
        ));
  }

  Shimmer info_text_shimmer() {
    return Shimmer.fromColors(
        child: Container(
          height: 2.4.h,
          width: 50.w,
          color: Colors.white,
        ),
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white60);
  }
}
