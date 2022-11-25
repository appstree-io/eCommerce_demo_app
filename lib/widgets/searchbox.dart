import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 100,
      child: CupertinoTextField(
        keyboardType: TextInputType.text,
        placeholder: 'Search',
        placeholderStyle: GoogleFonts.poppins(
          color: const Color(0xffAFAFAF),
          fontSize: 16.0,
        ),
        suffix: IconButton(
          onPressed: () {},
          icon: Icon(Icons.mic_none_rounded),
          color: Colors.white,
        ),
        prefix: const Padding(
          padding: EdgeInsets.fromLTRB(15.0, 6.0, 9.0, 6.0),
          child: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: const Color(0xff232327),
        ),
      ),
    );
  }
}
