import 'package:badges/badges.dart';
import 'package:ecommerce_app/services/provider_cart.dart';
import 'package:ecommerce_app/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../widgets/appbar.dart';

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
      bottomNavigationBar: Container(
        //height: 80,
        child: BottomAppBar(
          child: Container(
            padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Total Items: ',
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Consumer<CartProvider>(builder: (context, cart, child) {
                        return Row(children: [
                          Text(
                            '${cart.totalitems}',
                            style: GoogleFonts.poppins(
                              color: Theme.of(context).primaryColor,
                              fontSize: 19,
                            ),
                          ),
                        ]);
                      }),
                    ]),
                const SizedBox(
                  height: 8,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Total Price:     ',
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                      Consumer<CartProvider>(builder: (context, cart, child) {
                        return Row(children: [
                          Text(
                            "\$ " '${cart.totalAmount}',
                            style: GoogleFonts.poppins(
                              color: Theme.of(context).primaryColor,
                              fontSize: 19,
                            ),
                          ),
                        ]);
                      }),
                    ]),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBarCustom(
        title: Text(
          'Cart Items',
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Theme.of(context).primaryColor,
          ),
        ),
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
                            width: 140,
                            height: 115,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(24),
                                bottomLeft: Radius.circular(24),
                              ),
                              child: Image.network(
                                currentcartitem.image,
                                fit: BoxFit.cover,
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
                                width: 154,
                                child: Text(
                                  currentcartitem.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.visible,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                  width: 220,
                                  height: 40,
                                  child: Row(
                                    children: [
                                      Text(
                                        'Quantity:  ',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 28,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          if (currentcartitem.qty == 1) {
                                            Fluttertoast.showToast(
                                                msg:
                                                    'Quantity cannot be less than one');
                                          } else {
                                            context
                                                .read<CartProvider>()
                                                .qtyminus(index);
                                          }
                                        },
                                        icon: const Icon(Icons.remove),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Consumer<CartProvider>(
                                          builder: (context, cart, child) {
                                        return Text(
                                          "${cart.quantity(index)}",
                                          style: GoogleFonts.poppins(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 14,
                                          ),
                                        );
                                      }),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          if (currentcartitem.qty > 9) {
                                            Fluttertoast.showToast(
                                                msg:
                                                    'Quantity cannot be more than ten');
                                          } else {
                                            context
                                                .read<CartProvider>()
                                                .qtyplus(index);
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                        ),
                                      ),
                                    ],
                                  )),
                              const SizedBox(
                                width: 5,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
