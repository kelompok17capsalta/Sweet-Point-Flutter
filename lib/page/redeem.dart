import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kel17/page/DetailBerita.dart';
import 'package:kel17/page/cashout.dart';
import 'package:kel17/page/detail_money.dart';
import 'package:kel17/page/detail_paket.dart';
import 'package:kel17/page/emoney.dart';
import 'package:kel17/page/paket.dart';
import 'package:kel17/page/pulsa.dart';
import 'package:kel17/viewmodel/artikel_viewmodel.dart';
import 'package:kel17/viewmodel/history_viewmodel.dart';
import 'package:kel17/viewmodel/pulsa_viewmodel.dart';
import 'package:kel17/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';

TabController? _tabController;
bool isAll = true;

class Tukar extends StatefulWidget {
  Tukar({Key? key}) : super(key: key);

  @override
  State<Tukar> createState() => _TukarState();
}

class _TukarState extends State<Tukar> {
  @override
  List<String> img = [
    'assets/r1.png',
    'assets/r2.png',
    'assets/r3.png',
    'assets/r4.png',
  ];

  List<String> Text1 = [
    'Cash Out',
    'E-Money',
    'Pulsa',
    'Paket',
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              listpaket(),
              Container(
                child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    children: List.generate(img.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          if (index == 0) {
                            Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        CashOut()));
                          } else if (index == 1) {
                            Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        Emoney()));
                          } else if (index == 2) {
                            Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        Pulsaa()));
                          } else if (index == 3) {
                            Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        Paket()));
                          }
                        },
                        child: Container(
                            margin: const EdgeInsets.all(10),
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 216, 227, 252),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Image.asset(
                                      img[index],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      );
                    })),
              ),
              gridview4(Text1: Text1),
            ],
          ),
        ),
      ),
    );
  }
}

class listpaket extends StatelessWidget {
  const listpaket({
    Key? key,
  }) : super(key: key);

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
          child: Center(
            child: Text(
              'History',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        //list berita
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 216, 227, 252),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status Redeem',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'April 2022',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Consumer<HistoryViewModel>(builder: (context, model, child) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    // model.dataHistory!.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 8),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class gridview4 extends StatefulWidget {
  const gridview4({
    Key? key,
    required this.Text1,
  }) : super(key: key);
  final List<String> Text1;

  @override
  State<gridview4> createState() => _gridview4State();
}

class _gridview4State extends State<gridview4> {
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
          Expanded(
              child: SizedBox(
            height: 35.0,
            child: (Consumer<PulsaViewModel>(builder: (context, model, child) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.Text1.length,
                // padding: const EdgeInsets.only(top: 10),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final pulsa = model.data[index];
                  return Padding(
                      padding:
                          const EdgeInsets.only(bottom: 5, left: 25, right: 30),
                      child: Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              Navigator.of(context).push(PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      CashOut()));
                            } else if (index == 1) {
                              Navigator.of(context).push(PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      Emoney()));
                            } else if (index == 2) {
                              Navigator.of(context).push(PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      Pulsaa()));
                            } else if (index == 3) {
                              Navigator.of(context).push(PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      Paket()));
                            }
                          },
                          child: Text(
                            widget.Text1[index],
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ));
                },
              );
            })),
          ))
        ]);
  }
}
