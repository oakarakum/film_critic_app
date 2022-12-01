// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:film_critic_app/src/services/homepage_services.dart';
import 'package:flutter/material.dart';
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
  void initState() {
    data = Provider.of<TopRatedFilmsProvider>(context, listen: false);
    data!.getTopRatedFilms();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TopRatedFilmsProvider>(
      builder: (context, value, widget) {
        return SizedBox(
          height: 25.h,
          width: 100.w,
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(""
                            //value.topfilms.results[index].

                            ))),
                child: Text(value.topfilms.results![index].title.toString()),
              );
            },
          ),
        );
      },
    );
  }
}
