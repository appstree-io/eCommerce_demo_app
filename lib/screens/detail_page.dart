import 'package:badges/badges.dart';
import 'package:ecommerce_app/model/product_detail_model.dart';
import 'package:ecommerce_app/services/api_handler.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../widgets/appbar.dart';
import '../services/provider_cart.dart';
import '../widgets/buttonsdetailpage.dart';

class DetailPage extends StatefulWidget {
  final int productid;
  const DetailPage({Key? key, required this.productid}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final cartitems = context.watch<CartProvider>().cartProd;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const AppBarCustom(
        title: Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            FutureBuilder<ProductDetailData>(
              future: fetchProductDetail(widget.productid),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  ValueNotifier<String> onButtontap =
                      ValueNotifier(snapshot.data!.thumbnail);

                  return SliverToBoxAdapter(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 333,
                                  width: MediaQuery.of(context).size.width - 32,
                                  decoration: BoxDecoration(
                                      color: Color(0xff767575),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: ValueListenableBuilder(
                                        valueListenable: onButtontap,
                                        builder: (BuildContext context,
                                            String image, child) {
                                          return Image.network(
                                            image,
                                            fit: BoxFit.contain,
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: 75,
                          child: ListView.builder(
                            itemCount: snapshot.data!.images?.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  onButtontap.value =
                                      snapshot.data!.images![index];
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: Image.network(
                                      snapshot.data!.images![index],
                                      fit: BoxFit.fitHeight,
                                      height: 55,
                                    ),
                                  ),
                                ),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          snapshot.data!.prodname ??
                              snapshot.data!.prodname.toString().toUpperCase(),
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          snapshot.data!.description ??
                              snapshot.data!.description.toString(),
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Rating: ',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.rating.toString(),
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Theme.of(context).primaryColorDark,
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.star_outline_sharp,
                              size: 14,
                              color: Colors.amber.shade500,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        if (snapshot.data!.category == 'smartphones' ||
                            snapshot.data!.category == 'laptops') ...[
                          Text(
                            'Color: ',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(32, 32),
                                  primary: Color(0xff000000),
                                  // onSurface: Color(0XffFFEEC1),
                                  shape: CircleBorder(),
                                ),
                                onPressed: () {},
                                child: Text(
                                  '  ',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(32, 32),
                                  primary: Color(0xffFFFFFF),
                                  // onSurface: Color(0XffFFEEC1),
                                  shape: CircleBorder(),
                                ),
                                onPressed: () {},
                                child: Text(
                                  '  ',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(32, 32),
                                  primary: Color(0xff2C2C2C),
                                  // onSurface: Color(0XffFFEEC1),
                                  shape: CircleBorder(),
                                ),
                                onPressed: () {},
                                child: Text(
                                  '  ',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(32, 32),
                                  primary: Colors.blue.shade600,
                                  // onSurface: Color(0XffFFEEC1),
                                  shape: CircleBorder(),
                                ),
                                onPressed: () {},
                                child: Text(
                                  '  ',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                        const SizedBox(
                          height: 16,
                        ),
                        EndButtonsDetailPage(
                          priceitem: snapshot.data!.price,
                        )
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const SliverToBoxAdapter(child: Text("Error"));
                }
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.white,
                      strokeWidth: 50,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
