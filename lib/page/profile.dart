import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kel17/page/loginn.dart';
import 'package:kel17/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      // Provider.of<ContactViewModel>(context, listen: false).profile();
    });
    super.didChangeDependencies();
  }

  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 216, 227, 252),
        appBar: AppBar(
          title: const Center(child: Text('Profile')),
          backgroundColor: const Color(0xFF6372F6),
        ),
        body: (Consumer<ContactViewModel>(
          builder: (context, model, child) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              CircleAvatar(
                                child: Text(
                                  ' ${model.profileData?.data?.username![0]}',
                                  style: GoogleFonts.poppins(
                                    color: Colors.purple,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                radius: 55,
                                backgroundColor:
                                    Color.fromARGB(255, 236, 187, 245),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Box(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Box1(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Box2(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Box3(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Box4(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const Loginn()));
                        },
                        child: const Text('Log Out'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF6372F6)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        )));
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}

class Box extends StatefulWidget {
  const Box({Key? key}) : super(key: key);

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
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
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5),
            height: 50,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 5, left: 10),
                  child: Text(
                    "Username",
                    // "sasa",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
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
            ),
          ),
        ],
      );
    }));
  }
}

class Box1 extends StatefulWidget {
  const Box1({Key? key}) : super(key: key);

  @override
  State<Box1> createState() => _Box1State();
}

class _Box1State extends State<Box1> {
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
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5),
            height: 50,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 5, left: 10),
                  child: Text(
                    "Email",
                    // "sasa",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5, right: 10),
                  child: Text(
                    "${model.profileData?.data?.email}",
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF6372F6),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }));
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
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5),
            height: 50,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 5, left: 10),
                  child: Text(
                    "Alamat",
                    // "sasa",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5, right: 10),
                  child: Text(
                    "${model.profileData?.data?.address}",
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF6372F6),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }));
  }
}

class Box3 extends StatefulWidget {
  const Box3({Key? key}) : super(key: key);

  @override
  State<Box3> createState() => _Box3State();
}

class _Box3State extends State<Box3> {
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
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5),
            height: 50,
            width: double.infinity,
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 5, left: 10),
                  child: Text(
                    "Nomor Telepon",
                    // "sasa",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5, right: 10),
                  child: Text(
                    "${model.profileData?.data?.phone}",
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF6372F6),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }));
  }
}

class Box4 extends StatefulWidget {
  const Box4({Key? key}) : super(key: key);

  @override
  State<Box4> createState() => _Box4State();
}

class _Box4State extends State<Box4> {
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
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5),
            height: 50,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 5, left: 10),
                  child: Text(
                    "Point",
                    // "sasa",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5, right: 10),
                  child: Text(
                    "${model.profileData?.data?.point}",
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF6372F6),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }));
  }
}
