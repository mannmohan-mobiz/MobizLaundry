// To parse this JSON data, do
//
//     final searchClientModel = searchClientModelFromJson(jsonString);

import 'dart:convert';

SearchClientModel searchClientModelFromJson(String str) => SearchClientModel.fromJson(json.decode(str));

String searchClientModelToJson(SearchClientModel data) => json.encode(data.toJson());

class SearchClientModel {
  bool status;
  List<SearchClient> data;
  String message;

  SearchClientModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory SearchClientModel.fromJson(Map<String, dynamic> json) => SearchClientModel(
    status: json["status"],
    data: List<SearchClient>.from(json["data"].map((x) => SearchClient.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class SearchClient {
  String customerId;
  User user;
  String createdBy;
  DateTime createdDate;
  String name;
  String customerType;
  String buildingNo;
  String roomNo;
  String mobile;
  dynamic altMobile;
  String whatsApp;
  dynamic creditLimit;
  dynamic creditDays;
  dynamic creditInvoices;
  dynamic gpse;
  dynamic gpsn;
  String status;
  dynamic trn;
  dynamic billingAddrs;
  dynamic designation;
  String buildingName;
  String floorNumber;
  String flatNumber;
  dynamic altEmail;
  dynamic companyName;
  String staff;
  String location;
  String pricegroup;

  SearchClient({
    required this.customerId,
    required this.user,
    required this.createdBy,
    required this.createdDate,
    required this.name,
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
    required this.status,
    required this.trn,
    required this.billingAddrs,
    required this.designation,
    required this.buildingName,
    required this.floorNumber,
    required this.flatNumber,
    required this.altEmail,
    required this.companyName,
    required this.staff,
    required this.location,
    required this.pricegroup,
  });

  factory SearchClient.fromJson(Map<String, dynamic> json) => SearchClient(
    customerId: json["customer_id"],
    user: User.fromJson(json["user"]),
    createdBy: json["created_by"],
    createdDate: DateTime.parse(json["created_date"]),
    name: json["name"],
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
    status: json["status"],
    trn: json["TRN"],
    billingAddrs: json["billing_addrs"],
    designation: json["designation"],
    buildingName: json["building_name"],
    floorNumber: json["floor_number"],
    flatNumber: json["flat_number"],
    altEmail: json["alt_email"],
    companyName: json["company_name"],
    staff: json["staff"],
    location: json["Location"],
    pricegroup: json["Pricegroup"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "user": user.toJson(),
    "created_by": createdBy,
    "created_date": createdDate.toIso8601String(),
    "name": name,
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
    "status": status,
    "TRN": trn,
    "billing_addrs": billingAddrs,
    "designation": designation,
    "building_name": buildingName,
    "floor_number": floorNumber,
    "flat_number": flatNumber,
    "alt_email": altEmail,
    "company_name": companyName,
    "staff": staff,
    "Location": location,
    "Pricegroup": pricegroup,
  };
}

class User {
  String username;
  String email;

  User({
    required this.username,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json["username"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "email": email,
  };
}
