import 'dart:convert';

class ServiceItemPriceModel {
  bool status;
  List<ItemPriceData> data;
  String message;

  ServiceItemPriceModel({
    required this.status,
    required this.data,
    required this.message,
  });

  ServiceItemPriceModel copyWith({
    bool? status,
    List<ItemPriceData>? data,
    String? message,
  }) =>
      ServiceItemPriceModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory ServiceItemPriceModel.fromRawJson(String str) => ServiceItemPriceModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceItemPriceModel.fromJson(Map<String, dynamic> json) => ServiceItemPriceModel(
    status: json["status"],
    data: List<ItemPriceData>.from(json["data"].map((x) => ItemPriceData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class ItemPriceData {
  String priceListId;
  String amount;
  ItemServices itemServices;

  ItemPriceData({
    required this.priceListId,
    required this.amount,
    required this.itemServices,
  });

  ItemPriceData copyWith({
    String? priceListId,
    String? amount,
    ItemServices? itemServices,
  }) =>
      ItemPriceData(
        priceListId: priceListId ?? this.priceListId,
        amount: amount ?? this.amount,
        itemServices: itemServices ?? this.itemServices,
      );

  factory ItemPriceData.fromRawJson(String str) => ItemPriceData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ItemPriceData.fromJson(Map<String, dynamic> json) => ItemPriceData(
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

  ItemServices copyWith({
    String? itemSerId,
    Item? item,
  }) =>
      ItemServices(
        itemSerId: itemSerId ?? this.itemSerId,
        item: item ?? this.item,
      );

  factory ItemServices.fromRawJson(String str) => ItemServices.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  Item copyWith({
    String? itemId,
    String? itemName,
    String? itemImage,
  }) =>
      Item(
        itemId: itemId ?? this.itemId,
        itemName: itemName ?? this.itemName,
        itemImage: itemImage ?? this.itemImage,
      );

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
