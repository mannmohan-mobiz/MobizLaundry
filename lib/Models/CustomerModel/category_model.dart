import 'dart:convert';

class CustomerCategoryModel {
  bool status;
  List<Datum> data;
  String message;

  CustomerCategoryModel({
    required this.status,
    required this.data,
    required this.message,
  });

  CustomerCategoryModel copyWith({
    bool? status,
    List<Datum>? data,
    String? message,
  }) =>
      CustomerCategoryModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory CustomerCategoryModel.fromRawJson(String str) => CustomerCategoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomerCategoryModel.fromJson(Map<String, dynamic> json) => CustomerCategoryModel(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  String categoryId;
  String categoryName;
  ServiceMaster serviceMaster;

  Datum({
    required this.categoryId,
    required this.categoryName,
    required this.serviceMaster,
  });

  Datum copyWith({
    String? categoryId,
    String? categoryName,
    ServiceMaster? serviceMaster,
  }) =>
      Datum(
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
        serviceMaster: serviceMaster ?? this.serviceMaster,
      );

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    serviceMaster: ServiceMaster.fromJson(json["service_master"]),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "service_master": serviceMaster.toJson(),
  };
}

class ServiceMaster {
  String categoryImage;

  ServiceMaster({
    required this.categoryImage,
  });

  ServiceMaster copyWith({
    String? categoryImage,
  }) =>
      ServiceMaster(
        categoryImage: categoryImage ?? this.categoryImage,
      );

  factory ServiceMaster.fromRawJson(String str) => ServiceMaster.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceMaster.fromJson(Map<String, dynamic> json) => ServiceMaster(
    categoryImage: json["category_image"],
  );

  Map<String, dynamic> toJson() => {
    "category_image": categoryImage,
  };
}
