import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kel17/component/bottom_bar.dart';
import 'package:kel17/component/scale.dart';
import 'package:kel17/page/Homepage.dart';

// class Success extends StatefulWidget {
//   const Success({Key? key}) : super(key: key);

//   @override
//   State<Success> createState() => _SuccessState();
// }

// class _SuccessState extends State<Success> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color(0xFF6372F6),
//         body: Stack(
//           children: [
//             Positioned(
//                 left: 350,
//                 height: 200,
//                 width: 200,
//                 child: Image.asset("assets/7.png")),
//             Column(
//               children: [
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 ScaleAnimations(
//                   child: Column(
//                     children: [
//                       Container(
//                         width: double.maxFinite,
//                         height: 450.0,
//                         decoration: const BoxDecoration(
//                           image: DecorationImage(
//                             image: ExactAssetImage("assets/sukses2.png"),
//                           ),
//                         ),
//                       ),
//                       Text(
//                         'Redeem Berhasil',
//                         style: GoogleFonts.poppins(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Positioned(
//                 top: 620,
//                 left: 250,
//                 height: 200,
//                 width: 200,
//                 child: Image.asset("assets/6.png")),
//           ],
//         ),
//       ),
//     );
//   }
// }

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ButtomBar()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF6372F6),
        body: Stack(
          children: [
            Positioned(
                left: 350,
                height: 200,
                width: 200,
                child: Image.asset("assets/7.png")),
            Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                ScaleAnimations(
                  child: Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: double.maxFinite,
                          height: 450.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: ExactAssetImage("assets/sukses2.png"),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                          child: Text(
                            'Redeem Berhasil',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                top: 620,
                left: 250,
                height: 200,
                width: 200,
                child: Image.asset("assets/6.png")),
          ],
        ),
      ),
    );
  }
}
