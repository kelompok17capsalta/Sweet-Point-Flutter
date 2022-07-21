// ignore_for_file: deprecated_member_use

import 'dart:math' as math;

import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kel17/component/util.dart';

class QnA extends StatefulWidget {
  const QnA({Key? key}) : super(key: key);

  @override
  _QnAState createState() => _QnAState();
}

class _QnAState extends State<QnA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Support')),
        backgroundColor: const Color(0xFF6372F6),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Center(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(
                    'Pertanyaan yang paling populer, temukan jawabanmu disini.',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const card1(),
              const card2(),
              const card3(),
              const card4(),
              const card5(),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                child: Text(
                  'Masih tidak menemukan pertanyaanmu?',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(
                    'Silahkan tulis keresahan kamu, jangan takut untuk bertanya. seperti pepatah malu bertanya sesat dijalan, pertanyaan kamu akan kami balas, namun mohon ditunggu ya.',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(
                    'Jangan khawatir, kami akan segera membantu keresahanmu dan keresahanmu akan hilang dalam sekejap.',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              buildProfile(),
              buildDesc(),
              Buildkirim()
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class card1 extends StatelessWidget {
  const card1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF6372F6),
      child: ExpansionWidget(
          initiallyExpanded: true,
          titleBuilder:
              (double animationValue, _, bool isExpaned, toogleFunction) {
            return InkWell(
                onTap: () => toogleFunction(animated: true),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Bagaimana cara mengubah kata sandi',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: math.pi * animationValue / 2,
                        child: const Icon(
                          Icons.arrow_right,
                          size: 40,
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                ));
          },
          content: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Text(
              'Halaman profile - edit profile - ubah kata sandi - konfirmasi kata sandi - tekan tombol selesai',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
    );
  }
}

// ignore: camel_case_types
class card2 extends StatelessWidget {
  const card2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF4DA9FF),
      child: ExpansionWidget(
          initiallyExpanded: true,
          titleBuilder:
              (double animationValue, _, bool isExpaned, toogleFunction) {
            return InkWell(
                onTap: () => toogleFunction(animated: true),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Bagaimana cara mengubah kata sandi',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: math.pi * animationValue / 2,
                        child: const Icon(
                          Icons.arrow_right,
                          size: 40,
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                ));
          },
          content: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Text(
              'Halaman profile - edit profile - ubah kata sandi - konfirmasi kata sandi - tekan tombol selesai',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
    );
  }
}

// ignore: camel_case_types
class card3 extends StatelessWidget {
  const card3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF80D0C7),
      child: ExpansionWidget(
          initiallyExpanded: true,
          titleBuilder:
              (double animationValue, _, bool isExpaned, toogleFunction) {
            return InkWell(
                onTap: () => toogleFunction(animated: true),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Bagaimana cara mengubah kata sandi',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: math.pi * animationValue / 2,
                        child: const Icon(
                          Icons.arrow_right,
                          size: 40,
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                ));
          },
          content: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Text(
              'Halaman profile - edit profile - ubah kata sandi - konfirmasi kata sandi - tekan tombol selesai',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
    );
  }
}

// ignore: camel_case_types
class card4 extends StatelessWidget {
  const card4({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF91B3FA),
      child: ExpansionWidget(
          initiallyExpanded: true,
          titleBuilder:
              (double animationValue, _, bool isExpaned, toogleFunction) {
            return InkWell(
                onTap: () => toogleFunction(animated: true),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Bagaimana cara mengubah kata sandi',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: math.pi * animationValue / 2,
                        child: const Icon(
                          Icons.arrow_right,
                          size: 40,
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                ));
          },
          content: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Text(
              'Halaman profile - edit profile - ubah kata sandi - konfirmasi kata sandi - tekan tombol selesai',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
    );
  }
}

// ignore: camel_case_types
class card5 extends StatelessWidget {
  const card5({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFE766A),
      child: ExpansionWidget(
          initiallyExpanded: true,
          titleBuilder:
              (double animationValue, _, bool isExpaned, toogleFunction) {
            return InkWell(
                onTap: () => toogleFunction(animated: true),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Bagaimana cara mengubah kata sandi',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: math.pi * animationValue / 2,
                        child: const Icon(
                          Icons.arrow_right,
                          size: 40,
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                ));
          },
          content: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Text(
              'Halaman profile - edit profile - ubah kata sandi - konfirmasi kata sandi - tekan tombol selesai',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
    );
  }
}

Widget buildProfile() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Profil Kamu :',
        style: kLabelStyle,
      ),
      const SizedBox(height: 10.0),
      Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 50.0,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(
            color: Color.fromARGB(255, 105, 92, 92),
            fontFamily: 'poppins',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(top: 14.0),
            hintText: 'Namaku@gmail.com',
            hintStyle: kHintTextStyle,
            prefixIcon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget buildDesc() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Profil Kamu :',
        style: kLabelStyle,
      ),
      const SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        margin: const EdgeInsets.all(10),
        height: 150.0,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(
            color: Color.fromARGB(255, 105, 92, 92),
            fontFamily: 'poppins',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(top: 14.0),
            hintText: 'Namaku@gmail.com',
            hintStyle: kHintTextStyle,
            prefixIcon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
        ),
      ),
    ],
  );
}

// ignore: non_constant_identifier_names
Widget Buildkirim() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 25.0),
    width: 180,
    child: RaisedButton(
      elevation: 5.0,
      // ignore: avoid_print
      onPressed: () => print('Login Button Pressed'),
      padding: const EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: const Color(0xFF6372F6),
      child: Text(
        'Kirim',
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}
