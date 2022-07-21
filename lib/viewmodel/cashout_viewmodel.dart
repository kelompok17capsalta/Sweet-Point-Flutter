import 'package:flutter/material.dart';
import 'package:kel17/model/data_cashout.dart';
import 'package:kel17/util/finite_state.dart';

import '../model/api/api_sweetpoint.dart';

class CashOutViewModel extends ChangeNotifier {
  ApiCashOut apiCashOut = ApiCashOut();
  List<Data> _data = [];
  List<Data> get data => _data;

  MyState myState = MyState.initial;

  Future cashout() async {
    try {
      myState = MyState.loading;
      notifyListeners();

      final cashout = await apiCashOut.getDataCashOut();
      _data = cashout.data!;

      myState = MyState.success;
      notifyListeners();
    } catch (e) {
      myState = MyState.failed;
      notifyListeners();
    }
  }
}
