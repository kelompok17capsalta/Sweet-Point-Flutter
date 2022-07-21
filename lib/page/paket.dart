import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kel17/page/detail_paket.dart';
import 'package:kel17/util/finite_state.dart';
import 'package:kel17/viewmodel/paket_viewmodel.dart';
import 'package:provider/provider.dart';

class Paket extends StatefulWidget {
  const Paket({
    Key? key,
  }) : super(key: key);

  @override
  State<Paket> createState() => _PaketState();
}

class _PaketState extends State<Paket> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<PaketViewModel>(context, listen: false).paket();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 10) / 7;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Pilih Paket')),
        backgroundColor: const Color(0xFF6372F6),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            const Image(
              width: double.infinity,
              fit: BoxFit.cover,
              image: AssetImage('assets/paket.png'),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: Consumer<PaketViewModel>(
                builder: (context, model, child) {
                  switch (model.myState) {
                    case MyState.initial:
                      return const SizedBox();
                    case MyState.loading:
                      return const CircularProgressIndicator();

                    case MyState.success:
                      return GridView.builder(
                        shrinkWrap: true,
                        itemCount: model.data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: (itemWidth / itemHeight),
                        ),

                        // final paket = model.data[index];
                        itemBuilder: (BuildContext context, int index) {
                          final paket = model.data[index];
                          return GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container(
                                        margin: const EdgeInsets.all(15),
                                        height: 65,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Rp.${paket.denom ?? 0.toString()}',
                                                  style: GoogleFonts.poppins(
                                                    color:
                                                        const Color(0xFF6372F6),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(const Color(
                                                                0xFF6372F6)),
                                                  ),
                                                  onPressed: () async {
                                                    // try {
                                                    Navigator.of(context)
                                                        .push(PageRouteBuilder(
                                                      pageBuilder: (context,
                                                              animation,
                                                              secondaryAnimation) =>
                                                          DetailPaket(
                                                              points: paket
                                                                  .points
                                                                  .toString(),
                                                              category: paket
                                                                      .category ??
                                                                  "",
                                                              descriptions:
                                                                  paket.descriptions ??
                                                                      "",
                                                              denom: paket.denom
                                                                  .toString(),
                                                              provider: paket
                                                                      .productName ??
                                                                  "",
                                                              product: paket.id
                                                                  .toString()),
                                                    ));
                                                  },
                                                  child:
                                                      const Text("Redeem Now"),
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.topLeft,
                                                child: SizedBox(
                                                  height: 50,
                                                  child: Text(
                                                    ' ${paket.points ?? 0.toString()} Point',
                                                    style: GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xFF6372F6),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // })
                                      ));
                            },
                            child: Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 216, 227, 252),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Expanded(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                ' ${paket.stock ?? 0.toString()} GB',
                                                style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const Expanded(
                                                child: SizedBox(
                                                  width: 40,
                                                ),
                                              ),
                                              Text(
                                                paket.productName ?? "",
                                                style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  ' ${paket.points ?? 0.toString()} Point',
                                                  style: GoogleFonts.poppins(
                                                    color:
                                                        const Color(0xFF6372F6),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                          );
                        },
                      );
                    case MyState.failed:
                      return const Text("Something Wrong");
                  }
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
