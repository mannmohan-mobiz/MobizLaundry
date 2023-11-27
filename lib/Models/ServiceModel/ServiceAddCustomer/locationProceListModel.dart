import 'dart:convert';

class ServiceLocationPriceListModel {
  bool status;
  LocPrcData data;
  String message;

  ServiceLocationPriceListModel({
    required this.status,
    required this.data,
    required this.message,
  });

  ServiceLocationPriceListModel copyWith({
    bool? status,
    LocPrcData? data,
    String? message,
  }) =>
      ServiceLocationPriceListModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory ServiceLocationPriceListModel.fromRawJson(String str) => ServiceLocationPriceListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceLocationPriceListModel.fromJson(Map<String, dynamic> json) => ServiceLocationPriceListModel(
    status: json["status"],
    data: LocPrcData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class LocPrcData {
  CustomerTypeList customerTypeList;
  List<LocationList> locationList;
  List<PriceGroupList> priceGroupList;

  LocPrcData({
    required this.customerTypeList,
    required this.locationList,
    required this.priceGroupList,
  });

  LocPrcData copyWith({
    CustomerTypeList? customerTypeList,
    List<LocationList>? locationList,
    List<PriceGroupList>? priceGroupList,
  }) =>
      LocPrcData(
        customerTypeList: customerTypeList ?? this.customerTypeList,
        locationList: locationList ?? this.locationList,
        priceGroupList: priceGroupList ?? this.priceGroupList,
      );

  factory LocPrcData.fromRawJson(String str) => LocPrcData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocPrcData.fromJson(Map<String, dynamic> json) => LocPrcData(
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
  String createdBy;
  DateTime createdDate;
  String name;
  String area;

  LocationList({
    required this.locationId,
    required this.createdBy,
    required this.createdDate,
    required this.name,
    required this.area,
  });

  LocationList copyWith({
    String? locationId,
    String? createdBy,
    DateTime? createdDate,
    String? name,
    String? area,
  }) =>
      LocationList(
        locationId: locationId ?? this.locationId,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        name: name ?? this.name,
        area: area ?? this.area,
      );

  factory LocationList.fromRawJson(String str) => LocationList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationList.fromJson(Map<String, dynamic> json) => LocationList(
    locationId: json["location_id"],
    createdBy: json["created_by"],
    createdDate: DateTime.parse(json["created_date"]),
    name: json["name"],
    area: json["area"],
  );

  Map<String, dynamic> toJson() => {
    "location_id": locationId,
    "created_by": createdBy,
    "created_date": createdDate.toIso8601String(),
    "name": name,
    "area": area,
  };
}

class PriceGroupList {
  String priceGroupId;
  dynamic createdBy;
  DateTime createdAt;
  String name;

  PriceGroupList({
    required this.priceGroupId,
    required this.createdBy,
    required this.createdAt,
    required this.name,
  });

  PriceGroupList copyWith({
    String? priceGroupId,
    dynamic createdBy,
    DateTime? createdAt,
    String? name,
  }) =>
      PriceGroupList(
        priceGroupId: priceGroupId ?? this.priceGroupId,
        createdBy: createdBy ?? this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
      );

  factory PriceGroupList.fromRawJson(String str) => PriceGroupList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PriceGroupList.fromJson(Map<String, dynamic> json) => PriceGroupList(
    priceGroupId: json["price_group_id"],
    createdBy: json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "price_group_id": priceGroupId,
    "created_by": createdBy,
    "created_at": createdAt.toIso8601String(),
    "name": name,
  };
}
