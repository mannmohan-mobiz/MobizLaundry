// To parse this JSON data, do
//
//     final orderReportDetailModel = orderReportDetailModelFromJson(jsonString);

import 'dart:convert';

OrderReportDetailModel orderReportDetailModelFromJson(String str) => OrderReportDetailModel.fromJson(json.decode(str));

String orderReportDetailModelToJson(OrderReportDetailModel data) => json.encode(data.toJson());

class OrderReportDetailModel {
  bool status;
  OrderReportDetail data;
  String message;

  OrderReportDetailModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory OrderReportDetailModel.fromJson(Map<String, dynamic> json) => OrderReportDetailModel(
    status: json["status"],
    data: OrderReportDetail.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class OrderReportDetail {
  List<Cart> cart;

  OrderReportDetail({
    required this.cart,
  });

  factory OrderReportDetail.fromJson(Map<String, dynamic> json) => OrderReportDetail(
    cart: List<Cart>.from(json["cart"].map((x) => Cart.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
  };
}

class Cart {
  String cartId;
  Order order;
  String quantity;
  String amount;
  List<ItemService> itemService;
  String priceList;

  Cart({
    required this.cartId,
    required this.order,
    required this.quantity,
    required this.amount,
    required this.itemService,
    required this.priceList,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    cartId: json["cart_id"],
    order: Order.fromJson(json["order"]),
    quantity: json["quantity"],
    amount: json["amount"],
    itemService: List<ItemService>.from(json["item_service"].map((x) => ItemService.fromJson(x))),
    priceList: json["price_list"],
  );

  Map<String, dynamic> toJson() => {
    "cart_id": cartId,
    "order": order.toJson(),
    "quantity": quantity,
    "amount": amount,
    "item_service": List<dynamic>.from(itemService.map((x) => x.toJson())),
    "price_list": priceList,
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

class Order {
  String orderId;
  DateTime createdDate;
  String orderNumber;
  DateTime pickupDate;
  String pickupTime;
  String totalAmount;
  DateTime deliveryDate;
  String status;
  DateTime orderDate;
  String deliveryTime;
  String orderType;
  String netTaxable;
  String vat;

  Order({
    required this.orderId,
    required this.createdDate,
    required this.orderNumber,
    required this.pickupDate,
    required this.pickupTime,
    required this.totalAmount,
    required this.deliveryDate,
    required this.status,
    required this.orderDate,
    required this.deliveryTime,
    required this.orderType,
    required this.netTaxable,
    required this.vat,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderId: json["order_id"],
    createdDate: DateTime.parse(json["created_date"]),
    orderNumber: json["order_number"],
    pickupDate: DateTime.parse(json["pickup_date"]),
    pickupTime: json["pickup_time"],
    totalAmount: json["total_amount"],
    deliveryDate: DateTime.parse(json["Delivery_date"]),
    status: json["status"],
    orderDate: DateTime.parse(json["order_date"]),
    deliveryTime: json["Delivery_time"],
    orderType: json["order_type"],
    netTaxable: json["net_taxable"],
    vat: json["vat"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "created_date": createdDate.toIso8601String(),
    "order_number": orderNumber,
    "pickup_date": "${pickupDate.year.toString().padLeft(4, '0')}-${pickupDate.month.toString().padLeft(2, '0')}-${pickupDate.day.toString().padLeft(2, '0')}",
    "pickup_time": pickupTime,
    "total_amount": totalAmount,
    "Delivery_date": "${deliveryDate.year.toString().padLeft(4, '0')}-${deliveryDate.month.toString().padLeft(2, '0')}-${deliveryDate.day.toString().padLeft(2, '0')}",
    "status": status,
    "order_date": "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
    "Delivery_time": deliveryTime,
    "order_type": orderType,
    "net_taxable": netTaxable,
    "vat": vat,
  };
}
