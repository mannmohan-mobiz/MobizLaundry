import 'dart:convert';

class ServiceAddtoCartModel {
  bool status;
  List<AddToCartData> data;
  String message;

  ServiceAddtoCartModel({
    required this.status,
    required this.data,
    required this.message,
  });

  ServiceAddtoCartModel copyWith({
    bool? status,
    List<AddToCartData>? data,
    String? message,
  }) =>
      ServiceAddtoCartModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory ServiceAddtoCartModel.fromRawJson(String str) => ServiceAddtoCartModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceAddtoCartModel.fromJson(Map<String, dynamic> json) => ServiceAddtoCartModel(
    status: json["status"],
    data: List<AddToCartData>.from(json["data"].map((x) => AddToCartData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class AddToCartData {
  String cartId;
  ItemService itemService;
  String quantity;
  String amount;

  AddToCartData({
    required this.cartId,
    required this.itemService,
    required this.quantity,
    required this.amount,
  });

  AddToCartData copyWith({
    String? cartId,
    ItemService? itemService,
    String? quantity,
    String? amount,
  }) =>
      AddToCartData(
        cartId: cartId ?? this.cartId,
        itemService: itemService ?? this.itemService,
        quantity: quantity ?? this.quantity,
        amount: amount ?? this.amount,
      );

  factory AddToCartData.fromRawJson(String str) => AddToCartData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddToCartData.fromJson(Map<String, dynamic> json) => AddToCartData(
    cartId: json["cart_id"],
    itemService: ItemService.fromJson(json["item_service"]),
    quantity: json["quantity"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "cart_id": cartId,
    "item_service": itemService.toJson(),
    "quantity": quantity,
    "amount": amount,
  };
}

class ItemService {
  String itemSerId;
  Item item;
  Category category;
  SubCategory subCategory;

  ItemService({
    required this.itemSerId,
    required this.item,
    required this.category,
    required this.subCategory,
  });

  ItemService copyWith({
    String? itemSerId,
    Item? item,
    Category? category,
    SubCategory? subCategory,
  }) =>
      ItemService(
        itemSerId: itemSerId ?? this.itemSerId,
        item: item ?? this.item,
        category: category ?? this.category,
        subCategory: subCategory ?? this.subCategory,
      );

  factory ItemService.fromRawJson(String str) => ItemService.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ItemService.fromJson(Map<String, dynamic> json) => ItemService(
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

  Category copyWith({
    String? categoryId,
    ServiceMaster? serviceMaster,
  }) =>
      Category(
        categoryId: categoryId ?? this.categoryId,
        serviceMaster: serviceMaster ?? this.serviceMaster,
      );

  factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  ServiceMaster copyWith({
    String? categoryName,
    String? categoryImage,
  }) =>
      ServiceMaster(
        categoryName: categoryName ?? this.categoryName,
        categoryImage: categoryImage ?? this.categoryImage,
      );

  factory ServiceMaster.fromRawJson(String str) => ServiceMaster.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

class SubCategory {
  String subCatId;
  String subServiceMaster;

  SubCategory({
    required this.subCatId,
    required this.subServiceMaster,
  });

  SubCategory copyWith({
    String? subCatId,
    String? subServiceMaster,
  }) =>
      SubCategory(
        subCatId: subCatId ?? this.subCatId,
        subServiceMaster: subServiceMaster ?? this.subServiceMaster,
      );

  factory SubCategory.fromRawJson(String str) => SubCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    subCatId: json["sub_cat_id"],
    subServiceMaster: json["sub_service_master"],
  );

  Map<String, dynamic> toJson() => {
    "sub_cat_id": subCatId,
    "sub_service_master": subServiceMaster,
  };
}
