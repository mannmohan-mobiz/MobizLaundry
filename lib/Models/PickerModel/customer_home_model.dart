// To parse this JSON data, do
//
//     final customerHomeOrderModel = customerHomeOrderModelFromJson(jsonString);

import 'dart:convert';

CustomerHomeOrderModel customerHomeOrderModelFromJson(String str) => CustomerHomeOrderModel.fromJson(json.decode(str));

String customerHomeOrderModelToJson(CustomerHomeOrderModel data) => json.encode(data.toJson());

class CustomerHomeOrderModel {
  final bool? status;
  final CustomerHome? data;
  final String? message;

  CustomerHomeOrderModel({
    this.status,
    this.data,
    this.message,
  });

  factory CustomerHomeOrderModel.fromJson(Map<String, dynamic> json) => CustomerHomeOrderModel(
    status: json["status"],
    data: json["data"] == null ? null : CustomerHome.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class CustomerHome {
  final String? name;
  final Addresslist? addresslist;
  final String? mobileNumber;
  final String? emailId;
  var outstanding;
  final String? walletBal;
  final List<PendingOrder>? todayDelivery;
  final List<PendingOrder>? pendingOrders;

  CustomerHome({
    this.name,
    this.addresslist,
    this.mobileNumber,
    this.emailId,
    this.outstanding,
    this.walletBal,
    this.todayDelivery,
    this.pendingOrders,
  });

  factory CustomerHome.fromJson(Map<String, dynamic> json) => CustomerHome(
    name: json["name"],
    addresslist: json["addresslist"] == null ? null : Addresslist.fromJson(json["addresslist"]),
    mobileNumber: json["mobile_number"],
    emailId: json["email_id"],
    outstanding: json["outstanding"],
    walletBal: json["wallet_bal"],
    todayDelivery: json["today_delivery"] == null ? [] : List<PendingOrder>.from(json["today_delivery"]!.map((x) => PendingOrder.fromJson(x))),
    pendingOrders: json["pending_orders"] == null ? [] : List<PendingOrder>.from(json["pending_orders"]!.map((x) => PendingOrder.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "addresslist": addresslist?.toJson(),
    "mobile_number": mobileNumber,
    "email_id": emailId,
    "outstanding": outstanding,
    "wallet_bal": walletBal,
    "today_delivery": todayDelivery == null ? [] : List<dynamic>.from(todayDelivery!.map((x) => x.toJson())),
    "pending_orders": pendingOrders == null ? [] : List<dynamic>.from(pendingOrders!.map((x) => x.toJson())),
  };
}

class Addresslist {
  final String? name;
  final String? customerType;
  final String? buildingNo;
  final String? roomNo;
  final String? buildingName;
  final String? floorNumber;
  final String? flatNumber;

  Addresslist({
    this.name,
    this.customerType,
    this.buildingNo,
    this.roomNo,
    this.buildingName,
    this.floorNumber,
    this.flatNumber,
  });

  factory Addresslist.fromJson(Map<String, dynamic> json) => Addresslist(
    name: json["name"],
    customerType: json["customer_type"],
    buildingNo: json["building_no"],
    roomNo: json["room_no"],
    buildingName: json["building_name"],
    floorNumber: json["floor_number"],
    flatNumber: json["flat_number"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "customer_type": customerType,
    "building_no": buildingNo,
    "room_no": roomNo,
    "building_name": buildingName,
    "floor_number": floorNumber,
    "flat_number": flatNumber,
  };
}

class PendingOrder {
  final String? cartId;
  final Order? order;
  final String? quantity;
  final ItemService? itemService;

  PendingOrder({
    this.cartId,
    this.order,
    this.quantity,
    this.itemService,
  });

  factory PendingOrder.fromJson(Map<String, dynamic> json) => PendingOrder(
    cartId: json["cart_id"],
    order: json["order"] == null ? null : Order.fromJson(json["order"]),
    quantity: json["quantity"],
    itemService: json["item_service"] == null ? null : ItemService.fromJson(json["item_service"]),
  );

  Map<String, dynamic> toJson() => {
    "cart_id": cartId,
    "order": order?.toJson(),
    "quantity": quantity,
    "item_service": itemService?.toJson(),
  };
}

class ItemService {
  final Category? category;
  final SubCategory? subCategory;

  ItemService({
    this.category,
    this.subCategory,
  });

  factory ItemService.fromJson(Map<String, dynamic> json) => ItemService(
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    subCategory: json["sub_category"] == null ? null : SubCategory.fromJson(json["sub_category"]),
  );

  Map<String, dynamic> toJson() => {
    "category": category?.toJson(),
    "sub_category": subCategory?.toJson(),
  };
}

class Category {
  final String? categoryId;
  final ServiceMaster? serviceMaster;

  Category({
    this.categoryId,
    this.serviceMaster,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryId: json["category_id"],
    serviceMaster: json["service_master"] == null ? null : ServiceMaster.fromJson(json["service_master"]),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "service_master": serviceMaster?.toJson(),
  };
}

class ServiceMaster {
  final CategoryName? categoryName;
  final CategoryImage? categoryImage;

  ServiceMaster({
    this.categoryName,
    this.categoryImage,
  });

  factory ServiceMaster.fromJson(Map<String, dynamic> json) => ServiceMaster(
    categoryName: categoryNameValues.map[json["category_name"]]!,
    categoryImage: categoryImageValues.map[json["category_image"]]!,
  );

  Map<String, dynamic> toJson() => {
    "category_name": categoryNameValues.reverse[categoryName],
    "category_image": categoryImageValues.reverse[categoryImage],
  };
}

enum CategoryImage {
  MEDIA_DRY_JPEG,
  MEDIA_WASHING_J_NM_ZN9_M_JPG
}

final categoryImageValues = EnumValues({
  "/media/dry.jpeg": CategoryImage.MEDIA_DRY_JPEG,
  "/media/washing_jNMZn9m.jpg": CategoryImage.MEDIA_WASHING_J_NM_ZN9_M_JPG
});

enum CategoryName {
  DRY_CLEANING,
  WASH_ONLY
}

final categoryNameValues = EnumValues({
  "Dry Cleaning": CategoryName.DRY_CLEANING,
  "Wash Only": CategoryName.WASH_ONLY
});

class SubCategory {
  final String? subCatId;
  final SubServiceMaster? subServiceMaster;

  SubCategory({
    this.subCatId,
    this.subServiceMaster,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    subCatId: json["sub_cat_id"],
    subServiceMaster: json["sub_service_master"] == null ? null : SubServiceMaster.fromJson(json["sub_service_master"]),
  );

  Map<String, dynamic> toJson() => {
    "sub_cat_id": subCatId,
    "sub_service_master": subServiceMaster?.toJson(),
  };
}

class SubServiceMaster {
  final SubCatName? subCatName;
  final SubCatImage? subCatImage;

  SubServiceMaster({
    this.subCatName,
    this.subCatImage,
  });

  factory SubServiceMaster.fromJson(Map<String, dynamic> json) => SubServiceMaster(
    subCatName: subCatNameValues.map[json["sub_cat_name"]]!,
    subCatImage: subCatImageValues.map[json["sub_cat_image"]]!,
  );

  Map<String, dynamic> toJson() => {
    "sub_cat_name": subCatNameValues.reverse[subCatName],
    "sub_cat_image": subCatImageValues.reverse[subCatImage],
  };
}

enum SubCatImage {
  MEDIA_DRY_5_C_JHKJO_JPEG,
  MEDIA_HAND_WASHING_D_A_ZQYRZ_JPG
}

final subCatImageValues = EnumValues({
  "/media/dry_5CJhkjo.jpeg": SubCatImage.MEDIA_DRY_5_C_JHKJO_JPEG,
  "/media/hand_washing_dAZqyrz.jpg": SubCatImage.MEDIA_HAND_WASHING_D_A_ZQYRZ_JPG
});

enum SubCatName {
  DRY_CLEANING,
  ONLY_WASHING
}

final subCatNameValues = EnumValues({
  "Dry Cleaning": SubCatName.DRY_CLEANING,
  "Only Washing": SubCatName.ONLY_WASHING
});

class Order {
  final String? orderId;
  final String? orderNumber;
  final String? totalAmount;
  final OrderType? orderType;
  final DateTime? orderDate;
  final Status? status;
  final DateTime? deliveryDate;
  var invoiceNumber;
  var invoiceDate;
  var amountPaid;
  var balanceAmount;

  Order({
    this.orderId,
    this.orderNumber,
    this.totalAmount,
    this.orderType,
    this.orderDate,
    this.status,
    this.deliveryDate,
    this.invoiceNumber,
    this.invoiceDate,
    this.amountPaid,
    this.balanceAmount,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderId: json["order_id"],
    orderNumber: json["order_number"],
    totalAmount: json["total_amount"],
    orderType: orderTypeValues.map[json["order_type"]]!,
    orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
    status: statusValues.map[json["status"]]!,
    deliveryDate: json["Delivery_date"] == null ? null : DateTime.parse(json["Delivery_date"]),
    invoiceNumber: json["invoice_number"],
    invoiceDate: json["invoice_date"],
    amountPaid: json["amount_paid"],
    balanceAmount: json["balance_amount"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "order_number": orderNumber,
    "total_amount": totalAmount,
    "order_type": orderTypeValues.reverse[orderType],
    "order_date": "${orderDate!.year.toString().padLeft(4, '0')}-${orderDate!.month.toString().padLeft(2, '0')}-${orderDate!.day.toString().padLeft(2, '0')}",
    "status": statusValues.reverse[status],
    "Delivery_date": "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
    "invoice_number": invoiceNumber,
    "invoice_date": invoiceDate,
    "amount_paid": amountPaid,
    "balance_amount": balanceAmount,
  };
}

enum OrderType {
  NORMAL,
  URGENT
}

final orderTypeValues = EnumValues({
  "Normal": OrderType.NORMAL,
  "Urgent": OrderType.URGENT
});

enum Status {
  CONFIRMED,
  ITEMS_COLLECTED,
  READY_FOR_DELIVERY
}

final statusValues = EnumValues({
  "Confirmed": Status.CONFIRMED,
  "Items Collected": Status.ITEMS_COLLECTED,
  "Ready For Delivery": Status.READY_FOR_DELIVERY
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}