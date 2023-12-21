// To parse this JSON data, do
//
//     final readyForDespatch = readyForDespatchFromJson(jsonString);

import 'dart:convert';

ReadyForDespatch readyForDespatchFromJson(String str) => ReadyForDespatch.fromJson(json.decode(str));

String readyForDespatchToJson(ReadyForDespatch data) => json.encode(data.toJson());

class ReadyForDespatch {
  bool status;
  List<ReadyForDespatchList> data;
  String message;

  ReadyForDespatch({
    required this.status,
    required this.data,
    required this.message,
  });

  factory ReadyForDespatch.fromJson(Map<String, dynamic> json) => ReadyForDespatch(
    status: json["status"],
    data: List<ReadyForDespatchList>.from(json["data"].map((x) => ReadyForDespatchList.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class ReadyForDespatchList {
  String orderId;
  Customer customer;
  dynamic createdBy;
  DateTime createdDate;
  String orderNumber;
  DateTime pickupDate;
  String pickupTime;
  String pickupMode;
  bool confirmPickup;
  String status;
  String orderType;
  String totalAmount;
  String orderVia;
  DateTime orderDate;
  DateTime deliveryDate;
  String deliveryTime;
  bool paidStatus;
  String discount;
  String netTaxable;
  String vat;
  String grantTotal;
  String staff;
  dynamic invoice;

  ReadyForDespatchList({
    required this.orderId,
    required this.customer,
    required this.createdBy,
    required this.createdDate,
    required this.orderNumber,
    required this.pickupDate,
    required this.pickupTime,
    required this.pickupMode,
    required this.confirmPickup,
    required this.status,
    required this.orderType,
    required this.totalAmount,
    required this.orderVia,
    required this.orderDate,
    required this.deliveryDate,
    required this.deliveryTime,
    required this.paidStatus,
    required this.discount,
    required this.netTaxable,
    required this.vat,
    required this.grantTotal,
    required this.staff,
    required this.invoice,
  });

  factory ReadyForDespatchList.fromJson(Map<String, dynamic> json) => ReadyForDespatchList(
    orderId: json["order_id"],
    customer: Customer.fromJson(json["customer"]),
    createdBy: json["created_by"],
    createdDate: DateTime.parse(json["created_date"]),
    orderNumber: json["order_number"],
    pickupDate: DateTime.parse(json["pickup_date"]),
    pickupTime: json["pickup_time"],
    pickupMode: json["Pickup_mode"],
    confirmPickup: json["confirm_pickup"],
    status: json["status"],
    orderType: json["order_type"],
    totalAmount: json["total_amount"],
    orderVia: json["order_via"],
    orderDate: DateTime.parse(json["order_date"]),
    deliveryDate: DateTime.parse(json["Delivery_date"]),
    deliveryTime: json["Delivery_time"],
    paidStatus: json["paid_status"],
    discount: json["discount"],
    netTaxable: json["net_taxable"],
    vat: json["vat"],
    grantTotal: json["grant_total"],
    staff: json["staff"],
    invoice: json["invoice"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "customer": customer.toJson(),
    "created_by": createdBy,
    "created_date": createdDate.toIso8601String(),
    "order_number": orderNumber,
    "pickup_date": "${pickupDate.year.toString().padLeft(4, '0')}-${pickupDate.month.toString().padLeft(2, '0')}-${pickupDate.day.toString().padLeft(2, '0')}",
    "pickup_time": pickupTime,
    "Pickup_mode": pickupMode,
    "confirm_pickup": confirmPickup,
    "status": status,
    "order_type": orderType,
    "total_amount": totalAmount,
    "order_via": orderVia,
    "order_date": "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
    "Delivery_date": "${deliveryDate.year.toString().padLeft(4, '0')}-${deliveryDate.month.toString().padLeft(2, '0')}-${deliveryDate.day.toString().padLeft(2, '0')}",
    "Delivery_time": deliveryTime,
    "paid_status": paidStatus,
    "discount": discount,
    "net_taxable": netTaxable,
    "vat": vat,
    "grant_total": grantTotal,
    "staff": staff,
    "invoice": invoice,
  };
}

class Customer {
  String name;
  String buildingNo;
  Location location;

  Customer({
    required this.name,
    required this.buildingNo,
    required this.location,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    name: json["name"],
    buildingNo: json["building_no"],
    location: Location.fromJson(json["Location"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "building_no": buildingNo,
    "Location": location.toJson(),
  };
}

class Location {
  String name;

  Location({
    required this.name,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
