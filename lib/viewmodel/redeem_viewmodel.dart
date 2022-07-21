import 'package:flutter/material.dart';
import 'package:kel17/model/redeem/data_redeem.dart';
import 'package:kel17/model/redeem/resp_redeem.dart';
import '../model/api/api_sweetpoint.dart';

class RedeemViewModel extends ChangeNotifier {
  AuthRedeem authRedeem = AuthRedeem();
  DataRedeem? dataRedeem;
  DataRedeem? get redeemData => dataRedeem;

  RedeemViewModel() {
    ambilData();
  }

  Future<RespRedeem> redeem(DataRedeem dataRedeem) async {
    final redeem = await authRedeem.redeem(dataRedeem);
    return redeem;
  }

  void ambilData() async {
    notifyListeners();
  }
}
