// To parse this JSON data, do
//
//     final statementAccountModel = statementAccountModelFromJson(jsonString);

import 'dart:convert';

StatementAccountModel statementAccountModelFromJson(String str) => StatementAccountModel.fromJson(json.decode(str));

String statementAccountModelToJson(StatementAccountModel data) => json.encode(data.toJson());

class StatementAccountModel {
  bool status;
  List<StatementAccoun> data;
  String message;

  StatementAccountModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory StatementAccountModel.fromJson(Map<String, dynamic> json) => StatementAccountModel(
    status: json["status"],
    data: List<StatementAccoun>.from(json["data"].map((x) => StatementAccoun.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class StatementAccoun {
  String orderId;
  String orderNumber;
  String totalAmount;
  String orderType;
  DateTime orderDate;
  String status;
  DateTime deliveryDate;
  int invoiceNumber;
  DateTime invoiceDate;
  int amountPaid;
  int balanceAmount;

  StatementAccoun({
    required this.orderId,
    required this.orderNumber,
    required this.totalAmount,
    required this.orderType,
    required this.orderDate,
    required this.status,
    required this.deliveryDate,
    required this.invoiceNumber,
    required this.invoiceDate,
    required this.amountPaid,
    required this.balanceAmount,
  });

  factory StatementAccoun.fromJson(Map<String, dynamic> json) => StatementAccoun(
    orderId: json["order_id"],
    orderNumber: json["order_number"],
    totalAmount: json["total_amount"],
    orderType: json["order_type"],
    orderDate: DateTime.parse(json["order_date"]),
    status: json["status"],
    deliveryDate: DateTime.parse(json["Delivery_date"]),
    invoiceNumber: json["invoice_number"],
    invoiceDate: DateTime.parse(json["invoice_date"]),
    amountPaid: json["amount_paid"],
    balanceAmount: json["balance_amount"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "order_number": orderNumber,
    "total_amount": totalAmount,
    "order_type": orderType,
    "order_date": "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
    "status": status,
    "Delivery_date": "${deliveryDate.year.toString().padLeft(4, '0')}-${deliveryDate.month.toString().padLeft(2, '0')}-${deliveryDate.day.toString().padLeft(2, '0')}",
    "invoice_number": invoiceNumber,
    "invoice_date": "${invoiceDate.year.toString().padLeft(4, '0')}-${invoiceDate.month.toString().padLeft(2, '0')}-${invoiceDate.day.toString().padLeft(2, '0')}",
    "amount_paid": amountPaid,
    "balance_amount": balanceAmount,
  };
}
