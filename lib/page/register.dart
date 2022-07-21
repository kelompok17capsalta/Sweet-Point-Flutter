import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kel17/component/genTextFormField.dart';
import 'package:kel17/model/register/data_regis.dart';
import 'package:kel17/page/coba.dart';
import 'package:kel17/page/loginn.dart';
import 'package:kel17/viewmodel/regis_viewmodel.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  // final Function(DataRegis) onCreate;
  const Register({
    Key? key,
    // required this.onCreate,
  }) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  String nama = '';
  String username = '';
  String email = '';
  String password = '';
  String address = '';
  String phone = '';

  @override
  void initState() {
    super.initState();
    namaController.addListener(() {
      nama = namaController.text;
    });
    usernameController.addListener(() {
      username = usernameController.text;
    });
    emailController.addListener(() {
      email = emailController.text;
    });
    passwordController.addListener(() {
      password = passwordController.text;
    });
    addressController.addListener(() {
      address = addressController.text;
    });
    phoneController.addListener(() {
      phone = phoneController.text;
    });
  }

  @override
  void dispose() {
    super.dispose();
    namaController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    addressController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<RegisViewModel>(context);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(bottom: 8, left: 5),
                      child: Text(
                        'Full Name',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: GetTextFormField(
                        controller: namaController,
                        hintName: 'Name',
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(bottom: 8, left: 5),
                  child: Text(
                    'Username',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: GetTextFormField(
                    controller: usernameController,
                    hintName: 'Username',
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(bottom: 8, left: 5),
                  child: Text(
                    'Email',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: GetTextFormField(
                    controller: emailController,
                    hintName: 'Email',
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(bottom: 8, left: 5),
                  child: Text(
                    'Password',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: GetText(
                    controller: passwordController,
                    hintName: 'Password',
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(bottom: 8, left: 5),
                  child: Text(
                    'Address',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: GetTextFormField(
                    controller: addressController,
                    hintName: 'Address',
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(bottom: 8, left: 5),
                  child: Text(
                    'Phone',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: GetTextFormField(
                    controller: phoneController,
                    hintName: 'Phone',
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      final submit = DataRegis(
                          email: emailController.text,
                          name: namaController.text,
                          password: passwordController.text,
                          username: usernameController.text,
                          address: addressController.text,
                          phone: usernameController.text);
                      final regis = await getProvider.regis(submit);
                      // ignore: avoid_print
                      print(regis);
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const Loginn()));
                    } catch (e) {
                      if (e is DioError) {
                        if (e.response!.statusCode == 400) {
                          const snackBar = SnackBar(
                            content: Text(
                                'Username atau email anda sudah terdaftar'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                  margin: const EdgeInsets.only(top: 15),
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const Loginn()));
                    },
                    child: const Text('Already Have Account? Login'),
                  ),
                ),
              ])),
        ),
      ),
    ));
  }
}
