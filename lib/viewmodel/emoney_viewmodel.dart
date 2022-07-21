import 'package:flutter/material.dart';
import 'package:kel17/util/finite_state.dart';

import '../model/api/api_sweetpoint.dart';
import '../model/data_emoney.dart';

class EmoneyViewModel extends ChangeNotifier {
  ApiEmoney apiEmoney = ApiEmoney();
  List<Data> _data = [];
  List<Data> get data => _data;

  MyState myState = MyState.initial;

  Future emoney() async {
    try {
      myState = MyState.loading;
      notifyListeners();

      final emoney = await apiEmoney.getDataEmoney();
      _data = emoney.data!;

      myState = MyState.success;
      notifyListeners();
    } catch (e) {
      myState = MyState.failed;
      notifyListeners();
    }
  }
}
