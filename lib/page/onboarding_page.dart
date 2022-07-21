import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kel17/page/register.dart';
import 'package:kel17/widget/button_widget.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: IntroductionScreen(
              pages: [
                PageViewModel(
                  title: 'Get More Benefits',
                  body:
                      'Shopping by using our application you will get many benefits',
                  image: buildImage('assets/a1.png'),
                  decoration: getPageDecoration(),
                ),
                PageViewModel(
                  title: 'Radeem Prizes Easily',
                  body:
                      'get a wide selection of radeem prizes for those of you who often use our application',
                  image: buildImage('assets/a2.png'),
                  decoration: getPageDecoration(),
                ),
                PageViewModel(
                  title: 'Always on customer service',
                  body:
                      'We have customer service who always helps you in troubleand you dont have to worry we are available within 24 hours for one week',
                  footer: ButtonWidget(
                    text: "Getting Started",
                    onClicked: () => goToHome(context),
                  ),
                  image: buildImage('assets/a3.png'),
                  decoration: getPageDecoration(),
                ),
              ],
              done: const Text(''),
              onDone: () => goToHome(context),
              showSkipButton: true,
              skip: const Text(''),
              onSkip: () => goToHome(context),
              next: const Text(''),
              dotsDecorator: getDotDecoration(),
              // ignore: avoid_print
              onChange: (index) => print(''),
              skipOrBackFlex: 0,
              nextFlex: 0,
            ),
          ),
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const Register()),
      );

  Widget buildImage(String path) => Image.asset(
        path,
        height: 320,
        width: double.maxFinite,
      );

  DotsDecorator getDotDecoration() => DotsDecorator(
        activeColor: const Color(0xFF6372F6),
        size: const Size(10, 10),
        activeSize: const Size(10, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: const TextStyle(
          // GoogleFonts.poppins(
          //   color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        bodyTextStyle: const TextStyle(fontSize: 20),
        bodyPadding: const EdgeInsets.all(85).copyWith(top: 15, bottom: 0),
        imagePadding: const EdgeInsets.all(35),
        contentMargin: const EdgeInsets.all(15).copyWith(bottom: 0),
      );
}
