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
  Category category;
  SubCategory subCategory;

  ItemServices({
    required this.itemSerId,
    required this.item,
    required this.category,
    required this.subCategory,
  });

  factory ItemServices.fromJson(Map<String, dynamic> json) => ItemServices(
    itemSerId: json["item_ser_id"],
    item: Item.fromJson(json["item"]),
    category: Category.fromJson(json["category"]),
    subCategory: SubCategory.fromJson(json["sub_category"]),
  );

  Map<String, dynamic> toJson() => {
    "item_ser_id": itemSerId,
    "item": item.toJson(),
    "category": category.toJson(),
    "sub_category": subCategory.toJson(),
  };
}

class Category {
  String categoryId;
  ServiceMaster serviceMaster;

  Category({
    required this.categoryId,
    required this.serviceMaster,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryId: json["category_id"],
    serviceMaster: ServiceMaster.fromJson(json["service_master"]),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "service_master": serviceMaster.toJson(),
  };
}

class ServiceMaster {
  String categoryName;
  String categoryImage;

  ServiceMaster({
    required this.categoryName,
    required this.categoryImage,
  });

  factory ServiceMaster.fromJson(Map<String, dynamic> json) => ServiceMaster(
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
  );

  Map<String, dynamic> toJson() => {
    "category_name": categoryName,
    "category_image": categoryImage,
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

class SubCategory {
  String subCatId;
  SubServiceMaster subServiceMaster;

  SubCategory({
    required this.subCatId,
    required this.subServiceMaster,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    subCatId: json["sub_cat_id"],
    subServiceMaster: SubServiceMaster.fromJson(json["sub_service_master"]),
  );

  Map<String, dynamic> toJson() => {
    "sub_cat_id": subCatId,
    "sub_service_master": subServiceMaster.toJson(),
  };
}

class SubServiceMaster {
  String subCatName;
  String subCatImage;

  SubServiceMaster({
    required this.subCatName,
    required this.subCatImage,
  });

  factory SubServiceMaster.fromJson(Map<String, dynamic> json) => SubServiceMaster(
    subCatName: json["sub_cat_name"],
    subCatImage: json["sub_cat_image"],
  );

  Map<String, dynamic> toJson() => {
    "sub_cat_name": subCatName,
    "sub_cat_image": subCatImage,
  };
}
