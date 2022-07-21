import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kel17/component/genTextFormField.dart';
import 'package:kel17/model/redeem/data_redeem.dart';
import 'package:kel17/page/success.dart';
import 'package:kel17/util/finite_state.dart';
import 'package:kel17/viewmodel/pulsaa_viewmodel.dart';
import 'package:kel17/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';
import '../viewmodel/redeem_viewmodel.dart';

class DetailPaket extends StatefulWidget {
  final String category;
  final String descriptions;
  final String points;
  final String denom;
  final String product;
  final String provider;
  // final String id;

  const DetailPaket({
    Key? key,
    required this.category,
    required this.points,
    required this.denom,
    required this.product,
    required this.provider,
    required this.descriptions,
    // required this.id,
  }) : super(key: key);

  @override
  State<DetailPaket> createState() => _DetailPaketState();
}

class _DetailPaketState extends State<DetailPaket> {
  var formKey = GlobalKey<FormState>();
  final credentialsController = TextEditingController();
  String credentials = '';
  var providerController = TextEditingController();
  String provider = '';

  var productController = TextEditingController();
  String product = '';
  var iconTypes = <IconData>[
    Icons.cake,
    Icons.add_location_sharp,
  ];

  @override
  void initState() {
    super.initState();
    credentialsController.addListener(() {
      credentials = credentialsController.text;
    });
    providerController.addListener(() {
      provider = providerController.text;
    });

    productController.addListener(() {
      product = productController.text;
    });
  }

  @override
  void dispose() {
    super.dispose();
    credentialsController.dispose();
    providerController.dispose();

    productController.dispose();
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<ContactViewModel>(context, listen: false).profil();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<RedeemViewModel>(context);
    var size = MediaQuery.of(context).size;

    providerController = TextEditingController(text: provider.toString());
    productController = TextEditingController(text: product.toString());
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 10) / 7;
    final double itemWidth = size.width / 2;
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Detail Redeem Paket')),
          backgroundColor: const Color(0xFF6372F6),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Consumer<ContactViewModel>(
              builder: (context, model, child) {
                var username = model.profileData?.data?.username;
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding:
                          const EdgeInsets.only(bottom: 8, left: 5, top: 10),
                      child: Text(
                        'Keterangan :',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${widget.category}',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          ' ${widget.descriptions}',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding:
                          const EdgeInsets.only(bottom: 8, left: 5, top: 10),
                      child: Text(
                        'No Hp',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: GetTextFormField(
                        controller: credentialsController,
                        hintName: 'Masukkan no hp anda',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          final user = User(username);
                          final submit = DataRedeem(
                            descriptions: widget.descriptions,
                            points: int.parse(widget.points),
                            user: user,
                            category: widget.category,
                            credentials: credentialsController.text,
                            provider: widget.provider,
                            denom: int.parse(widget.denom),
                            product: int.parse(widget.product),
                          );
                          if (credentialsController.text != '') {
                            await getProvider.redeem(submit);
                            Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const Success()));
                          } else {
                            const snackBar = SnackBar(
                              content: Text('Data tidak boleh kosong'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        } catch (e) {
                          if (e is DioError) {
                            if (e.response!.statusCode == 400) {
                              const snackBar = SnackBar(
                                content: Text('Data yang anda masukkan salah'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }
                        }
                      },
                      child: const Text('Submit'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFF6372F6)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                ' ${widget.provider}',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 2,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 5, right: 10),
                                child: Text(
                                  "${model.profileData?.data?.username}",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 2,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '${widget.points} Points',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 2,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                ' ${widget.product.toString()}',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 2,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Rp. ${widget.denom}',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 2,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        )));
  }
}

class Box2 extends StatefulWidget {
  const Box2({Key? key}) : super(key: key);

  @override
  State<Box2> createState() => _Box2State();
}

class _Box2State extends State<Box2> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<ContactViewModel>(context, listen: false).profil();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return (Consumer<ContactViewModel>(builder: (context, model, child) {
      // ignore: unused_local_variable
      var username = model.profileData?.data?.username;
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 5, right: 10),
            child: Text(
              "${model.profileData?.data?.username}",
              style: GoogleFonts.poppins(
                color: const Color(0xFF6372F6),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      );
    }));
  }
}
