import 'package:badges/badges.dart';
import 'package:ecommerce_app/services/provider_cart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartitems = context.watch<CartProvider>().cartProd;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart Items',
          style: GoogleFonts.poppins(color: Theme.of(context).primaryColor),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: BackButton(color: Theme.of(context).primaryColor),
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
                    onPressed: () {},
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(((context, index) {
                final currentcartitem = cartitems[index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 21),
                  child: Card(
                    color: Theme.of(context).primaryColorLight,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Container(
                      width: 404,
                      height: 116,
                      foregroundDecoration: BoxDecoration(),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 107,
                            height: 115,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                bottomLeft: Radius.circular(24),
                              ),
                              child: Image.network(
                                currentcartitem.image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                height: 20,
                                width: 160,
                                child: Text(
                                  currentcartitem.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              SizedBox(
                                width: 220,
                                height: 40,
                                child: Text(
                                  currentcartitem.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.fade,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffC4C4C4),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.attach_money_rounded,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  Text(
                                    currentcartitem.price.toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 100,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (cartitems.contains(currentcartitem)) {
                                        context
                                            .read<CartProvider>()
                                            .removefromcart(currentcartitem.id);
                                      }
                                    },
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle),
                                      child: Icon(
                                        Icons.delete_rounded,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }), childCount: cartitems.length),
            )
          ],
        ),
      ),
    );
  }
}
