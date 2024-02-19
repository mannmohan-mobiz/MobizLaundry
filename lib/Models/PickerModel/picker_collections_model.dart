// To parse this JSON data, do
//
//     final pickerCollectionstModel = pickerCollectionstModelFromJson(jsonString);

import 'dart:convert';

PickerCollectionsModel pickerCollectionsModelFromJson(String str) => PickerCollectionsModel.fromJson(json.decode(str));

String pickerCollectionsModelToJson(PickerCollectionsModel data) => json.encode(data.toJson());

class PickerCollectionsModel {
  bool status;
  PickerCollections data;
  String message;

  PickerCollectionsModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory PickerCollectionsModel.fromJson(Map<String, dynamic> json) => PickerCollectionsModel(
    status: json["status"],
    data: PickerCollections.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class PickerCollections {
  num overallCollectedAmount;
  List<Customerlist> customerlist;

  PickerCollections({
    required this.overallCollectedAmount,
    required this.customerlist,
  });

  factory PickerCollections.fromJson(Map<String, dynamic> json) => PickerCollections(
    overallCollectedAmount: json["overall_collected_amount"],
    customerlist: List<Customerlist>.from(json["customerlist"].map((x) => Customerlist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "overall_collected_amount": overallCollectedAmount,
    "customerlist": List<dynamic>.from(customerlist.map((x) => x.toJson())),
  };
}

class Customerlist {
  String customerName;
  num amountCollected;
  num amount;
  num balanceAmount;

  Customerlist({
    required this.customerName,
    required this.amountCollected,
    required this.amount,
    required this.balanceAmount,
  });

  factory Customerlist.fromJson(Map<String, dynamic> json) => Customerlist(
    customerName: json["customer__name"],
    amountCollected: json["amount_collected"],
    amount: json["amount"],
    balanceAmount: json["balance_amount"],
  );

  Map<String, dynamic> toJson() => {
    "customer__name": customerName,
    "amount_collected": amountCollected,
    "amount": amount,
    "balance_amount": balanceAmount,
  };
}
