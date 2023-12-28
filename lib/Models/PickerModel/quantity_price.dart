// To parse this JSON data, do
//
//     final qunatityPriceModel = qunatityPriceModelFromJson(jsonString);

import 'dart:convert';

QunatityPriceModel qunatityPriceModelFromJson(String str) => QunatityPriceModel.fromJson(json.decode(str));

String qunatityPriceModelToJson(QunatityPriceModel data) => json.encode(data.toJson());

class QunatityPriceModel {
  bool status;
  QuantityPrice data;
  String message;

  QunatityPriceModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory QunatityPriceModel.fromJson(Map<String, dynamic> json) => QunatityPriceModel(
    status: json["status"],
    data: QuantityPrice.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class QuantityPrice {
  String priceListId;
  String itemServiceId;
  String quantity;
  int amount;

  QuantityPrice({
    required this.priceListId,
    required this.itemServiceId,
    required this.quantity,
    required this.amount,
  });

  factory QuantityPrice.fromJson(Map<String, dynamic> json) => QuantityPrice(
    priceListId: json["price_list_id"],
    itemServiceId: json["item_service_id"],
    quantity: json["quantity"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "price_list_id": priceListId,
    "item_service_id": itemServiceId,
    "quantity": quantity,
    "amount": amount,
  };
}
