// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/detail_page_providers/detail_picked_films_provider.dart';

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
    data3.getDetailedPickedFilms();

    // print(widget.movie_id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Color(0xff000000),
      ),
      backgroundColor: Color(0xff000000),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 100,
              ),
              Consumer<DetailPickedFilmsProvider>(
                builder: (context, value, child) {
                  return Text(
                    value.movie_id.toString(),
                    style: TextStyle(color: Colors.white),
                  );
                },
              ),
              Consumer<DetailPickedFilmsProvider>(
                builder: (context, value, child) {
                  return Text(
                    value.pickedfilms2.originalTitle!,
                    style: TextStyle(color: Colors.white),
                  );
                },
              )

              /* Image.network(
                      "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/${value.pickedfilms2.backdropPath!}") */
            ],
          )
        ],
      )),
    );
  }
}
