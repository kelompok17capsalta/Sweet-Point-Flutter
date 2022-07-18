import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kel17/page/DetailBerita.dart';
import 'package:kel17/page/qna.dart';
import 'package:kel17/page/transaksi.dart';
import 'package:kel17/viewmodel/artikel_viewmodel.dart';
import 'package:kel17/viewmodel/history_viewmodel.dart';
import 'package:kel17/viewmodel/pulsa_viewmodel.dart';
import 'package:kel17/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';

TabController? _tabController;
bool isAll = true;

class Test extends StatefulWidget {
  Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  List<String> imgC = [
    'assets/a.png',
    'assets/b.png',
    'assets/c.png',
    'assets/d.png',
  ];

  List<String> imgList = [
    'assets/a.png',
    'assets/b.png',
    'assets/c.png',
    'assets/d.png',
  ];

  List<String> img = [
    'assets/e.png',
    'assets/f.png',
    'assets/g.png',
    'assets/h.png',
  ];

  List<String> Text1 = [
    'Philips',
    'Erigo',
    'Adidas',
    'Nivea',
  ];

  List<String> TextList = [
    'The North Face',
    'Unilever',
    'Uniqlo',
    'Motul',
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Box(),
              BoxProfile(),
              SizedBox(
                height: 10,
              ),
              Carousel1(
                Img: [],
              ),
              ListPaket(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Toko Pilihan',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              gridview1(imgList: imgList),
              gridview2(TextList: TextList),
              gridview3(img: img),
              gridview4(Text1: Text1),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Redeem',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Carousel(),
              // Carousel1(imgC: imgC)
            ],
          ),
        ),
      ),
    );
  }
}

class gridview2 extends StatelessWidget {
  const gridview2({
    Key? key,
    required this.TextList,
  }) : super(key: key);
  final List<String> TextList;
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Expanded(
            child: SizedBox(
              height: 35.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: TextList.length,
                  // padding: const EdgeInsets.only(top: 10),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 2, right: 50),
                        child: Expanded(
                          child: Text(
                            TextList[index],
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ));
                  }),
            ),
          )
        ]);
  }
}

class gridview4 extends StatelessWidget {
  const gridview4({
    Key? key,
    required this.Text1,
  }) : super(key: key);
  final List<String> Text1;
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Expanded(
            child: SizedBox(
              height: 35.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Text1.length,
                  // padding: const EdgeInsets.only(top: 10),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 5, left: 40, right: 25),
                        child: Expanded(
                          child: Text(
                            Text1[index],
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ));
                  }),
            ),
          )
        ]);
  }
}

class gridview1 extends StatelessWidget {
  const gridview1({
    Key? key,
    required this.imgList,
  }) : super(key: key);

  final List<String> imgList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(
        10,
      ),
      child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 4,
          children: List.generate(imgList.length, (index) {
            return Container(
              margin: const EdgeInsets.all(5),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 216, 227, 252),
                borderRadius: BorderRadius.circular(15),
              ),

              // padding: const EdgeInsets.all(1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      imgList[index],
                      width: 75,
                    ),
                  ),
                ],
              ),
            );
          })),
    );
  }
}

class gridview3 extends StatelessWidget {
  const gridview3({
    Key? key,
    required this.img,
  }) : super(key: key);

  final List<String> img;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(
        10,
      ),
      child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 4,
          children: List.generate(img.length, (index) {
            return Container(
              margin: const EdgeInsets.all(5),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 216, 227, 252),
                borderRadius: BorderRadius.circular(15),
              ),

              // padding: const EdgeInsets.all(1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      img[index],
                      width: 75,
                    ),
                  ),
                ],
              ),
            );
          })),
    );
  }
}

class ListPaket extends StatefulWidget {
  const ListPaket({
    Key? key,
  }) : super(key: key);

  @override
  State<ListPaket> createState() => _ListPaketState();
}

class _ListPaketState extends State<ListPaket> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<HistoryViewModel>(context, listen: false).histori();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'History',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'See Details',
                style: GoogleFonts.poppins(fontSize: 14),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Consumer<HistoryViewModel>(builder: (context, model, child) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
                  padding: const EdgeInsets.all(12.0),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 216, 227, 252),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${model.historyData?.data?[index].descriptions}",
                                  // history.descriptions ?? "",

                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      overflow: TextOverflow.ellipsis),
                                  maxLines: 3,
                                ),
                                Text(
                                  "${model.historyData?.data?[index].points} Points",
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      overflow: TextOverflow.ellipsis),
                                  maxLines: 3,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${model.historyData?.data?[index].status} ",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      overflow: TextOverflow.ellipsis),
                                  maxLines: 3,
                                ),
                                Text(
                                  "${model.historyData?.data?[index].category}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      overflow: TextOverflow.ellipsis),
                                  maxLines: 3,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                );
              });
        }),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class Box extends StatelessWidget {
  const Box({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 231, 238, 253),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                width: 50,
                fit: BoxFit.cover,
                image: AssetImage('assets/point.png'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        QnA(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(0.0, 1.0);
                      const end = Offset.zero;
                      const curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ));
                },
                child: Image(
                  width: 50,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/FAQ.png'),
                ),
              ),
            ],
          ),
        ));
  }
}

