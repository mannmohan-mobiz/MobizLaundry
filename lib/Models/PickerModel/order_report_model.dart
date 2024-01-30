// To parse this JSON data, do
//
//     final orderReportModel = orderReportModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

OrderReportModel orderReportModelFromJson(String str) => OrderReportModel.fromJson(json.decode(str));

String orderReportModelToJson(OrderReportModel data) => json.encode(data.toJson());

class OrderReportModel {
  bool status;
  OrderReport data;
  String message;

  OrderReportModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory OrderReportModel.fromJson(Map<String, dynamic> json) => OrderReportModel(
    status: json["status"],
    data: OrderReport.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class OrderReport {
  List<Customerdatum> customerdata;
  int? totalOrders;
  int? orderViaApp;
  int? orderViaStaff;
  int? orderViaCall;
  int? newclients;

  OrderReport({
    required this.customerdata,
    required this.totalOrders,
    required this.orderViaApp,
    required this.orderViaStaff,
    required this.orderViaCall,
    required this.newclients,
  });

  factory OrderReport.fromJson(Map<String, dynamic> json) => OrderReport(
    customerdata: List<Customerdatum>.from(json["customerdata"].map((x) => Customerdatum.fromJson(x))),
    totalOrders: json["total_orders"],
    orderViaApp: json["order_via_app"],
    orderViaStaff: json["order_via_staff"],
    orderViaCall: json["order_via_call"],
    newclients: json["newclients"],
  );

  Map<String, dynamic> toJson() => {
    "customerdata": List<dynamic>.from(customerdata.map((x) => x.toJson())),
    "total_orders": totalOrders,
    "order_via_app": orderViaApp,
    "order_via_staff": orderViaStaff,
    "order_via_call": orderViaCall,
    "newclients": newclients,
  };
}

class Customerdatum {
  String orderId;
  DateTime createdDate;
  String orderNumber;
  DateTime pickupDate;
  String? pickupTime;
  Customer customer;
  String? totalAmount;
  DateTime deliveryDate;
  String? deliveryTime;
  String? orderType;
  String? netTaxable;
  String? vat;
  Map<String, String?>? customerAddress;

  Customerdatum({
    required this.orderId,
    required this.createdDate,
    required this.orderNumber,
    required this.pickupDate,
    required this.pickupTime,
    required this.customer,
    required this.totalAmount,
    required this.deliveryDate,
    required this.deliveryTime,
    required this.orderType,
    required this.netTaxable,
    required this.vat,
    required this.customerAddress,
  });

  factory Customerdatum.fromJson(Map<String, dynamic> json) => Customerdatum(
    orderId: json["order_id"],
    createdDate: DateTime.parse(json["created_date"]),
    orderNumber: json["order_number"],
    pickupDate: DateTime.parse(json["pickup_date"]),
    pickupTime: json["pickup_time"],
    customer: Customer.fromJson(json["customer"]),
    totalAmount: json["total_amount"],
    deliveryDate: json["Delivery_date"] != null ? DateTime.parse(json["Delivery_date"]) : DateTime.now(),
    deliveryTime: json["Delivery_time"] ?? '',
    orderType: json["order_type"],
    netTaxable: json["net_taxable"],
    vat: json["vat"],
    customerAddress: json["customer_address"] == null ? {} : Map.from(json["customer_address"]).map((k, v) => MapEntry<String, String?>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "created_date": createdDate.toIso8601String(),
    "order_number": orderNumber,
    "pickup_date": "${pickupDate.year.toString().padLeft(4, '0')}-${pickupDate.month.toString().padLeft(2, '0')}-${pickupDate.day.toString().padLeft(2, '0')}",
    "pickup_time": pickupTime,
    "customer": customer.toJson(),
    "total_amount": totalAmount,
    "Delivery_date": "${deliveryDate.year.toString().padLeft(4, '0')}-${deliveryDate.month.toString().padLeft(2, '0')}-${deliveryDate.day.toString().padLeft(2, '0')}",
    "Delivery_time": deliveryTime,
    "order_type": orderType,
    "net_taxable": netTaxable,
    "vat": vat,
 //   "customer_address": Map.from(customerAddress!).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

class Customer {
  String name;
  String customerType;

  Customer({
    required this.name,
    required this.customerType,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    name: json["name"],
    customerType: json["customer_type"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "customer_type": customerType,
  };
}
