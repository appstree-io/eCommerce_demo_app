import 'package:ecommerce_app/model/cart_product_modal.dart';
import 'package:ecommerce_app/model/product_modal.dart';
import 'package:ecommerce_app/services/provider_cart.dart';
import 'package:ecommerce_app/widgets/toggle_theme.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../widgets/sliver_appbar.dart';
import '../widgets/items.dart';
import '../services/api_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../widgets/searchbox.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int currentIndex = 0;
  List cardList = [Item3(), Item1(), Item2(), Item4()];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final cartitems = context.watch<CartProvider>().cartProd;

    return Scaffold(
      //bottomNavigationBar: BottomBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        child: CustomScrollView(
          slivers: [
            const Appbar(),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Toggle Light / Dark Theme ',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const ToggleThemeWidget(),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 17,
              ),
            ),
            const SliverToBoxAdapter(
              child: SearchBox(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 17,
              ),
            ),
            SliverToBoxAdapter(
              child: promocarousel(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 12,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Featured',
                style: GoogleFonts.poppins(
                  color: Theme.of(context).primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 5,
              ),
            ),
            SliverToBoxAdapter(
              child: featuredproducts(cartitems),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 21,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'All',
                style: GoogleFonts.poppins(
                  color: Theme.of(context).primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            allProducts(cartitems),
          ],
        ),
      ),
    );
  }

  FutureBuilder<List<ProductData>> allProducts(List<CartProduct> cartitems) {
    return FutureBuilder<List<ProductData>>(
      future: fetchProductdata(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              ((context, index) {
                final cartItem = snapshot.data![index];
                final cart = CartProduct(
                  id: cartItem.id,
                  name: cartItem.prodname.toString(),
                  image: cartItem.thumbnail.toString(),
                  price: cartItem.price,
                  description: cartItem.description.toString(),
                );
                final CartItem = cartitems.firstWhere(
                    (element) => element.id == cartItem.id,
                    orElse: (() => cart));
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
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(24),
                                bottomLeft: Radius.circular(24),
                              ),
                              child: Image.network(
                                snapshot.data![index].thumbnail,
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
                                  snapshot.data![index].prodname ??
                                      snapshot.data![index].prodname.toString(),
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
                                  snapshot.data![index].description ??
                                      snapshot.data![index].description
                                          .toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.fade,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).primaryColor,
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
                                    snapshot.data![index].price.toString(),
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
                                      if (cartitems.contains(CartItem)) {
                                        Fluttertoast.showToast(
                                            msg: 'Item already exists in cart');
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: 'Item added to cart');
                                        context
                                            .read<CartProvider>()
                                            .addtocart(cart);
                                      }
                                    },
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle),
                                      child: Icon(
                                        Icons.shopping_cart_outlined,
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
              }),
              childCount: snapshot.data!.length,
            ),
            //
          );
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(child: Text("Error"));
        }
        return const SliverToBoxAdapter(child: Text("Loading..."));
      },
    );
  }

  FutureBuilder<List<ProductData>> featuredproducts(
      List<CartProduct> cartitems) {
    return FutureBuilder<List<ProductData>>(
      future: fetchProductCategoryData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            //width: double.infinity,
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              //itemExtent: 140,
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, index) {
                final cartItem = snapshot.data![index];

                final cart = CartProduct(
                  id: cartItem.id,
                  name: cartItem.prodname.toString(),
                  image: cartItem.thumbnail.toString(),
                  price: cartItem.price,
                  description: cartItem.description.toString(),
                );
                final CartItem = cartitems.firstWhere(
                    (element) => element.id == cartItem.id,
                    orElse: (() => cart));
                return Padding(
                  padding: const EdgeInsets.fromLTRB(
                    0,
                    0,
                    15.78,
                    15,
                  ),
                  child: Container(
                    width: 154,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Theme.of(context).primaryColorLight,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Container(
                            height: 140,
                            width: 154,
                            child: Image(
                              image:
                                  NetworkImage(snapshot.data![index].thumbnail),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                snapshot.data?[index].prodname ??
                                    snapshot.data![index].prodname.toString(),
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.attach_money_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 0,
                              ),
                              Text(
                                snapshot.data![index].price.toString(),
                                style: GoogleFonts.poppins(
                                  fontSize: 17,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              const SizedBox(
                                width: 35,
                              ),
                              InkWell(
                                onTap: () {
                                  if (cartitems.contains(CartItem)) {
                                    Fluttertoast.showToast(
                                        msg: 'Item already exists in cart');
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'Item added to cart');
                                    context
                                        .read<CartProvider>()
                                        .addtocart(cart);
                                  }
                                },
                                borderRadius: BorderRadius.circular(40),
                                splashColor: Colors.white,
                                child: Container(
                                  foregroundDecoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return const Text("Error");
        }
        return Text("Loading...");
      },
    );
  }

  Column promocarousel() {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 160.0,
            viewportFraction: 1,
            autoPlay: false,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          items: cardList.map((card) {
            return Builder(builder: (BuildContext context) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.40,
                  width: MediaQuery.of(context).size.width * 0.91,
                  child: card,
                ),
              );
            });
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(cardList, (index, url) {
            return Row(children: [
              currentIndex == index
                  ? Container(
                      width: 25.0,
                      height: 9.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 6.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xffFFCB11),
                      ),
                    )
                  : Container(
                      width: 10.0,
                      height: 10.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 5.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                    )
            ]);
          }),
        ),
      ],
    );
  }
}
