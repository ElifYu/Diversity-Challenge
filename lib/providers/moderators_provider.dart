import 'package:diversity_challenge/api_services.dart';
import 'package:diversity_challenge/models/manage_admins.dart';
import 'package:flutter/material.dart';

class ModeratorsProvider with ChangeNotifier {

  bool isLoading = false;
  List<ManageAdminsModel>? _moderatorsList = [];
  List<ManageAdminsModel>? get allModerators => _moderatorsList;

  void fetchModerators(BuildContext context) {
    isLoading = true;
    APIServices().getModerators(context).then((recipeList) {
      _moderatorsList = recipeList;
      isLoading = false;
      notifyListeners();
    }).catchError((onError) {
      isLoading = false;
      notifyListeners();
      print("$onError");
    });
  }
}