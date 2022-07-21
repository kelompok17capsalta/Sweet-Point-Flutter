import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailToko extends StatefulWidget {
  const DetailToko({Key? key}) : super(key: key);

  @override
  _DetailTokoState createState() => _DetailTokoState();
}

class _DetailTokoState extends State<DetailToko> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Adidas')),
        backgroundColor: const Color(0xFF6372F6),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Box(),
              Container(
                width: double.maxFinite,
                height: 610,
                alignment: AlignmentDirectional.bottomCenter,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage("assets/8.png"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Box extends StatelessWidget {
  const Box({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 216, 227, 252),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Kamu akan di arahkan ke Adidas Store.',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            width: 150,
            height: 150.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage("assets/a.png"),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Cashback hingga 100 point',
              style: GoogleFonts.poppins(
                color: const Color(0xFF6372F6),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
