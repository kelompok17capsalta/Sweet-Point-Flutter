import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Shop extends StatefulWidget {
  const Shop({
    Key? key,
  }) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  List Img = [
    {
      'image': 'assets/a.png',
      'title': 'The North Face',
      'point': 'Cashback 500 point'
    },
    {
      'image': 'assets/b.png',
      'title': 'Unilever',
      'point': 'Cashback 500 point'
    },
    {'image': 'assets/c.png', 'title': 'Uniqlo', 'point': 'Cashback 500 point'},
    {'image': 'assets/d.png', 'title': 'Motul', 'point': 'Cashback 500 point'},
    {
      'image': 'assets/e.png',
      'title': 'Philips',
      'point': 'Cashback 500 point'
    },
    {'image': 'assets/f.png', 'title': 'Erigo', 'point': 'Cashback 500 point'},
    {'image': 'assets/g.png', 'title': 'Adidas', 'point': 'Cashback 500 point'},
    {'image': 'assets/h.png', 'title': 'Nivea', 'point': 'Cashback 500 point'},
  ];
  List<String> Text1 = [
    'Philips',
    'Erigo',
    'Adidas',
    'Nivea',
    'The North Face',
    'Unilever',
    'Uniqlo',
    'Motul',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(right: 10, left: 10),
          child: Column(
            children: [
              GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  children: List.generate(Img.length, (index) {
                    return Container(
                        margin: EdgeInsets.all(3),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 216, 227, 252),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.asset(
                                Img[index]['image'],
                                width: 75,
                              ),
                            ),
                            Text(
                              Img[index]['title'],
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              Img[index]['point'],
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ));
                  })),
            ],
          ),
        ),
      ),
    ));
  }
}
