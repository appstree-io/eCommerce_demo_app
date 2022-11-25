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
        title: Text('Cart Items'),
        backgroundColor: Colors.blueAccent,
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
                    color: Color(0xff232327),
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
                                    color: Color(0xffE1E1E1),
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
                                  const Icon(
                                    Icons.attach_money_rounded,
                                    color: Color(0xffFFFFFF),
                                  ),
                                  Text(
                                    currentcartitem.price.toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffFFFFFF),
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
                                      child: const Icon(
                                        Icons.delete_rounded,
                                        color: Color(0xffFFFFFF),
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
