import 'dart:convert';

class PickerCategoryModel {
    bool status;
    List<PCatList> data;
    String message;

    PickerCategoryModel({
        required this.status,
        required this.data,
        required this.message,
    });

    PickerCategoryModel copyWith({
        bool? status,
        List<PCatList>? data,
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
        data: List<PCatList>.from(json["data"].map((x) => PCatList.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class PCatList {
    String categoryId;
    String categoryName;
    ServiceMaster serviceMaster;

    PCatList({
        required this.categoryId,
        required this.categoryName,
        required this.serviceMaster,
    });

    PCatList copyWith({
        String? categoryId,
        String? categoryName,
        ServiceMaster? serviceMaster,
    }) => 
        PCatList(
            categoryId: categoryId ?? this.categoryId,
            categoryName: categoryName ?? this.categoryName,
            serviceMaster: serviceMaster ?? this.serviceMaster,
        );

    factory PCatList.fromRawJson(String str) => PCatList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PCatList.fromJson(Map<String, dynamic> json) => PCatList(
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
    String serviceMasterId;
    String categoryImage;

    ServiceMaster({
        required this.serviceMasterId,
        required this.categoryImage,
    });

    ServiceMaster copyWith({
        String? serviceMasterId,
        String? categoryImage,
    }) => 
        ServiceMaster(
            serviceMasterId: serviceMasterId ?? this.serviceMasterId,
            categoryImage: categoryImage ?? this.categoryImage,
        );

    factory ServiceMaster.fromRawJson(String str) => ServiceMaster.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ServiceMaster.fromJson(Map<String, dynamic> json) => ServiceMaster(
        serviceMasterId: json["service_master_id"],
        categoryImage: json["category_image"],
    );

    Map<String, dynamic> toJson() => {
        "service_master_id": serviceMasterId,
        "category_image": categoryImage,
    };
}
