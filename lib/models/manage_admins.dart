import 'dart:convert';

List<ManageAdminsModel> manageAdminModelFromJson(String str) => List<ManageAdminsModel>.from(json.decode(str).map((x) => ManageAdminsModel.fromJson(x)));

String manageAdminModelToJson(List<ManageAdminsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ManageAdminsModel {
  ManageAdminsModel({
     this.userName,
     this.userDate,
     this.userImage,
  });

  String? userName;
  String? userDate;
  String? userImage;

  ManageAdminsModel copyWith({
    String? userName,
    String? userDate,
    String? userImage,
  }) =>
      ManageAdminsModel(
        userName: userName ?? this.userName,
        userDate: userDate ?? this.userDate,
        userImage: userImage ?? this.userImage,
      );

  factory ManageAdminsModel.fromJson(Map<String, dynamic> json) => ManageAdminsModel(
    userName: json["userName"],
    userDate: json["userDate"],
    userImage: json["userImage"],
  );

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "userDate": userDate,
    "userImage": userImage,
  };
}
