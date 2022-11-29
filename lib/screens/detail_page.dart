import 'package:ecommerce_app/model/product_detail_model.dart';
import 'package:ecommerce_app/services/api_handler.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  final int productid;
  const DetailPage({Key? key, required this.productid}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff210304),
      appBar: AppBar(
          shadowColor: Colors.transparent,
          automaticallyImplyLeading: true,
          backgroundColor: Color(0xff210304)),
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
                print(snapshot.data?.thumbnail);
                if (snapshot.hasData) {
                  return SliverToBoxAdapter(
                    child: Expanded(
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
                                    width: 328,
                                    color: Color(0xff210304),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        snapshot.data!.thumbnail,
                                        fit: BoxFit.contain,
                                      ),
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
                              itemCount: snapshot.data!.images.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: Image.network(
                                      snapshot.data!.images[index],
                                      fit: BoxFit.fitHeight,
                                      height: 55,
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
                                snapshot.data!.prodname
                                    .toString()
                                    .toUpperCase(),
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffF3F3F3),
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
                              color: Color(0xffCCCCCC),
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
                              color: Color(0xffF3F3F3),
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
                                  color: Color(0xffCCCCCC),
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
                                color: Color(0xffF3F3F3),
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
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 156,
                                  child: TextButton(
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all<
                                                EdgeInsets>(
                                            const EdgeInsets.symmetric(
                                          horizontal: 22,
                                          vertical: 12,
                                        )),
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                          Color(0XffF37272),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          Color(0Xff340404),
                                        ),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                                          MaterialStateProperty.all<Color>(
                                              Color(0xff340404)),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xffFFEEC1)),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                        Text("\$ " '${snapshot.data!.price}'),
                                      ],
                                    ),
                                  ),
                                )
                              ])
                        ],
                      ),
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
