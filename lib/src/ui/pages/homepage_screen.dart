// ignore_for_file: prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_const_constructors

import 'package:film_critic_app/src/providers/homepage_providers/popular_films_provider.dart';
import 'package:film_critic_app/src/providers/homepage_providers/top_rated_films_provider.dart';
import 'package:film_critic_app/src/ui/features/widgets/homepage_widgets/popular_movies_listview.dart';
import 'package:film_critic_app/src/ui/features/widgets/homepage_widgets/random_filmlist_listview.dart';
import 'package:film_critic_app/src/ui/features/widgets/homepage_widgets/search_and_profile_upbar.dart';
import 'package:film_critic_app/src/ui/pages/more_popular_films_screen.dart';
import 'package:film_critic_app/src/ui/pages/more_top_rated_films_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  TopRatedFilmsProvider? data;

  @override
  void initState() {
    //Random Listview's data
    data = Provider.of<TopRatedFilmsProvider>(context, listen: false);
    data!.getTopRatedFilms();
    //Popular films ListView's data
    PopularFilmsProvider data2 =
        Provider.of<PopularFilmsProvider>(context, listen: false);
    data2.getPopularFilms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff8000FF), Color(0xff000000)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: SearchandProfileUpbar(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Top Rated Films",
                              style: GoogleFonts.abhayaLibre(
                                  color: Colors.white,
                                  fontSize: 3.h,
                                  fontWeight: FontWeight.w500)),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MoreTopRatedFilms(),
                                  ));
                            },
                            child: Text(
                              "See More",
                              style: GoogleFonts.abhayaLibre(
                                  color: Colors.white,
                                  fontSize: 2.5.h,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: RandomFilmListListview(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Popular Films",
                              style: GoogleFonts.abhayaLibre(
                                  color: Colors.white,
                                  fontSize: 3.h,
                                  fontWeight: FontWeight.w500)),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MorePopularFilms(),
                                  ));
                            },
                            child: Text(
                              "See More",
                              style: GoogleFonts.abhayaLibre(
                                  color: Colors.white,
                                  fontSize: 2.5.h,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: PopularMovies(),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
