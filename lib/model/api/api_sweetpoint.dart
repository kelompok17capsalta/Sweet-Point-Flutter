// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:kel17/constant/pref_key.dart';
import 'package:kel17/model/data_cashout.dart';
import 'package:kel17/model/data_emoney.dart';
import 'package:kel17/model/data_history.dart';
import 'package:kel17/model/data_paket.dart';
import 'package:kel17/model/data_pulsa.dart';
import 'package:kel17/model/data_pulsaa.dart';
import 'package:kel17/model/login/data_login.dart';
import 'package:kel17/model/login/resp_login.dart';
import 'package:kel17/model/profile.dart/data_profile.dart';
import 'package:kel17/model/redeem/data_redeem.dart';
import 'package:kel17/model/redeem/resp_redeem.dart';
import 'package:kel17/model/register/data_regis.dart';
import 'package:kel17/model/register/resp_regis.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthAPI {
  final _dio = Dio();
  final _baseUrl = "http://54.215.199.62/v1";
  Future register(DataRegis dataRegis) async {
    try {
      Response response = await _dio.post('$_baseUrl/auth/register', data: {
        "email": dataRegis.email,
        "username": dataRegis.username,
        "password": dataRegis.password,
        "name": dataRegis.name,
        "address": dataRegis.address,
        "phone": dataRegis.phone
      });

      final mapJson = RespRegis.fromJson(response.data);
      print(response.data);
      return mapJson;
    } on DioError catch (e) {
      print(e.response!.statusCode);
      throw Exception(e);
    }
  }
}

class AuthLogin {
  final _dio = Dio();
  final _baseUrl = "http://54.215.199.62/v1";
  Future<RespLogin> login(DataLogin dataLogin) async {
    try {
      Response response = await _dio.post('$_baseUrl/auth/login', data: {
        "username": dataLogin.username,
        "password": dataLogin.password
      });
      final mapJson = RespLogin.fromJson(response.data);
      // print(response.data);
      return mapJson;
    } on DioError catch (e) {
      print(e.response!.statusCode);
      rethrow;
    }
  }
}

class AuthRedeem {
  SharedPreferences? preferences;
  final _dio = Dio();
  final _baseUrl = "http://54.215.199.62/v1";
  Future<RespRedeem> redeem(DataRedeem dataRedeem) async {
    try {
      preferences = await SharedPreferences.getInstance();
      final String? token = preferences!.getString(PrefKey.token);
      _dio.options.headers['content-Type'] = 'application/json';
      // ignore: unnecessary_brace_in_string_interps
      _dio.options.headers["Authorization"] = "Bearer ${token}";
      Response response = await _dio.post('$_baseUrl/transaction/new', data: {
        "descriptions": dataRedeem.descriptions,
        "points": dataRedeem.points,
        "user": dataRedeem.user,
        "category": dataRedeem.category,
        "credentials": dataRedeem.credentials,
        "provider": dataRedeem.provider,
        "denom": dataRedeem.denom,
        "product": dataRedeem.product
      });
      final mapJson = RespRedeem.fromJson(response.data);
      print(response.data);
      return mapJson;
    } on DioError catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }
}

class AuthProfile {
  SharedPreferences? preferences;

  final _dio = Dio();
  final _baseUrl = "http://54.215.199.62/v1";
  Future<DataProfile> profile() async {
    try {
      preferences = await SharedPreferences.getInstance();
      final String? token = preferences!.getString(PrefKey.token);
      _dio.options.headers['content-Type'] = 'application/json';
      // ignore: unnecessary_brace_in_string_interps
      _dio.options.headers["Authorization"] = "Bearer ${token}";
      Response response = await _dio.get('$_baseUrl/auth/info');
      final mapJson = DataProfile.fromJson(response.data);
      // print(response.data);
      return mapJson;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}

class ApiPulsa {
  Future<DataPulsa> getDataPulsa() async {
    Response response = await Dio().get('http://54.215.199.62/v1/product/');

    // print(response.data);
    return DataPulsa.fromJson(response.data);
  }
}

class ApiPaket {
  Future<DataPaket> getDataPaket() async {
    try {
      Response response =
          await Dio().get('http://54.215.199.62/v1/product/paketdata');

      // print(response.data);
      return DataPaket.fromJson(response.data);
    } on DioError {
      rethrow;
    }
  }
}

class ApiCashOut {
  Future<DataCashOut> getDataCashOut() async {
    try {
      Response response =
          await Dio().get('http://54.215.199.62/v1/product/cashout');

      // print(response.data);
      return DataCashOut.fromJson(response.data);
    } on DioError {
      rethrow;
    }
  }
}

class ApiPulsaa {
  Future<DataPulsaa> getDataPulsaa() async {
    try {
      Response response =
          await Dio().get('http://54.215.199.62/v1/product/pulsa');

      // print(response.data);
      return DataPulsaa.fromJson(response.data);
    } on DioError {
      rethrow;
    }
  }
}

class ApiEmoney {
  Future<DataEmoney> getDataEmoney() async {
    try {
      Response response =
          await Dio().get('http://54.215.199.62/v1/product/emoney');

      // print(response.data);
      return DataEmoney.fromJson(response.data);
    } on DioError {
      rethrow;
    }
  }
}

class ApiHistory {
  SharedPreferences? preferences;

  final _dio = Dio();
  final _baseUrl = "http://54.215.199.62/v1";
  Future<DataHistory> getDataHistory() async {
    try {
      preferences = await SharedPreferences.getInstance();
      final String? token = preferences!.getString(PrefKey.token);
      _dio.options.headers['content-Type'] = 'application/json';
      // ignore: unnecessary_brace_in_string_interps
      _dio.options.headers["Authorization"] = "Bearer ${token}";
      Response response = await _dio.get('$_baseUrl/transaction/user/');
      final mapJson = DataHistory.fromJson(response.data);
      // print(response.data);
      return mapJson;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
