import 'dart:convert';

class LocationPriceGroupModel {
  bool status;
  Datas data;
  String message;

  LocationPriceGroupModel({
    required this.status,
    required this.data,
    required this.message,
  });

  LocationPriceGroupModel copyWith({
    bool? status,
    Datas? data,
    String? message,
  }) =>
      LocationPriceGroupModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory LocationPriceGroupModel.fromRawJson(String str) => LocationPriceGroupModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationPriceGroupModel.fromJson(Map<String, dynamic> json) => LocationPriceGroupModel(
    status: json["status"],
    data: Datas.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class Datas {
  CustomerTypeList customerTypeList;
  List<LocationList> locationList;
  List<PriceGroupList> priceGroupList;

  Datas({
    required this.customerTypeList,
    required this.locationList,
    required this.priceGroupList,
  });

  Datas copyWith({
    CustomerTypeList? customerTypeList,
    List<LocationList>? locationList,
    List<PriceGroupList>? priceGroupList,
  }) =>
      Datas(
        customerTypeList: customerTypeList ?? this.customerTypeList, 
        locationList: locationList ?? this.locationList,
        priceGroupList: priceGroupList ?? this.priceGroupList,
      );

  factory Datas.fromRawJson(String str) => Datas.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datas.fromJson(Map<String, dynamic> json) => Datas(
    customerTypeList: CustomerTypeList.fromJson(json["customer_type_list"]),
    locationList: List<LocationList>.from(json["location_list"].map((x) => LocationList.fromJson(x))),
    priceGroupList: List<PriceGroupList>.from(json["price_group_list"].map((x) => PriceGroupList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "customer_type_list": customerTypeList.toJson(),
    "location_list": List<dynamic>.from(locationList.map((x) => x.toJson())),
    "price_group_list": List<dynamic>.from(priceGroupList.map((x) => x.toJson())),
  };
}

class CustomerTypeList {
  String home;
  String coOperate;

  CustomerTypeList({
    required this.home,
    required this.coOperate,
  });

  CustomerTypeList copyWith({
    String? home,
    String? coOperate,
  }) =>
      CustomerTypeList(
        home: home ?? this.home,
        coOperate: coOperate ?? this.coOperate,
      );

  factory CustomerTypeList.fromRawJson(String str) => CustomerTypeList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomerTypeList.fromJson(Map<String, dynamic> json) => CustomerTypeList(
    home: json["Home"],
    coOperate: json["Co-operate"],
  );

  Map<String, dynamic> toJson() => {
    "Home": home,
    "Co-operate": coOperate,
  };
}

class LocationList {
  String locationId;
  dynamic createdBy;
  DateTime createdDate;
  String name;
  bool isDlt;
  String area;

  LocationList({
    required this.locationId,
    required this.createdBy,
    required this.createdDate,
    required this.name,
    required this.isDlt,
    required this.area,
  });

  LocationList copyWith({
    String? locationId,
    dynamic createdBy,
    DateTime? createdDate,
    String? name,
    bool? isDlt,
    String? area,
  }) =>
      LocationList(
        locationId: locationId ?? this.locationId,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        name: name ?? this.name,
        isDlt: isDlt ?? this.isDlt,
        area: area ?? this.area,
      );

  factory LocationList.fromRawJson(String str) => LocationList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationList.fromJson(Map<String, dynamic> json) => LocationList(
    locationId: json["location_id"],
    createdBy: json["created_by"],
    createdDate: DateTime.parse(json["created_date"]),
    name: json["name"],
    isDlt: json["is_dlt"],
    area: json["area"],
  );

  Map<String, dynamic> toJson() => {
    "location_id": locationId,
    "created_by": createdBy,
    "created_date": createdDate.toIso8601String(),
    "name": name,
    "is_dlt": isDlt,
    "area": area,
  };
}

class PriceGroupList {
  String priceGroupId;
  dynamic createdBy;
  DateTime createdAt;
  String name;
  bool isDelete;

  PriceGroupList({
    required this.priceGroupId,
    required this.createdBy,
    required this.createdAt,
    required this.name,
    required this.isDelete,
  });

  PriceGroupList copyWith({
    String? priceGroupId,
    dynamic createdBy,
    DateTime? createdAt,
    String? name,
    bool? isDelete,
  }) =>
      PriceGroupList(
        priceGroupId: priceGroupId ?? this.priceGroupId,
        createdBy: createdBy ?? this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        isDelete: isDelete ?? this.isDelete,
      );

  factory PriceGroupList.fromRawJson(String str) => PriceGroupList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PriceGroupList.fromJson(Map<String, dynamic> json) => PriceGroupList(
    priceGroupId: json["price_group_id"],
    createdBy: json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    name: json["name"],
    isDelete: json["is_delete"],
  );

  Map<String, dynamic> toJson() => {
    "price_group_id": priceGroupId,
    "created_by": createdBy,
    "created_at": createdAt.toIso8601String(),
    "name": name,
    "is_delete": isDelete,
  };
}
