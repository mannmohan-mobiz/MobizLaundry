import 'dart:convert';

class AuthModel {
  bool status;
  Data data;
  String message;

  AuthModel({
    required this.status,
    required this.data,
    required this.message,
  });

  AuthModel copyWith({
    bool? status,
    Data? data,
    String? message,
  }) =>
      AuthModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory AuthModel.fromRawJson(String str) => AuthModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  int id;
  String username;
  String userType;
  String tokEn;

  Data({
    required this.id,
    required this.username,
    required this.userType,
    required this.tokEn,
  });

  Data copyWith({
    int? id,
    String? username,
    String? userType,
    String? tokEn,
  }) =>
      Data(
        id: id ?? this.id,
        username: username ?? this.username,
        userType: userType ?? this.userType,
        tokEn: tokEn ?? this.tokEn,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());


  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    username: json["username"],
    userType: json["user_type"],
    tokEn: json["tok_en"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "user_type": userType,
    "tok_en": tokEn,
  };

}
