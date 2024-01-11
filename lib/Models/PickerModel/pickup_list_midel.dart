// To parse this JSON data, do
//
//     final pickerPickupListModel = pickerPickupListModelFromJson(jsonString);

import 'dart:convert';

PickerPickupListModel pickerPickupListModelFromJson(String str) => PickerPickupListModel.fromJson(json.decode(str));

String pickerPickupListModelToJson(PickerPickupListModel data) => json.encode(data.toJson());

class PickerPickupListModel {
  bool status;
  List<PckPickupList> data;
  String message;

  PickerPickupListModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory PickerPickupListModel.fromJson(Map<String, dynamic> json) => PickerPickupListModel(
    status: json["status"],
    data: List<PckPickupList>.from(json["data"].map((x) => PckPickupList.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class PckPickupList {
  String orderId;
  String orderNumber;
  DateTime pickupDate;
  String pickupTime;
  OrderType orderType;
  DateTime orderDate;
  Customer customer;

  PckPickupList({
    required this.orderId,
    required this.orderNumber,
    required this.pickupDate,
    required this.pickupTime,
    required this.orderType,
    required this.orderDate,
    required this.customer,
  });

  factory PckPickupList.fromJson(Map<String, dynamic> json) => PckPickupList(
    orderId: json["order_id"],
    orderNumber: json["order_number"],
    pickupDate: DateTime.parse(json["pickup_date"]),
    pickupTime: json["pickup_time"],
    orderType: orderTypeValues.map[json["order_type"]]!,
    orderDate: DateTime.parse(json["order_date"]),
    customer: Customer.fromJson(json["customer"]),
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "order_number": orderNumber,
    "pickup_date": "${pickupDate.year.toString().padLeft(4, '0')}-${pickupDate.month.toString().padLeft(2, '0')}-${pickupDate.day.toString().padLeft(2, '0')}",
    "pickup_time": pickupTime,
    "order_type": orderTypeValues.reverse[orderType],
    "order_date": "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
    "customer": customer.toJson(),
  };
}

class Customer {
  String customerId;
  User user;
  CreatedBy createdBy;
  DateTime createdDate;
  Name name;
  CustomerType customerType;
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
  Status status;
  dynamic trn;
  dynamic billingAddrs;
  dynamic designation;
  dynamic buildingName;
  dynamic floorNumber;
  dynamic flatNumber;
  dynamic altEmail;
  dynamic companyName;
  String staff;
  String location;
  String pricegroup;

  Customer({
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

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    customerId: json["customer_id"],
    user: User.fromJson(json["user"]),
    createdBy: createdByValues.map[json["created_by"]]!,
    createdDate: DateTime.parse(json["created_date"]),
    name: nameValues.map[json["name"]]!,
    customerType: customerTypeValues.map[json["customer_type"]]!,
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
    status: statusValues.map[json["status"]]!,
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
    "created_by": createdByValues.reverse[createdBy],
    "created_date": createdDate.toIso8601String(),
    "name": nameValues.reverse[name],
    "customer_type": customerTypeValues.reverse[customerType],
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
    "status": statusValues.reverse[status],
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

enum CreatedBy {
  MOBIZ
}

final createdByValues = EnumValues({
  "mobiz": CreatedBy.MOBIZ
});

enum CustomerType {
  HOME
}

final customerTypeValues = EnumValues({
  "Home": CustomerType.HOME
});

enum Name {
  DEEPESH_GEORGE
}

final nameValues = EnumValues({
  "Deepesh George": Name.DEEPESH_GEORGE
});

enum Status {
  ACTIVE
}

final statusValues = EnumValues({
  "Active": Status.ACTIVE
});

class User {
  String username;
  Email email;

  User({
    required this.username,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json["username"],
    email: emailValues.map[json["email"]]!,
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "email": emailValues.reverse[email],
  };
}

enum Email {
  DEEPESHGEORGE_GMAIL_COM
}

final emailValues = EnumValues({
  "deepeshgeorge@gmail.com": Email.DEEPESHGEORGE_GMAIL_COM
});

enum OrderType {
  EXPRESS,
  NORMAL,
  URGENT
}

final orderTypeValues = EnumValues({
  "Express": OrderType.EXPRESS,
  "Normal": OrderType.NORMAL,
  "Urgent": OrderType.URGENT
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
