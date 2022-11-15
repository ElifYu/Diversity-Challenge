import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:diversity_challenge/models/manage_admins.dart';
import 'package:diversity_challenge/models/searched_user_result.dart';
import 'package:diversity_challenge/services/github-tkn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class APIServices {
  Future<List<ManageAdminsModel>> getAdmins(context) async{
    try {
      String data = await DefaultAssetBundle.of(context).loadString("data/admins.json");
      return manageAdminModelFromJson(data);
    } on PlatformException catch (e) {
      print(e.message);
      throw Exception("Error");
    }
  }


  Future<List<ManageAdminsModel>> getModerators(context) async{
    try {
      String data = await DefaultAssetBundle.of(context).loadString("data/moderators.json");
      return manageAdminModelFromJson(data);
    } on PlatformException catch (e) {
      print(e.message);
      throw Exception("Error");
    }
  }


  Future<List<ManageAdminsModel>> getCoaches(context) async{
    try {
      String data = await DefaultAssetBundle.of(context).loadString("data/coaches.json");
      return manageAdminModelFromJson(data);
    } on PlatformException catch (e) {
      print(e.message);
      throw Exception("Error");
    }
  }

  static Future<SearchedUserResult> fetchSearchedUser(userName) async {
    try {
      Dio dio = Dio();
      dio.options.headers["authorization"] = "token ${GithubToken.githubToken}";
      final response = await dio.get("https://api.github.com/users/$userName");

      if (response.statusCode == 200) {
        return searchedUserResultFromJson(json.encode(response.data));
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        return SearchedUserResult();
      }
    } catch (error) {
      print(error);
      return SearchedUserResult();
    }
  }
}