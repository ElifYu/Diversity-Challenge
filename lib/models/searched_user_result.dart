// To parse this JSON data, do
//
//     final searchedUserResult = searchedUserResultFromJson(jsonString);

import 'dart:convert';

SearchedUserResult searchedUserResultFromJson(String str) => SearchedUserResult.fromJson(json.decode(str));

String searchedUserResultToJson(SearchedUserResult data) => json.encode(data.toJson());

class SearchedUserResult {
  SearchedUserResult({
    this.login,
    this.avatarUrl,
    this.createdAt,
    this.name,
  });

  String? login;
  String? avatarUrl;
  DateTime? createdAt;
  String? name;

  SearchedUserResult copyWith({
    String? login,
    String? avatarUrl,
    DateTime? createdAt,
    String? name,
  }) =>
      SearchedUserResult(
        login: login ?? this.login,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
      );

  factory SearchedUserResult.fromJson(Map<String, dynamic> json) => SearchedUserResult(
    login: json["login"],
    avatarUrl: json["avatar_url"],
    createdAt: DateTime.parse(json["created_at"]),
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "login": login,
    "avatar_url": avatarUrl,
    "created_at": createdAt!.toIso8601String(),
    "name": name,
  };
}
