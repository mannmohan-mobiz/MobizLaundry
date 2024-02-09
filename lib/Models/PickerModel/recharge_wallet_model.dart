// To parse this JSON data, do
//
//     final walletRechargeModel = walletRechargeModelFromJson(jsonString);

import 'dart:convert';

WalletRechargeModel walletRechargeModelFromJson(String str) => WalletRechargeModel.fromJson(json.decode(str));

String walletRechargeModelToJson(WalletRechargeModel data) => json.encode(data.toJson());

class WalletRechargeModel {
  bool status;
  WalletRecharge data;
  NewTotal newTotal;
  String message;

  WalletRechargeModel({
    required this.status,
    required this.data,
    required this.newTotal,
    required this.message,
  });

  factory WalletRechargeModel.fromJson(Map<String, dynamic> json) => WalletRechargeModel(
    status: json["status"],
    data: WalletRecharge.fromJson(json["data"]),
    newTotal: NewTotal.fromJson(json["new_total"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "new_total": newTotal.toJson(),
    "message": message,
  };
}

class WalletRecharge {
  String transferId;
  String createdBy;
  String customer;
  String staff;
  String transferType;
  DateTime transferDate;
  String amount;
  dynamic order;

  WalletRecharge({
    required this.transferId,
    required this.createdBy,
    required this.customer,
    required this.staff,
    required this.transferType,
    required this.transferDate,
    required this.amount,
    required this.order,
  });

  factory WalletRecharge.fromJson(Map<String, dynamic> json) => WalletRecharge(
    transferId: json["transfer_id"],
    createdBy: json["created_by"],
    customer: json["customer"],
    staff: json["staff"],
    transferType: json["transfer_type"],
    transferDate: DateTime.parse(json["transfer_date"]),
    amount: json["amount"],
    order: json["order"],
  );

  Map<String, dynamic> toJson() => {
    "transfer_id": transferId,
    "created_by": createdBy,
    "customer": customer,
    "staff": staff,
    "transfer_type": transferType,
    "transfer_date": "${transferDate.year.toString().padLeft(4, '0')}-${transferDate.month.toString().padLeft(2, '0')}-${transferDate.day.toString().padLeft(2, '0')}",
    "amount": amount,
    "order": order,
  };
}

class NewTotal {
  num total;

  NewTotal({
    required this.total,
  });

  factory NewTotal.fromJson(Map<String, dynamic> json) => NewTotal(
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
  };
}
