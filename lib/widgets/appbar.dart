import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Screens/cartpage.dart';
import '../services/provider_cart.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  const AppBarCustom({
    required this.title,
    Key? key,
  }) : super(key: key);
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackButton(color: Theme.of(context).primaryColor),
      title: title,
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            right: 5,
          ),
          child: Stack(children: [
            Positioned(
              left: 30,
              bottom: 0,
              top: 10,
              child: Badge(
                badgeContent: SizedBox(
                  child:
                      Consumer<CartProvider>(builder: (context, cart, child) {
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
                height: 35,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  // color: Color(0xff232327),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CartPage()),
                    );
                  },
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    size: 24,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ],
      shadowColor: Colors.transparent,
      automaticallyImplyLeading: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
