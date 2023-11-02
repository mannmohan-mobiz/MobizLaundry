import 'dart:convert';

class PickerCategoryModel {
    bool status;
    List<PckCategList> data;
    String message;

    PickerCategoryModel({
        required this.status,
        required this.data,
        required this.message,
    });

    PickerCategoryModel copyWith({
        bool? status,
        List<PckCategList>? data,
        String? message,
    }) =>
        PickerCategoryModel(
            status: status ?? this.status,
            data: data ?? this.data,
            message: message ?? this.message,
        );

    factory PickerCategoryModel.fromRawJson(String str) => PickerCategoryModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PickerCategoryModel.fromJson(Map<String, dynamic> json) => PickerCategoryModel(
        status: json["status"],
        data: List<PckCategList>.from(json["data"].map((x) => PckCategList.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class PckCategList {
    String categoryId;
    String categoryName;
    ServiceMaster serviceMaster;

    PckCategList({
        required this.categoryId,
        required this.categoryName,
        required this.serviceMaster,
    });

    PckCategList copyWith({
        String? categoryId,
        String? categoryName,
        ServiceMaster? serviceMaster,
    }) =>
        PckCategList(
            categoryId: categoryId ?? this.categoryId,
            categoryName: categoryName ?? this.categoryName,
            serviceMaster: serviceMaster ?? this.serviceMaster,
        );

    factory PckCategList.fromRawJson(String str) => PckCategList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PckCategList.fromJson(Map<String, dynamic> json) => PckCategList(
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
