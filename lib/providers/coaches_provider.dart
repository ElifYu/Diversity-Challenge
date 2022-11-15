import 'package:diversity_challenge/api_services.dart';
import 'package:diversity_challenge/models/manage_admins.dart';
import 'package:flutter/material.dart';

class CoachesProvider with ChangeNotifier {

  bool isLoading = false;
  List<ManageAdminsModel>? _coachesList = [];
  List<ManageAdminsModel>? get allCoaches => _coachesList;

  void fetchCoaches(BuildContext context) {
    isLoading = true;
    APIServices().getCoaches(context).then((recipeList) {
      _coachesList = recipeList;
      isLoading = false;
      notifyListeners();
    }).catchError((onError) {
      isLoading = false;
      notifyListeners();
      print("$onError");
    });
  }
}
