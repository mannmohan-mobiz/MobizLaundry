// To parse this JSON data, do
//
//     final pickerWalletBalanceModel = pickerWalletBalanceModelFromJson(jsonString);

import 'dart:convert';

PickerWalletBalanceModel pickerWalletBalanceModelFromJson(String str) => PickerWalletBalanceModel.fromJson(json.decode(str));

String pickerWalletBalanceModelToJson(PickerWalletBalanceModel data) => json.encode(data.toJson());

class PickerWalletBalanceModel {
  bool status;
  var totalAmountPayable;
  var walletBalance;
  String walletid;
  String message;

  PickerWalletBalanceModel({
    required this.status,
    required this.totalAmountPayable,
    required this.walletBalance,
    required this.walletid,
    required this.message,
  });

  factory PickerWalletBalanceModel.fromJson(Map<String, dynamic> json) => PickerWalletBalanceModel(
    status: json["status"],
    totalAmountPayable: json["total_amount_payable"],
    walletBalance: json["wallet_balance"],
    walletid: json["walletid"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "total_amount_payable": totalAmountPayable,
    "wallet_balance": walletBalance,
    "walletid": walletid,
    "message": message,
  };
}
