// To parse this JSON data, do
//
//     final pickerPaymentList = pickerPaymentListFromJson(jsonString);

import 'dart:convert';

PickerPaymentList pickerPaymentListFromJson(String str) => PickerPaymentList.fromJson(json.decode(str));

String pickerPaymentListToJson(PickerPaymentList data) => json.encode(data.toJson());

class PickerPaymentList {
  final bool? status;
  final List<PaymentList>? data;
  final String? message;

  PickerPaymentList({
    this.status,
    this.data,
    this.message,
  });

  factory PickerPaymentList.fromJson(Map<String, dynamic> json) => PickerPaymentList(
    status: json["status"],
    data: json["data"] == null ? [] : List<PaymentList>.from(json["data"]!.map((x) => PaymentList.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class PaymentList {
  final String? paymentMethod;

  PaymentList({
    this.paymentMethod,
  });

  factory PaymentList.fromJson(Map<String, dynamic> json) => PaymentList(
    paymentMethod: json["payment_method"],
  );

  Map<String, dynamic> toJson() => {
    "payment_method": paymentMethod,
  };
}
