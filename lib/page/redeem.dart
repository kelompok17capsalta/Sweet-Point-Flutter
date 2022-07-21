import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kel17/page/cashout.dart';
import 'package:kel17/page/emoney.dart';
import 'package:kel17/page/paket.dart';
import 'package:kel17/page/pulsa.dart';
import 'package:kel17/viewmodel/history_viewmodel.dart';
import 'package:kel17/viewmodel/pulsa_viewmodel.dart';
import 'package:provider/provider.dart';

// ignore: unused_element
TabController? _tabController;
bool isAll = true;

class Tukar extends StatefulWidget {
  const Tukar({Key? key}) : super(key: key);

  @override
  State<Tukar> createState() => _TukarState();
}

class _TukarState extends State<Tukar> {
  List Img = [
    {
      'image': 'assets/r1.png',
      'title': 'Cash Out',
    },
    {
      'image': 'assets/r2.png',
      'title': 'E-Money',
    },
    {
      'image': 'assets/r3.png',
      'title': 'Pulsa',
    },
    {
      'image': 'assets/r4.png',
      'title': 'Paket',
    },
  ];
  // ignore: non_constant_identifier_names
  List<String> Text1 = [
    'Cash Out',
    'E-Money',
    'Pulsa',
    'Paket',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const listpaket(),
              GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  children: List.generate(Img.length, (index) {
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
                                      const Emoney()));
                        } else if (index == 2) {
                          Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const Pulsaa()));
                        } else if (index == 3) {
                          Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const Paket()));
                        }
                      },
                      child: Container(
                          margin: const EdgeInsets.all(10),
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 216, 227, 252),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    Img[index]['image'],
                                    width: 150,
                                  ),
                                ),
                                Text(
                                  Img[index]['title'],
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    );
                  })),
              // gridview4(Text1: Text1),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
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
            color: const Color.fromARGB(255, 216, 227, 252),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Status Redeem',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
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
                          color: const Color.fromARGB(255, 216, 227, 252),
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
                                        "${model.historyData?.data?[index].category}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            overflow: TextOverflow.ellipsis),
                                        maxLines: 3,
                                      ),
                                      Text(
                                        "${model.historyData?.data?[index].status} ",
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
                            const SizedBox(
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
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

// ignore: camel_case_types
class gridview4 extends StatefulWidget {
  const gridview4({
    Key? key,
    // ignore: non_constant_identifier_names
    required this.Text1,
  }) : super(key: key);
  // ignore: non_constant_identifier_names
  final List<String> Text1;

  @override
  State<gridview4> createState() => _gridview4State();
}

// ignore: camel_case_types
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
                  // ignore: unused_local_variable
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
                                      const CashOut()));
                            } else if (index == 1) {
                              Navigator.of(context).push(PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const Emoney()));
                            } else if (index == 2) {
                              Navigator.of(context).push(PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const Pulsaa()));
                            } else if (index == 3) {
                              Navigator.of(context).push(PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const Paket()));
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
