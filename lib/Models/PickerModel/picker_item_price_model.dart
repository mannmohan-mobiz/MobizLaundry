// To parse this JSON data, do
//
//     final pickerItemsPriceModel = pickerItemsPriceModelFromJson(jsonString);

import 'dart:convert';

PickerItemsPriceModel pickerItemsPriceModelFromJson(String str) => PickerItemsPriceModel.fromJson(json.decode(str));

String pickerItemsPriceModelToJson(PickerItemsPriceModel data) => json.encode(data.toJson());

class PickerItemsPriceModel {
  bool status;
  List<PckItemPriceList> data;
  String message;

  PickerItemsPriceModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory PickerItemsPriceModel.fromJson(Map<String, dynamic> json) => PickerItemsPriceModel(
    status: json["status"],
    data: List<PckItemPriceList>.from(json["data"].map((x) => PckItemPriceList.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class PckItemPriceList {
  String priceListId;
  String amount;
  ItemServices itemServices;

  PckItemPriceList({
    required this.priceListId,
    required this.amount,
    required this.itemServices,
  });

  factory PckItemPriceList.fromJson(Map<String, dynamic> json) => PckItemPriceList(
    priceListId: json["price_list_id"],
    amount: json["amount"],
    itemServices: ItemServices.fromJson(json["item_services"]),
  );

  Map<String, dynamic> toJson() => {
    "price_list_id": priceListId,
    "amount": amount,
    "item_services": itemServices.toJson(),
  };
}

class ItemServices {
  String itemSerId;
  Item item;

  ItemServices({
    required this.itemSerId,
    required this.item,
  });

  factory ItemServices.fromJson(Map<String, dynamic> json) => ItemServices(
    itemSerId: json["item_ser_id"],
    item: Item.fromJson(json["item"]),
  );

  Map<String, dynamic> toJson() => {
    "item_ser_id": itemSerId,
    "item": item.toJson(),
  };
}

class Item {
  String itemId;
  String itemName;
  String itemImage;

  Item({
    required this.itemId,
    required this.itemName,
    required this.itemImage,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    itemId: json["item_id"],
    itemName: json["item_name"],
    itemImage: json["item_image"],
  );

  Map<String, dynamic> toJson() => {
    "item_id": itemId,
    "item_name": itemName,
    "item_image": itemImage,
  };
}
