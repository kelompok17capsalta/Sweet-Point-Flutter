import 'package:flutter/material.dart';
import 'package:kel17/page/success.dart';
import 'package:kel17/page/welcome.dart';
import 'package:kel17/viewmodel/cashout_viewmodel.dart';
import 'package:kel17/viewmodel/emoney_viewmodel.dart';
import 'package:kel17/viewmodel/history_viewmodel.dart';
import 'package:kel17/viewmodel/login_viewmodel.dart';
import 'package:kel17/viewmodel/paket_viewmodel.dart';
import 'package:kel17/viewmodel/pulsa_viewmodel.dart';
import 'package:kel17/viewmodel/pulsaa_viewmodel.dart';
import 'package:kel17/viewmodel/redeem_viewmodel.dart';
import 'package:kel17/viewmodel/regis_viewmodel.dart';
import 'package:kel17/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ContactViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => PulsaViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => LoginViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => RegisViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => PaketViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => HistoryViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => RedeemViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => CashOutViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => PulsaaViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => EmoneyViewModel(),
          ),
        ],
        child: const MaterialApp(
            debugShowCheckedModeBanner: false, home: WelcomePage()));
  }
}
