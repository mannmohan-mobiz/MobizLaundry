// To parse this JSON data, do
//
//     final walletRechargeReceiptModel = walletRechargeReceiptModelFromJson(jsonString);

import 'dart:convert';

WalletRechargeReceiptModel walletRechargeReceiptModelFromJson(String str) => WalletRechargeReceiptModel.fromJson(json.decode(str));

String walletRechargeReceiptModelToJson(WalletRechargeReceiptModel data) => json.encode(data.toJson());

class WalletRechargeReceiptModel {
  bool status;
  WalletRechargeReceipt data;
  String message;

  WalletRechargeReceiptModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory WalletRechargeReceiptModel.fromJson(Map<String, dynamic> json) => WalletRechargeReceiptModel(
    status: json["status"],
    data: WalletRechargeReceipt.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class WalletRechargeReceipt {
  String transferId;
  DateTime createdDate;
  String customer;
  String rechargedFor;
  String rechargedBy;
  DateTime paymentDate;
  String paymentTime;
  String staff;
  String transferType;
  DateTime transferDate;
  String amount;
  dynamic modeOfPayment;
  int referenceNumber;

  WalletRechargeReceipt({
    required this.transferId,
    required this.createdDate,
    required this.customer,
    required this.rechargedFor,
    required this.rechargedBy,
    required this.paymentDate,
    required this.paymentTime,
    required this.staff,
    required this.transferType,
    required this.transferDate,
    required this.amount,
    required this.modeOfPayment,
    required this.referenceNumber,
  });

  factory WalletRechargeReceipt.fromJson(Map<String, dynamic> json) => WalletRechargeReceipt(
    transferId: json["transfer_id"],
    createdDate: DateTime.parse(json["created_date"]),
    customer: json["customer"],
    rechargedFor: json["recharged_for"],
    rechargedBy: json["recharged_by"],
    paymentDate: DateTime.parse(json["payment_date"]),
    paymentTime: json["payment_time"],
    staff: json["staff"],
    transferType: json["transfer_type"],
    transferDate: DateTime.parse(json["transfer_date"]),
    amount: json["amount"],
    modeOfPayment: json["mode_of_payment"],
    referenceNumber: json["reference_number"],
  );

  Map<String, dynamic> toJson() => {
    "transfer_id": transferId,
    "created_date": createdDate.toIso8601String(),
    "customer": customer,
    "recharged_for": rechargedFor,
    "recharged_by": rechargedBy,
    "payment_date": "${paymentDate.year.toString().padLeft(4, '0')}-${paymentDate.month.toString().padLeft(2, '0')}-${paymentDate.day.toString().padLeft(2, '0')}",
    "payment_time": paymentTime,
    "staff": staff,
    "transfer_type": transferType,
    "transfer_date": "${transferDate.year.toString().padLeft(4, '0')}-${transferDate.month.toString().padLeft(2, '0')}-${transferDate.day.toString().padLeft(2, '0')}",
    "amount": amount,
    "mode_of_payment": modeOfPayment,
    "reference_number": referenceNumber,
  };
}
