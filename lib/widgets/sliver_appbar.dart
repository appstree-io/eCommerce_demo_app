import 'package:ecommerce_app/screens/cartpage.dart';
import 'package:ecommerce_app/provider/provider_cart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badge;
import 'package:provider/provider.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      // pinned: true,
      snap: true,
      // expandedHeight: 50,
      collapsedHeight: 150,

      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        centerTitle: true,
        title: SizedBox(
          height: 250,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 0,
              right: 25,
              bottom: 3,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 0,
                            top: 50,
                            //right: 50,
                          ),
                          child: Text(
                            'Hello,',
                            style: GoogleFonts.poppins(
                              color: Theme.of(context).primaryColorDark,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 0,
                            bottom: 0,
                          ),
                          child: Text(
                            'Hari Parasad',
                            style: GoogleFonts.poppins(
                              color: Theme.of(context).primaryColor,
                              fontSize: 22,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 0,
                        top: 53,
                        bottom: 0,
                      ),
                      child: Stack(children: [
                        Positioned(
                          left: 30,
                          bottom: 7,
                          child: badge.Badge(
                            badgeContent: SizedBox(
                              child: Consumer<CartProvider>(
                                  builder: (context, cart, child) {
                                return Center(
                                  child: Text(
                                    "${cart.count}",
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xffFFFFFF),
                                      fontSize: 12,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            height: 30,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              // color: Color(0xff232327),
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CartPage()),
                                );
                              },
                              icon: Icon(
                                Icons.shopping_cart_outlined,
                                size: 22,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
