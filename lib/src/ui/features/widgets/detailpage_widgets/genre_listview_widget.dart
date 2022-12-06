import 'package:film_critic_app/src/providers/detail_page_providers/detail_picked_films_provider.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GenreListView extends StatelessWidget {
  const GenreListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailPickedFilmsProvider>(
      builder: (context, value, child) {
        return Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: SizedBox(
              //adad
              height: 5.h,
              width: 100.w,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: value.pickedfilms2.genres?.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    height: 3.h,
                    width: 40.w,
                    margin: EdgeInsets.only(right: 5.w),
                    decoration: BoxDecoration(
                        color: Color(0xff303243),
                        borderRadius: BorderRadius.circular(5.w)),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: .3.h),
                        child: FittedBox(
                          child: Text(
                              value.isPickedFilmLoaded
                                  ? value.pickedfilms2.genres![index].name
                                      .toString()
                                  : "Loading...",
                              maxLines: 1,
                              style: GoogleFonts.eagleLake(
                                  fontSize: 2.h,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffFFFFFF))),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ));
      },
    );
  }
}
