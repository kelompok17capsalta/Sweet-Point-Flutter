import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kel17/viewmodel/history_viewmodel.dart';
import 'package:provider/provider.dart';

class Transaksi extends StatefulWidget {
  final String created;
  final String descriptions;
  final String status;

  const Transaksi({
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
          // ignore: avoid_unnecessary_containers
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
                        color: const Color.fromRGBO(143, 148, 251, 1),
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
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: model.dataHistory!.data!.length,
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
                                        "${model.historyData?.data?[index].descriptions}",
                                        // history.descriptions ?? "",

                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            overflow: TextOverflow.ellipsis),
                                        maxLines: 3,
                                      ),
                                      Text(
                                        "${model.historyData?.data?[index].points} Points",
                                        style: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 14,
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
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            overflow: TextOverflow.ellipsis),
                                        maxLines: 3,
                                      ),
                                      Text(
                                        "${model.historyData?.data?[index].category}",
                                        style: const TextStyle(
                                            fontSize: 15,
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
              const SizedBox(
                height: 30,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
