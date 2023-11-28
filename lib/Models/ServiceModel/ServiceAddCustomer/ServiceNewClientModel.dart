import 'dart:convert';

class ServiceNewClientModel {
  bool status;
  Data data;
  String message;

  ServiceNewClientModel({
    required this.status,
    required this.data,
    required this.message,
  });

  ServiceNewClientModel copyWith({
    bool? status,
    Data? data,
    String? message,
  }) =>
      ServiceNewClientModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory ServiceNewClientModel.fromRawJson(String str) => ServiceNewClientModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceNewClientModel.fromJson(Map<String, dynamic> json) => ServiceNewClientModel(
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
  String name;
  String email;
  String password;
  String customerType;
  int buildingNo;
  String roomNo;
  int mobile;
  int altMobile;
  int whatsApp;
  int creditLimit;
  int creditDays;
  int creditInvoices;
  int gpse;
  int gpsn;
  String priceGroupId;
  String userType;
  String firstName;
  String createdBy;
  String status;
  int user;
  String pricegroup;
  String location;
  String staff;

  Data({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    required this.password,
    required this.customerType,
    required this.buildingNo,
    required this.roomNo,
    required this.mobile,
    required this.altMobile,
    required this.whatsApp,
    required this.creditLimit,
    required this.creditDays,
    required this.creditInvoices,
    required this.gpse,
    required this.gpsn,
    required this.priceGroupId,
    required this.userType,
    required this.firstName,
    required this.createdBy,
    required this.status,
    required this.user,
    required this.pricegroup,
    required this.location,
    required this.staff,
  });

  Data copyWith({
    int? id,
    String? username,
    String? name,
    String? email,
    String? password,
    String? customerType,
    int? buildingNo,
    String? roomNo,
    int? mobile,
    int? altMobile,
    int? whatsApp,
    int? creditLimit,
    int? creditDays,
    int? creditInvoices,
    int? gpse,
    int? gpsn,
    String? priceGroupId,
    String? userType,
    String? firstName,
    String? createdBy,
    String? status,
    int? user,
    String? pricegroup,
    String? location,
    String? staff,
  }) =>
      Data(
        id: id ?? this.id,
        username: username ?? this.username,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        customerType: customerType ?? this.customerType,
        buildingNo: buildingNo ?? this.buildingNo,
        roomNo: roomNo ?? this.roomNo,
        mobile: mobile ?? this.mobile,
        altMobile: altMobile ?? this.altMobile,
        whatsApp: whatsApp ?? this.whatsApp,
        creditLimit: creditLimit ?? this.creditLimit,
        creditDays: creditDays ?? this.creditDays,
        creditInvoices: creditInvoices ?? this.creditInvoices,
        gpse: gpse ?? this.gpse,
        gpsn: gpsn ?? this.gpsn,
        priceGroupId: priceGroupId ?? this.priceGroupId,
        userType: userType ?? this.userType,
        firstName: firstName ?? this.firstName,
        createdBy: createdBy ?? this.createdBy,
        status: status ?? this.status,
        user: user ?? this.user,
        pricegroup: pricegroup ?? this.pricegroup,
        location: location ?? this.location,
        staff: staff ?? this.staff,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    username: json["username"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    customerType: json["customer_type"],
    buildingNo: json["building_no"],
    roomNo: json["room_no"],
    mobile: json["mobile"],
    altMobile: json["alt_mobile"],
    whatsApp: json["whats_app"],
    creditLimit: json["credit_limit"],
    creditDays: json["credit_days"],
    creditInvoices: json["credit_invoices"],
    gpse: json["GPSE"],
    gpsn: json["GPSN"],
    priceGroupId: json["price_group_id"],
    userType: json["user_type"],
    firstName: json["first_name"],
    createdBy: json["created_by"],
    status: json["status"],
    user: json["user"],
    pricegroup: json["Pricegroup"],
    location: json["Location"],
    staff: json["staff"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "name": name,
    "email": email,
    "password": password,
    "customer_type": customerType,
    "building_no": buildingNo,
    "room_no": roomNo,
    "mobile": mobile,
    "alt_mobile": altMobile,
    "whats_app": whatsApp,
    "credit_limit": creditLimit,
    "credit_days": creditDays,
    "credit_invoices": creditInvoices,
    "GPSE": gpse,
    "GPSN": gpsn,
    "price_group_id": priceGroupId,
    "user_type": userType,
    "first_name": firstName,
    "created_by": createdBy,
    "status": status,
    "user": user,
    "Pricegroup": pricegroup,
    "Location": location,
    "staff": staff,
  };
}
