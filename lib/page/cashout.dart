import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kel17/page/detail_paket.dart';
import 'package:kel17/util/finite_state.dart';
import 'package:kel17/viewmodel/redeem_viewmodel.dart';
import 'package:provider/provider.dart';

import '../viewmodel/cashout_viewmodel.dart';

class CashOut extends StatefulWidget {
  const CashOut({
    Key? key,
  }) : super(key: key);

  @override
  State<CashOut> createState() => _CashOutState();
}

class _CashOutState extends State<CashOut> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<CashOutViewModel>(context, listen: false).cashout();
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
        title: const Center(child: Text('Pilih CashOut')),
        backgroundColor: Color(0xFF6372F6),
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
              child: Consumer<CashOutViewModel>(
                builder: (context, model, child) {
                  final getProvider = Provider.of<RedeemViewModel>(context);
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
                          final emoney = model.data[index];
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
                                                  'Point yang dibutuhkan',
                                                  style: GoogleFonts.poppins(
                                                    color: Color.fromARGB(
                                                        255, 155, 155, 156),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
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
                                                              points: emoney
                                                                  .points
                                                                  .toString(),
                                                              category: emoney
                                                                      .category ??
                                                                  "",
                                                              descriptions:
                                                                  emoney.descriptions ??
                                                                      "",
                                                              denom: emoney
                                                                  .denom
                                                                  .toString(),
                                                              provider: emoney
                                                                      .productName ??
                                                                  "",
                                                              product: emoney.id
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
                                                    ' ${emoney.points ?? 0.toString()} Point',
                                                    style: GoogleFonts.poppins(
                                                      color: Color(0xFF6372F6),
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
                                  color: Color.fromARGB(255, 216, 227, 252),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            emoney.productName ?? "",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            ' ${emoney.points ?? 0.toString()} Point',
                                            style: GoogleFonts.poppins(
                                              color: Color(0xFF6372F6),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
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
