import 'package:diversity_challenge/api_services.dart';
import 'package:diversity_challenge/models/manage_admins.dart';
import 'package:flutter/material.dart';

class AdminProvider with ChangeNotifier {

  bool isLoading = false;
  List<ManageAdminsModel>? _adminsList = [];
  List<ManageAdminsModel>? get allAdmins => _adminsList;

  void fetchAdmins(BuildContext context) {
    isLoading = true;
    APIServices().getAdmins(context).then((recipeList) {
      _adminsList = recipeList;
      isLoading = false;
      notifyListeners();
    }).catchError((onError) {
      isLoading = false;
      notifyListeners();
      print("$onError");
    });
  }
}
