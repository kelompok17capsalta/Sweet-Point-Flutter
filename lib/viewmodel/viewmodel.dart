import 'package:flutter/material.dart';
import 'package:kel17/model/profile.dart/data_profile.dart' as profile;
import '../model/api/api_sweetpoint.dart';

class ContactViewModel extends ChangeNotifier {
  AuthProfile authProfile = AuthProfile();
  profile.DataProfile? dataProfile;
  profile.DataProfile? get profileData => dataProfile;

  profil() async {
    final profile = await authProfile.profile();
    dataProfile = profile;

    notifyListeners();
  }
}
