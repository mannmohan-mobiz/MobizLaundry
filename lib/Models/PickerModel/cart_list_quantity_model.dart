// To parse this JSON data, do
//
//     final pickerCartQuantityListModel = pickerCartQuantityListModelFromJson(jsonString);

import 'dart:convert';

PickerCartQuantityListModel pickerCartQuantityListModelFromJson(String str) => PickerCartQuantityListModel.fromJson(json.decode(str));

String pickerCartQuantityListModelToJson(PickerCartQuantityListModel data) => json.encode(data.toJson());

class PickerCartQuantityListModel {
  bool status;
  CartQuantityList data;
  String message;

  PickerCartQuantityListModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory PickerCartQuantityListModel.fromJson(Map<String, dynamic> json) => PickerCartQuantityListModel(
    status: json["status"],
    data: CartQuantityList.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class CartQuantityList {
  String cartId;
  dynamic createdBy;
  DateTime createdDate;
  String quantity;
  String amount;
  String order;
  String itemService;
  String priceList;
  String serviceCategory;
  String serviceSubCategory;

  CartQuantityList({
    required this.cartId,
    required this.createdBy,
    required this.createdDate,
    required this.quantity,
    required this.amount,
    required this.order,
    required this.itemService,
    required this.priceList,
    required this.serviceCategory,
    required this.serviceSubCategory,
  });

  factory CartQuantityList.fromJson(Map<String, dynamic> json) => CartQuantityList(
    cartId: json["cart_id"],
    createdBy: json["created_by"],
    createdDate: DateTime.parse(json["created_date"]),
    quantity: json["quantity"],
    amount: json["amount"],
    order: json["order"],
    itemService: json["item_service"],
    priceList: json["price_list"],
    serviceCategory: json["service_category"],
    serviceSubCategory: json["service_sub_category"],
  );

  Map<String, dynamic> toJson() => {
    "cart_id": cartId,
    "created_by": createdBy,
    "created_date": createdDate.toIso8601String(),
    "quantity": quantity,
    "amount": amount,
    "order": order,
    "item_service": itemService,
    "price_list": priceList,
    "service_category": serviceCategory,
    "service_sub_category": serviceSubCategory,
  };
}
