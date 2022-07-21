import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kel17/page/toko.dart';

class Tabb extends StatefulWidget {
  const Tabb({Key? key}) : super(key: key);

  @override
  _TabbState createState() => _TabbState();
}

class _TabbState extends State<Tabb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 35.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Semua Toko',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Icon(Icons.search),
                ],
              ),
            ),
            DefaultTabController(
                length: 2, // length of tabs
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const TabBar(
                        labelColor: Color.fromRGBO(143, 148, 251, 1),
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(text: 'Online'),
                          Tab(text: 'Traditional'),
                        ],
                      ),
                      Container(
                          height: 500, //height of TabBarView
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.grey, width: 0.5))),
                          child: TabBarView(children: <Widget>[
                            const Center(
                              child: Shop(),
                            ),
                            // ignore: avoid_unnecessary_containers
                            Container(
                              child: const Shop(),
                            ),
                          ]))
                    ])),
          ]),
    );
  }
}
