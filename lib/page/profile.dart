import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kel17/page/detail_toko.dart';
import 'package:kel17/page/loginn.dart';
import 'package:kel17/page/settings.dart';
import 'package:kel17/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
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
        backgroundColor: Color.fromARGB(255, 216, 227, 252),
        appBar: AppBar(
          title: Center(child: Text('Profile')),
          backgroundColor: Color(0xFF6372F6),
        ),
        body: (Consumer<ContactViewModel>(
          builder: (context, model, child) {
            return Container(
              // padding: EdgeInsets.only(left: 16, top: 25, right: 16),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Column(
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 130,
                            height: 130,
                            padding: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 4,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      color: Colors.black.withOpacity(0.1),
                                      offset: Offset(0, 10))
                                ],
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                                    ))),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Box(),
                    SizedBox(
                      height: 10,
                    ),
                    Box1(),
                    SizedBox(
                      height: 10,
                    ),
                    Box2(),
                    SizedBox(
                      height: 10,
                    ),
                    Box3(),
                    SizedBox(
                      height: 10,
                    ),
                    Box4(),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          onPressed: () {
                            Loginn();
                          },
                          color: Color(0xFF6372F6),
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "LogOut",
                            style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 2.2,
                                color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                ),
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
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
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
            margin: EdgeInsets.only(top: 5),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 5, left: 10),
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
                  padding: EdgeInsets.only(top: 5, right: 10),
                  child: Text(
                    "${model.profileData?.data?.username}",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF6372F6),
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
            margin: EdgeInsets.only(top: 5),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 5, left: 10),
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
                  padding: EdgeInsets.only(top: 5, right: 10),
                  child: Text(
                    "${model.profileData?.data?.email}",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF6372F6),
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
            margin: EdgeInsets.only(top: 5),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 5, left: 10),
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
                  padding: EdgeInsets.only(top: 5, right: 10),
                  child: Text(
                    "${model.profileData?.data?.address}",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF6372F6),
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
            margin: EdgeInsets.only(top: 5),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 5, left: 10),
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
                  padding: EdgeInsets.only(top: 5, right: 10),
                  child: Text(
                    "${model.profileData?.data?.phone}",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF6372F6),
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
            margin: EdgeInsets.only(top: 5),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 5, left: 10),
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
                  padding: EdgeInsets.only(top: 5, right: 10),
                  child: Text(
                    "${model.profileData?.data?.point}",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF6372F6),
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
