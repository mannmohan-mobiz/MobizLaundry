// To parse this JSON data, do
//
//     final deliveryToCustomerModel = deliveryToCustomerModelFromJson(jsonString);

import 'dart:convert';

DeliveryToCustomerModel deliveryToCustomerModelFromJson(String str) => DeliveryToCustomerModel.fromJson(json.decode(str));

String deliveryToCustomerModelToJson(DeliveryToCustomerModel data) => json.encode(data.toJson());

class DeliveryToCustomerModel {
  bool status;
  DeliveryToCustomer data;
  String message;

  DeliveryToCustomerModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory DeliveryToCustomerModel.fromJson(Map<String, dynamic> json) => DeliveryToCustomerModel(
    status: json["status"],
    data: DeliveryToCustomer.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class DeliveryToCustomer {
  String totalAmount;
  String invoiceNumber;
  DateTime invoiceDate;

  DeliveryToCustomer({
    required this.totalAmount,
    required this.invoiceNumber,
    required this.invoiceDate,
  });

  factory DeliveryToCustomer.fromJson(Map<String, dynamic> json) => DeliveryToCustomer(
    totalAmount: json["total_amount"],
    invoiceNumber: json["invoice_number"],
    invoiceDate: DateTime.parse(json["invoice_date"]),
  );

  Map<String, dynamic> toJson() => {
    "total_amount": totalAmount,
    "invoice_number": invoiceNumber,
    "invoice_date": "${invoiceDate.year.toString().padLeft(4, '0')}-${invoiceDate.month.toString().padLeft(2, '0')}-${invoiceDate.day.toString().padLeft(2, '0')}",
  };
}
