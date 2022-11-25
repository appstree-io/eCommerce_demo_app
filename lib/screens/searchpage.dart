import 'package:ecommerce_app/model/product_modal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/searchbox.dart';
import '../services/api_handler.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            top: 5,
            bottom: 15,
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 300,
                      height: 57,
                      child: SearchBox(),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 57,
                      width: 57,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff232327),
                      ),
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 19,
                ),
              ),
              SliverToBoxAdapter(
                child: Text(
                  'Categories',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 11,
                ),
              ),
              FutureBuilder<List<ProductData>>(
                future: fetchProductdata(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 30,
                        //  mainAxisExtent: 100,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              0,
                              15.78,
                              15,
                            ),
                            child: Container(
                              width: 154,
                              height: 165,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Color(0xff232327),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(18),
                                    child: Container(
                                      height: 110,
                                      width: 154,
                                      child: Image(
                                        image: NetworkImage(
                                            snapshot.data![index].thumbnail),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          snapshot.data![index].category ??
                                              snapshot.data![index].category
                                                  .toString(),
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: Color(0xffE1E1E1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                        childCount: snapshot.data!.length,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const SliverToBoxAdapter(child: Text("Error"));
                  }
                  return const SliverToBoxAdapter(child: Text("Loading..."));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
