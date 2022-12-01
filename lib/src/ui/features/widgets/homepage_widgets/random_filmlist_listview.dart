import 'package:animate_do/animate_do.dart';
import 'package:film_critic_app/src/services/homepage_services.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RandomFilmListListview extends StatefulWidget {
  const RandomFilmListListview({super.key});

  @override
  State<RandomFilmListListview> createState() => _RandomFilmListListviewState();
}

class _RandomFilmListListviewState extends State<RandomFilmListListview> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26.h,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: ((context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeInRightBig(
                  delay: Duration(seconds: 1),
                  child: GestureDetector(
                    onTap: () {
                      /* print(value.favArtAlbumlist.items![index].id
                          ); */
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AlbumTracksScreen(
                                    id: value.favArtAlbumlist.items![index].id
                                        .toString(),
                                  ))
                                  ); */
                    },
                  ),
                ),
                SizedBox(height: 1.h),
                FadeInUp(
                  delay: Duration(seconds: 1),
                  child: Padding(
                    padding: EdgeInsets.only(right: 4.w),
                    child: Text(
                      "",
                      //value.favArtAlbumlist.items![index].name.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 2.h,
                          color: Color(0xff3A3A3A)),
                    ),
                  ),
                )
              ],
            );
          })),
    );
  }
}
