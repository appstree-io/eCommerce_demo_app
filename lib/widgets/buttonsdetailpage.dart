import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EndButtonsDetailPage extends StatelessWidget {
  final double priceitem;
  const EndButtonsDetailPage({
    Key? key,
    required this.priceitem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      SizedBox(
        height: 40,
        width: 156,
        child: TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 12,
              )),
              foregroundColor: MaterialStateProperty.all<Color>(
                Color(0XffFFFFFF),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                Color(0Xff340404),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            onPressed: () {},
            child: Text(
              "Add to cart".toUpperCase(),
              style: GoogleFonts.inter(
                fontSize: 14,
              ),
            )),
      ),
      const SizedBox(width: 16),
      SizedBox(
        height: 40,
        width: 156,
        child: ElevatedButton(
          style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all<Color>(Color(0xff340404)),
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xffFFEEC1)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          onPressed: () {},
          child: Row(
            children: [
              Text(
                "Buy".toUpperCase(),
                style: GoogleFonts.inter(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                width: 21,
              ),
              Text("\$ " '${priceitem}'),
            ],
          ),
        ),
      )
    ]);
  }
}
