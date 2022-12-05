// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:film_critic_app/src/providers/search_page_providers/search_provider.dart';
import 'package:film_critic_app/src/services/searchpage_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        appBar: AppBar(),
        body: Consumer<SearchProvider>(
          builder: (context, value, child) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      onChanged: (values1) {
                        value.getQuery(values1);
                      },
                      textCapitalization: TextCapitalization.words,
                      style: GoogleFonts.abhayaLibre(
                          fontSize: 5.w,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffFFFFFF)),
                      cursorHeight: 2.w,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 10),
                          hintText: "Search",
                          hintStyle: GoogleFonts.abhayaLibre(
                              color: Color(0xffFFFFFF), fontSize: 2.5.h),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: 5.w),
                            child: Icon(
                              Icons.search,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                          fillColor: Color(0xff36076B),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.w)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.w))),
                    ),
                    SizedBox(height: 2.h),
                    Text("Films:",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 5.h,
                            fontWeight: FontWeight.w800)),
                    Divider(
                      color: Colors.white,
                      thickness: 0.5,
                    ),
                    SizedBox(
                      height: 50.h,
                      width: 100.w,
                      child: ListView.builder(
                        itemCount: value.searchlist?.results!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: 5.h,
                                  width: 5.w,
                                  child: value.searchlist!.results![index]
                                              .backdropPath !=
                                          null
                                      ? Image.network(
                                          "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/${value.searchlist!.results![index].backdropPath}"
                                              .toString())
                                      : Text("Null foto")),
                              SizedBox(
                                width: 3.w,
                              ),
                              Column(
                                children: [
                                  Text(value.searchlist!.results![index].title
                                      .toString()),
                                  SizedBox(height: 1.h),
                                  Text(
                                      "Overview:\n${value.searchlist?.results![index].overview}")
                                ],
                              )
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
                /* : Shimmer.fromColors(
                    child: Center(
                      child: Container(
                        color: Colors.transparent,
                        child: Text(
                          "Loading...",
                          style: GoogleFonts.aclonica(
                              color: Colors.red,
                              fontSize: 5.h,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    baseColor: Colors.yellow,
                    highlightColor: Colors.green) */
                ;
          },
        ));
  }
}
