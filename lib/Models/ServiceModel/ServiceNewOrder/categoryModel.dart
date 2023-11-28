import 'dart:convert';

ServiceCatgoryModel serviceCatgoryModelFromJson(String str) => ServiceCatgoryModel.fromJson(json.decode(str));

String serviceCatgoryModelToJson(ServiceCatgoryModel data) => json.encode(data.toJson());

class ServiceCatgoryModel {
    final bool status;
    final List<CategoryData> data;
    final String message;

    ServiceCatgoryModel({
        required this.status,
        required this.data,
        required this.message,
    });

    ServiceCatgoryModel copyWith({
        bool? status,
        List<CategoryData>? data,
        String? message,
    }) => 
        ServiceCatgoryModel(
            status: status ?? this.status,
            data: data ?? this.data,
            message: message ?? this.message,
        );

    factory ServiceCatgoryModel.fromJson(Map<String, dynamic> json) => ServiceCatgoryModel(
        status: json["status"],
        data: List<CategoryData>.from(json["data"].map((x) => CategoryData.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class CategoryData {
    final String categoryId;
    final ServiceMaster serviceMaster;

    CategoryData({
        required this.categoryId,
        required this.serviceMaster,
    });

    CategoryData copyWith({
        String? categoryId,
        ServiceMaster? serviceMaster,
    }) => 
        CategoryData(
            categoryId: categoryId ?? this.categoryId,
            serviceMaster: serviceMaster ?? this.serviceMaster,
        );

    factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        categoryId: json["category_id"],
        serviceMaster: ServiceMaster.fromJson(json["service_master"]),
    );

    Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "service_master": serviceMaster.toJson(),
    };
}

class ServiceMaster {
    final String categoryName;
    final String categoryImage;

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

    factory ServiceMaster.fromJson(Map<String, dynamic> json) => ServiceMaster(
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
    );

    Map<String, dynamic> toJson() => {
        "category_name": categoryName,
        "category_image": categoryImage,
    };
}
