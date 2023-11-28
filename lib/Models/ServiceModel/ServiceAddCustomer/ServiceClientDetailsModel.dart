import 'dart:convert';

class ServiceClientDetailsModel {
  bool status;
  ClientDetailsData data;
  String message;

  ServiceClientDetailsModel({
    required this.status,
    required this.data,
    required this.message,
  });

  ServiceClientDetailsModel copyWith({
    bool? status,
    ClientDetailsData? data,
    String? message,
  }) =>
      ServiceClientDetailsModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory ServiceClientDetailsModel.fromRawJson(String str) => ServiceClientDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceClientDetailsModel.fromJson(Map<String, dynamic> json) => ServiceClientDetailsModel(
    status: json["status"],
    data: ClientDetailsData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class ClientDetailsData {
  Customer customer;
  Wallet wallet;

  ClientDetailsData({
    required this.customer,
    required this.wallet,
  });

  ClientDetailsData copyWith({
    Customer? customer,
    Wallet? wallet,
  }) =>
      ClientDetailsData(
        customer: customer ?? this.customer,
        wallet: wallet ?? this.wallet,
      );

  factory ClientDetailsData.fromRawJson(String str) => ClientDetailsData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ClientDetailsData.fromJson(Map<String, dynamic> json) => ClientDetailsData(
    customer: Customer.fromJson(json["customer"]),
    wallet: Wallet.fromJson(json["wallet"]),
  );

  Map<String, dynamic> toJson() => {
    "customer": customer.toJson(),
    "wallet": wallet.toJson(),
  };
}

class Customer {
  String customerId;
  User user;
  String createdBy;
  DateTime createdDate;
  String name;
  String customerType;
  String buildingNo;
  String roomNo;
  String mobile;
  String altMobile;
  String whatsApp;
  String creditLimit;
  String creditDays;
  String creditInvoices;
  dynamic gpse;
  dynamic gpsn;
  String status;
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
    required this.staff,
    required this.location,
    required this.pricegroup,
  });

  Customer copyWith({
    String? customerId,
    User? user,
    String? createdBy,
    DateTime? createdDate,
    String? name,
    String? customerType,
    String? buildingNo,
    String? roomNo,
    String? mobile,
    String? altMobile,
    String? whatsApp,
    String? creditLimit,
    String? creditDays,
    String? creditInvoices,
    dynamic gpse,
    dynamic gpsn,
    String? status,
    String? staff,
    String? location,
    String? pricegroup,
  }) =>
      Customer(
        customerId: customerId ?? this.customerId,
        user: user ?? this.user,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        name: name ?? this.name,
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
        status: status ?? this.status,
        staff: staff ?? this.staff,
        location: location ?? this.location,
        pricegroup: pricegroup ?? this.pricegroup,
      );

  factory Customer.fromRawJson(String str) => Customer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
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

class Wallet {
  int walletBalance;

  Wallet({
    required this.walletBalance,
  });

  Wallet copyWith({
    int? walletBalance,
  }) =>
      Wallet(
        walletBalance: walletBalance ?? this.walletBalance,
      );

  factory Wallet.fromRawJson(String str) => Wallet.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
    walletBalance: json["wallet balance"],
  );

  Map<String, dynamic> toJson() => {
    "wallet balance": walletBalance,
  };
}
