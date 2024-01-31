// To parse this JSON data, do
//
//     final orderReportModel = orderReportModelFromJson(jsonString);

import 'dart:convert';

OrderReportModel orderReportModelFromJson(String str) => OrderReportModel.fromJson(json.decode(str));

String orderReportModelToJson(OrderReportModel data) => json.encode(data.toJson());

class OrderReportModel {
  final bool? status;
  final OrderReport? data;
  final String? message;

  OrderReportModel({
    this.status,
    this.data,
    this.message,
  });

  factory OrderReportModel.fromJson(Map<String, dynamic> json) => OrderReportModel(
    status: json["status"],
    data: json["data"] == null ? null : OrderReport.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class OrderReport {
  final List<Customerdatum>? customerdata;
  final int? totalOrders;
  final int? orderViaApp;
  final int? orderViaStaff;
  final int? orderViaCall;
  final int? newclients;

  OrderReport({
    this.customerdata,
    this.totalOrders,
    this.orderViaApp,
    this.orderViaStaff,
    this.orderViaCall,
    this.newclients,
  });

  factory OrderReport.fromJson(Map<String, dynamic> json) => OrderReport(
    customerdata: json["customerdata"] == null ? [] : List<Customerdatum>.from(json["customerdata"]!.map((x) => Customerdatum.fromJson(x))),
    totalOrders: json["total_orders"],
    orderViaApp: json["order_via_app"],
    orderViaStaff: json["order_via_staff"],
    orderViaCall: json["order_via_call"],
    newclients: json["newclients"],
  );

  Map<String, dynamic> toJson() => {
    "customerdata": customerdata == null ? [] : List<dynamic>.from(customerdata!.map((x) => x.toJson())),
    "total_orders": totalOrders,
    "order_via_app": orderViaApp,
    "order_via_staff": orderViaStaff,
    "order_via_call": orderViaCall,
    "newclients": newclients,
  };
}

class Customerdatum {
  final String? orderId;
  final DateTime? createdDate;
  final String? orderNumber;
  final DateTime? pickupDate;
  final String? pickupTime;
  final Customer? customer;
  final String? totalAmount;
  final DateTime? deliveryDate;
  final String? deliveryTime;
  final String? orderType;
  final String? netTaxable;
  final String? vat;
  final Map<String, String?>? customerAddress;

  Customerdatum({
    this.orderId,
    this.createdDate,
    this.orderNumber,
    this.pickupDate,
    this.pickupTime,
    this.customer,
    this.totalAmount,
    this.deliveryDate,
    this.deliveryTime,
    this.orderType,
    this.netTaxable,
    this.vat,
    this.customerAddress,
  });

  factory Customerdatum.fromJson(Map<String, dynamic> json) => Customerdatum(
    orderId: json["order_id"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    orderNumber: json["order_number"],
    pickupDate: json["pickup_date"] == null ? null : DateTime.parse(json["pickup_date"]),
    pickupTime: json["pickup_time"],
    customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
    totalAmount: json["total_amount"],
    deliveryDate: json["Delivery_date"] == null ? null : DateTime.parse(json["Delivery_date"]),
    deliveryTime: json["Delivery_time"],
    orderType: json["order_type"],
    netTaxable: json["net_taxable"],
    vat: json["vat"],
    customerAddress: json["customer_address"] == null ? {} : Map.from(json["customer_address"]).map((k, v) => MapEntry<String, String?>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "created_date": createdDate?.toIso8601String(),
    "order_number": orderNumber,
    "pickup_date": "${pickupDate!.year.toString().padLeft(4, '0')}-${pickupDate!.month.toString().padLeft(2, '0')}-${pickupDate!.day.toString().padLeft(2, '0')}",
    "pickup_time": pickupTime,
    "customer": customer?.toJson(),
    "total_amount": totalAmount,
    "Delivery_date": "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
    "Delivery_time": deliveryTime,
    "order_type": orderType,
    "net_taxable": netTaxable,
    "vat": vat,
    "customer_address": Map.from(customerAddress!).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

class Customer {
  final String? name;
  final String? customerType;

  Customer({
    this.name,
    this.customerType,
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
