// To parse this JSON data, do
//
//     final selectPaymentModel = selectPaymentModelFromJson(jsonString);

import 'dart:convert';

SelectPaymentModel selectPaymentModelFromJson(String str) => SelectPaymentModel.fromJson(json.decode(str));

String selectPaymentModelToJson(SelectPaymentModel data) => json.encode(data.toJson());

class SelectPaymentModel {
  bool status;
  SelectPayment data;
  String message;

  SelectPaymentModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory SelectPaymentModel.fromJson(Map<String, dynamic> json) => SelectPaymentModel(
    status: json["status"],
    data: SelectPayment.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class SelectPayment {
  String walletBal;
  num previousBalance;
  String todayAmount;
  num totalAmount;

  SelectPayment({
    required this.walletBal,
    required this.previousBalance,
    required this.todayAmount,
    required this.totalAmount,
  });

  factory SelectPayment.fromJson(Map<String, dynamic> json) => SelectPayment(
    walletBal: json["wallet_bal"],
    previousBalance: json["previous_balance"],
    todayAmount: json["today_amount"],
    totalAmount: json["total_amount"],
  );

  Map<String, dynamic> toJson() => {
    "wallet_bal": walletBal,
    "previous_balance": previousBalance,
    "today_amount": todayAmount,
    "total_amount": totalAmount,
  };
}
