// To parse this JSON data, do
//
//     final pickerWalletBalanceModel = pickerWalletBalanceModelFromJson(jsonString);

import 'dart:convert';

PickerWalletBalanceModel pickerWalletBalanceModelFromJson(String str) => PickerWalletBalanceModel.fromJson(json.decode(str));

String pickerWalletBalanceModelToJson(PickerWalletBalanceModel data) => json.encode(data.toJson());

class PickerWalletBalanceModel {
  bool status;
  String totalAmount;
  var walletBalance;
  int outstandingDue;
  String message;

  PickerWalletBalanceModel({
    required this.status,
    required this.totalAmount,
    required this.walletBalance,
    required this.outstandingDue,
    required this.message,
  });

  factory PickerWalletBalanceModel.fromJson(Map<String, dynamic> json) => PickerWalletBalanceModel(
    status: json["status"],
    totalAmount: json["total_amount"],
    walletBalance: json["wallet_balance"],
    outstandingDue: json["outstanding_due"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "total_amount": totalAmount,
    "wallet_balance": walletBalance,
    "outstanding_due": outstandingDue,
    "message": message,
  };
}
