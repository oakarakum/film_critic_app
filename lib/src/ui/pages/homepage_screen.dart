// ignore_for_file: prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_const_constructors

import 'package:film_critic_app/src/models/top_rated_films_model.dart';
import 'package:film_critic_app/src/providers/top_rated_films_provider.dart';
import 'package:film_critic_app/src/services/homepage_services.dart';
import 'package:film_critic_app/src/ui/features/widgets/homepage_widgets/random_filmlist_listview.dart';
import 'package:flutter/material.dart';
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
    data = Provider.of<TopRatedFilmsProvider>(context, listen: false);
    data!.getTopRatedFilms();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            RandomFilmListListview()
          ],
        )),
      ),
    );
  }
}
