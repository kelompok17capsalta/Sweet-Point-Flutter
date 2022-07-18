import 'package:flutter/material.dart';
import 'package:kel17/model/data_paket.dart';
import 'package:kel17/util/finite_state.dart';

import '../model/api/api_sweetpoint.dart';

class PaketViewModel extends ChangeNotifier {
  ApiPaket apiPaket = ApiPaket();
  List<Data> _data = [];
  List<Data> get data => _data;

  MyState myState = MyState.initial;

  Future paket() async {
    try {
      myState = MyState.loading;
      notifyListeners();

      final paket = await apiPaket.getDataPaket();
      _data = paket.data!;

      myState = MyState.success;
      notifyListeners();
    } catch (e) {
      myState = MyState.failed;
      notifyListeners();
    }
  }
}
