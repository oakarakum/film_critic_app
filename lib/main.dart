// ignore_for_file: prefer_const_constructors

import 'package:film_critic_app/src/providers/popular_films_provider.dart';
import 'package:film_critic_app/src/providers/top_rated_films_provider.dart';
import 'package:film_critic_app/src/ui/pages/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => TopRatedFilmsProvider()),
    ChangeNotifierProvider(create: (context) => PopularFilmsProvider())
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