class BoxProfile extends StatefulWidget {
  const BoxProfile({Key? key}) : super(key: key);

  @override
  State<BoxProfile> createState() => _BoxProfileState();
}

class _BoxProfileState extends State<BoxProfile> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<ContactViewModel>(context, listen: false).profil();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactViewModel>(builder: (context, model, child) {
      return Container(
          margin: const EdgeInsets.all(10),
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF6372F6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Text(
                        'A',
                        style: TextStyle(
                            color: Colors.purpleAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      radius: 25,
                      backgroundColor: Color.fromARGB(255, 236, 187, 245),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      padding: EdgeInsetsDirectional.only(
                        top: 15,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome back ${model.profileData?.data?.username}',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Your earnings point',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image(
                      width: 25,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/coins.png'),
                    ),
                    Text(
                      '${model.profileData?.data?.point}',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${model.profileData?.data?.point}',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ));
    });
  }
}

class Toko extends StatefulWidget {
  const Toko({
    Key? key,
  }) : super(key: key);

  @override
  State<Toko> createState() => _TokoState();
}

class _TokoState extends State<Toko> {
  var iconTypes = <IconData>[
    Icons.cake,
    Icons.add_location_sharp,
    Icons.zoom_in_outlined,
    Icons.auto_awesome_motion,
    Icons.call_end_sharp,
    Icons.equalizer_rounded,
    Icons.wifi_lock,
    Icons.mail,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: 10,
        child: Container(
          margin: const EdgeInsets.only(
            top: 10,
          ),
          child: GridView.count(
              crossAxisCount: 4,
              children: List.generate(iconTypes.length, (index) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 72, 189, 243),
                    child: Icon(
                      iconTypes[index],
                      color: Colors.white,
                    ),
                  ),
                );
              })),
        ),
      ),
    ));
  }
}

class Carousel extends StatefulWidget {
  const Carousel({
    Key? key,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<PulsaViewModel>(context, listen: false).pulsa();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: 210,
          child: (Consumer<PulsaViewModel>(builder: (context, model, child) {
            return Swiper(
              itemBuilder: (BuildContext context, int index) {
                final pulsa = model.data[index];
                return SizedBox(
                  height: 50,
                  width: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: NetworkImage(pulsa.image ?? ""),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 500,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 231, 238, 253),
                                  // borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        pulsa.productName ?? " ",
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        pulsa.descriptions ?? "",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                        maxLines: 3,
                                      )
                                    ],
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
              itemCount: model.data.length,
              viewportFraction: 0.8,
              scale: 0.9,
            );
          })),
        ),
      ],
    );
  }
}

class Carousel1 extends StatefulWidget {
  const Carousel1({
    Key? key,
    required this.Img,
  }) : super(key: key);
  final List<String> Img;
  @override
  State<Carousel1> createState() => _Carousel1State();
}

class _Carousel1State extends State<Carousel1> {
  List Img = [
    {
      'image': 'assets/c2.jpeg',
      'title': 'P&G',
      'point':
          'P&G diskon s/d 50 % Gratis ongkir, dapatkan hingga 300 point segera belanja sekarang.'
    },
    {
      'image': 'assets/c3.jpeg',
      'title': 'Unilever',
      'point':
          'Segera belanja produk unilever dan dapatkan hingga 450 point, dan cashback 20%. Anda bisa menukarkan point yang anda dapatkan dengan benefit dari kami '
    },
    {
      'image': 'assets/c4.jpeg',
      'title': 'Uniqlo',
      'point':
          'Uniqlo brand festival diskon s/d 50 % Gratis ongkir, dapatkan hingga 300 point segera belanja sekarang.'
    },
    {
      'image': 'assets/c5.jpeg',
      'title': 'Ramayana',
      'point':
          'Belanja di toko ramayana, karena kami mempunyai promo menarik bagi anda. dan dapatkan promo cashback sampai dengan 100 point'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SizedBox(
              height: 210,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  // final pulsa = model.data[index];
                  return SizedBox(
                    height: 50,
                    width: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: DecorationImage(
                          image: AssetImage(Img[index]['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 500,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 231, 238, 253),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          Img[index]['title'],
                                          style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          Img[index]['point'],
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              overflow: TextOverflow.ellipsis),
                                          maxLines: 3,
                                        )
                                      ],
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
                itemCount: Img.length,
                viewportFraction: 0.8,
                scale: 0.9,
              ))
        ]);
  }
}
