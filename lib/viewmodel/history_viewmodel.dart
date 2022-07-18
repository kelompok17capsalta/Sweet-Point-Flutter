import 'package:flutter/material.dart';
import 'package:kel17/model/data_history.dart';

import '../model/api/api_sweetpoint.dart';

class HistoryViewModel extends ChangeNotifier {
  ApiHistory apiHistory = ApiHistory();
  DataHistory? dataHistory;
  DataHistory? get historyData => dataHistory;

  histori() async {
    final history = await apiHistory.getDataHistory();
    dataHistory = history;

    notifyListeners();
  }
}
