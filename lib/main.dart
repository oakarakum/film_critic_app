// ignore_for_file: prefer_const_constructors

import 'package:film_critic_app/src/ui/pages/on_board_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(MyApp()
      /* MultiProvider(providers: [
    //ChangeNotifierProvider(create: (context) => SearchListProvider())
  ] */
      );
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
            home: OnBoardScreen());
      },
    );
  }
}
