import 'package:film_critic_app/src/providers/search_page_providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class SearchbarWidget extends StatefulWidget {
  const SearchbarWidget({super.key});

  @override
  State<SearchbarWidget> createState() => _SearchbarWidgetState();
}

class _SearchbarWidgetState extends State<SearchbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, value, child) {
        return  TextFormField(
                onChanged: (query) {
                  if (query.isEmpty) {
                    value.getQuery("Godfather");
                  } else {
                    value.getQuery(query);
                  }
                },
                textCapitalization: TextCapitalization.words,
                style: GoogleFonts.abhayaLibre(
                    fontSize: 5.w,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffFFFFFF)),
                cursorHeight: 2.w,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 10),
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
              );
            /* : Shimmer.fromColors(
                child: Container(
                  height: 6.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.w)),
                ),
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white60); */
      },
    );
  }
}
