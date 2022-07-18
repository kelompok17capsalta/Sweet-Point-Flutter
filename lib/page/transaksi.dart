import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kel17/page/DetailBerita.dart';
import 'package:kel17/viewmodel/artikel_viewmodel.dart';
import 'package:kel17/viewmodel/history_viewmodel.dart';
import 'package:kel17/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';

class Transaksi extends StatefulWidget {
  final String created;
  final String descriptions;
  final String status;

  Transaksi({
    Key? key,
    required this.created,
    required this.descriptions,
    required this.status,
  }) : super(key: key);

  @override
  State<Transaksi> createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'History',
                      style: GoogleFonts.poppins(
                        color: Color.fromRGBO(143, 148, 251, 1),
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Image.asset('assets/menu.png')
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //list berita
              Consumer<HistoryViewModel>(builder: (context, model, child) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 8),
                          padding: const EdgeInsets.all(12.0),
                          height: 100,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      widget.created,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          overflow: TextOverflow.ellipsis),
                                      maxLines: 3,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                widget.descriptions,
                                style: GoogleFonts.poppins(
                                  color: Colors.grey.shade600,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                widget.status,
                                style: GoogleFonts.poppins(
                                  color: Colors.grey.shade600,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                );
              }),
              SizedBox(
                height: 30,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
