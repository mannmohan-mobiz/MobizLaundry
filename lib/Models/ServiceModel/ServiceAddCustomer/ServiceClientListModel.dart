import 'dart:convert';

class ServiceClientListModel {
  bool status;
  List<ClientList> data;
  String message;

  ServiceClientListModel({
    required this.status,
    required this.data,
    required this.message,
  });

  ServiceClientListModel copyWith({
    bool? status,
    List<ClientList>? data,
    String? message,
  }) =>
      ServiceClientListModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory ServiceClientListModel.fromRawJson(String str) => ServiceClientListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceClientListModel.fromJson(Map<String, dynamic> json) => ServiceClientListModel(
    status: json["status"],
    data: List<ClientList>.from(json["data"].map((x) => ClientList.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class ClientList {
  String customerId;
  String name;
  String customerType;
  User user;

  ClientList({
    required this.customerId,
    required this.name,
    required this.customerType,
    required this.user,
  });

  ClientList copyWith({
    String? customerId,
    String? name,
    String? customerType,
    User? user,
  }) =>
      ClientList(
        customerId: customerId ?? this.customerId,
        name: name ?? this.name,
        customerType: customerType ?? this.customerType,
        user: user ?? this.user,
      );

  factory ClientList.fromRawJson(String str) => ClientList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ClientList.fromJson(Map<String, dynamic> json) => ClientList(
    customerId: json["customer_id"],
    name: json["name"],
    customerType: json["customer_type"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "name": name,
    "customer_type": customerType,
    "user": user.toJson(),
  };
}

class User {
  String username;
  String email;

  User({
    required this.username,
    required this.email,
  });

  User copyWith({
    String? username,
    String? email,
  }) =>
      User(
        username: username ?? this.username,
        email: email ?? this.email,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json["username"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "email": email,
  };
}
