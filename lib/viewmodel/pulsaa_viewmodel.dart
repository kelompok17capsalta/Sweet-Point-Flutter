import 'package:flutter/material.dart';
import 'package:kel17/model/data_pulsaa.dart';
import 'package:kel17/util/finite_state.dart';

import '../model/api/api_sweetpoint.dart';

class PulsaaViewModel extends ChangeNotifier {
  ApiPulsaa apiPulsaa = ApiPulsaa();
  List<Data> _data = [];
  List<Data> get data => _data;

  MyState myState = MyState.initial;

  Future pulsaa() async {
    try {
      myState = MyState.loading;
      notifyListeners();

      final pulsaa = await apiPulsaa.getDataPulsaa();
      _data = pulsaa.data!;

      myState = MyState.success;
      notifyListeners();
    } catch (e) {
      myState = MyState.failed;
      notifyListeners();
    }
  }
}
