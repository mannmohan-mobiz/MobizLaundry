// To parse this JSON data, do
//
//     final addtoWalletModel = addtoWalletModelFromJson(jsonString);

import 'dart:convert';

AddtoWalletModel addtoWalletModelFromJson(String str) => AddtoWalletModel.fromJson(json.decode(str));

String addtoWalletModelToJson(AddtoWalletModel data) => json.encode(data.toJson());

class AddtoWalletModel {
  bool status;
  AddToWallet data;
  String message;

  AddtoWalletModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory AddtoWalletModel.fromJson(Map<String, dynamic> json) => AddtoWalletModel(
    status: json["status"],
    data: AddToWallet.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class AddToWallet {
  String walletBalance;
  CollectToAmount collectToAmount;

  AddToWallet({
    required this.walletBalance,
    required this.collectToAmount,
  });

  factory AddToWallet.fromJson(Map<String, dynamic> json) => AddToWallet(
    walletBalance: json["wallet_balance"],
    collectToAmount: CollectToAmount.fromJson(json["collect to amount"]),
  );

  Map<String, dynamic> toJson() => {
    "wallet_balance": walletBalance,
    "collect to amount": collectToAmount.toJson(),
  };
}

class CollectToAmount {
  num totalShortSum;

  CollectToAmount({
    required this.totalShortSum,
  });

  factory CollectToAmount.fromJson(Map<String, dynamic> json) => CollectToAmount(
    totalShortSum: json["total_short_sum"],
  );

  Map<String, dynamic> toJson() => {
    "total_short_sum": totalShortSum,
  };
}
