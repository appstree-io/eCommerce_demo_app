import 'package:ecommerce_app/screens/cartpage.dart';
import 'package:ecommerce_app/services/provider_cart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      expandedHeight: 100,
      collapsedHeight: 95,
      backgroundColor: Colors.black,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Colors.black,
        ),
        title: SizedBox(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 5,
              bottom: 3,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                              top: 53,
                              right: 0,
                            ),
                            child: Text(
                              'Hello,',
                              style: GoogleFonts.poppins(
                                color: const Color(0xffC4C4C4),
                                fontSize: 13,
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
                                color: Color(0xffFFFFFF),
                                fontSize: 18,
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
                        width: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 0,
                          top: 45,
                          bottom: 0,
                        ),
                        child: Stack(children: [
                          Positioned(
                            left: 30,
                            bottom: 6,
                            child: Badge(
                              badgeContent: SizedBox(
                                // height: 10,
                                //width: 10,
                                child: Consumer<CartProvider>(
                                    builder: (context, cart, child) {
                                  return Center(
                                    child: Text(
                                      "${cart.count}",
                                      style: GoogleFonts.poppins(
                                        color: Color(0xffFFFFFF),
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
                                icon: const Icon(
                                  Icons.shopping_cart_outlined,
                                  size: 20,
                                  color: Color(0xffFFFFFF),
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
      ),
    );
  }
}
