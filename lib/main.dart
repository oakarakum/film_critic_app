// ignore_for_file: prefer_const_constructors

import 'package:film_critic_app/src/providers/detail_page_providers/detail_picked_films_provider.dart';
import 'package:film_critic_app/src/providers/detail_page_providers/film_credits_provider.dart';
import 'package:film_critic_app/src/providers/homepage_providers/popular_films_provider.dart';
import 'package:film_critic_app/src/providers/homepage_providers/top_rated_films_provider.dart';
import 'package:film_critic_app/src/providers/search_page_providers/search_provider.dart';
import 'package:film_critic_app/src/ui/pages/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => SearchProvider()),
    ChangeNotifierProvider(create: (context) => FilmCreditsProvider()),
    ChangeNotifierProvider(create: (context) => TopRatedFilmsProvider()),
    ChangeNotifierProvider(create: (context) => PopularFilmsProvider()),
    ChangeNotifierProvider(create: (context) => DetailPickedFilmsProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                  centerTitle: true, backgroundColor: Color(0xff303243)),
              scaffoldBackgroundColor: Color(0xff303243),
              primarySwatch: Colors.blue,
            ),
            home: HomepageScreen());
      },
    );
  }
}
