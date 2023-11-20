import 'dart:convert';

class PickerItemsPriceModel {
  bool status;
  List<List<PckItemPriceList>> data;
  String message;

  PickerItemsPriceModel({
    required this.status,
    required this.data,
    required this.message,
  });

  PickerItemsPriceModel copyWith({
    bool? status,
    List<List<PckItemPriceList>>? data,
    String? message,
  }) =>
      PickerItemsPriceModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory PickerItemsPriceModel.fromRawJson(String str) => PickerItemsPriceModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PickerItemsPriceModel.fromJson(Map<String, dynamic> json) => PickerItemsPriceModel(
    status: json["status"],
    data: List<List<PckItemPriceList>>.from(json["data"].map((x) => List<PckItemPriceList>.from(x.map((x) => PckItemPriceList.fromJson(x))))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
    "message": message,
  };
}


/// price_list_id : "204f52f9-2028-4c97-877f-796fc6fc225a"
/// amount : "2"
/// item_services : {"item_ser_id":"7b122c67-a82a-4fec-9b19-439d7dfec0de","item":{"item_id":"a4b6880c-faa4-4dda-9e28-b3b690e8df95","item_name":"Shirts","item_image":"/media/shirts.jpeg"}}

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

/// item_ser_id : "7b122c67-a82a-4fec-9b19-439d7dfec0de"
/// item : {"item_id":"a4b6880c-faa4-4dda-9e28-b3b690e8df95","item_name":"Shirts","item_image":"/media/shirts.jpeg"}
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

/// item_id : "a4b6880c-faa4-4dda-9e28-b3b690e8df95"
/// item_name : "Shirts"
/// item_image : "/media/shirts.jpeg"

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