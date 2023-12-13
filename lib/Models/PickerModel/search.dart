// To parse this JSON data, do
//
//     final search = searchFromJson(jsonString);

import 'dart:convert';

Search searchFromJson(String str) => Search.fromJson(json.decode(str));

String searchToJson(Search data) => json.encode(data.toJson());

class Search {
  bool status;
  List<CustomerData> data;
  String message;

  Search({
    required this.status,
    required this.data,
    required this.message,
  });

  factory Search.fromJson(Map<String, dynamic> json) => Search(
    status: json["status"],
    data: (json["data"] != null) ? List<CustomerData>.from(json["data"].map((x) => CustomerData.fromJson(x))) : [],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class CustomerData {
  String customerId;
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
  dynamic buildingName;
  dynamic floorNumber;
  dynamic flatNumber;
  int user;
  String staff;
  String location;
  String pricegroup;

  CustomerData({
    required this.customerId,
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
    required this.user,
    required this.staff,
    required this.location,
    required this.pricegroup,
  });

  factory CustomerData.fromJson(Map<String, dynamic> json) => CustomerData(
    customerId: json["customer_id"],
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
    user: json["user"],
    staff: json["staff"],
    location: json["Location"],
    pricegroup: json["Pricegroup"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
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
    "user": user,
    "staff": staff,
    "Location": location,
    "Pricegroup": pricegroup,
  };
}
