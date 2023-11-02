import 'dart:convert';

class PickerSubCategoryModel {
  bool status;
  List<PckSubCategList> data;
  String message;

  PickerSubCategoryModel({
    required this.status,
    required this.data,
    required this.message,
  });

  PickerSubCategoryModel copyWith({
    bool? status,
    List<PckSubCategList>? data,
    String? message,
  }) =>
      PickerSubCategoryModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory PickerSubCategoryModel.fromRawJson(String str) => PickerSubCategoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PickerSubCategoryModel.fromJson(Map<String, dynamic> json) => PickerSubCategoryModel(
    status: json["status"],
    data: List<PckSubCategList>.from(json["data"].map((x) => PckSubCategList.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class PckSubCategList {
  String subCatId;
  String subCatName;
  SubServiceMaster subServiceMaster;
  BranchMainService branchMainService;

  PckSubCategList({
    required this.subCatId,
    required this.subCatName,
    required this.subServiceMaster,
    required this.branchMainService,
  });

  PckSubCategList copyWith({
    String? subCatId,
    String? subCatName,
    SubServiceMaster? subServiceMaster,
    BranchMainService? branchMainService,
  }) =>
      PckSubCategList(
        subCatId: subCatId ?? this.subCatId,
        subCatName: subCatName ?? this.subCatName,
        subServiceMaster: subServiceMaster ?? this.subServiceMaster,
        branchMainService: branchMainService ?? this.branchMainService,
      );

  factory PckSubCategList.fromRawJson(String str) => PckSubCategList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PckSubCategList.fromJson(Map<String, dynamic> json) => PckSubCategList(
    subCatId: json["sub_cat_id"],
    subCatName: json["sub_cat_name"],
    subServiceMaster: SubServiceMaster.fromJson(json["sub_service_master"]),
    branchMainService: BranchMainService.fromJson(json["branch_main_service"]),
  );

  Map<String, dynamic> toJson() => {
    "sub_cat_id": subCatId,
    "sub_cat_name": subCatName,
    "sub_service_master": subServiceMaster.toJson(),
    "branch_main_service": branchMainService.toJson(),
  };
}

class BranchMainService {
  String categoryId;
  String categoryName;
  ServiceMaster serviceMaster;

  BranchMainService({
    required this.categoryId,
    required this.categoryName,
    required this.serviceMaster,
  });

  BranchMainService copyWith({
    String? categoryId,
    String? categoryName,
    ServiceMaster? serviceMaster,
  }) =>
      BranchMainService(
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
        serviceMaster: serviceMaster ?? this.serviceMaster,
      );

  factory BranchMainService.fromRawJson(String str) => BranchMainService.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BranchMainService.fromJson(Map<String, dynamic> json) => BranchMainService(
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

class SubServiceMaster {
  String subCatImage;

  SubServiceMaster({
    required this.subCatImage,
  });

  SubServiceMaster copyWith({
    String? subCatImage,
  }) =>
      SubServiceMaster(
        subCatImage: subCatImage ?? this.subCatImage,
      );

  factory SubServiceMaster.fromRawJson(String str) => SubServiceMaster.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubServiceMaster.fromJson(Map<String, dynamic> json) => SubServiceMaster(
    subCatImage: json["sub_cat_image"],
  );

  Map<String, dynamic> toJson() => {
    "sub_cat_image": subCatImage,
  };
}
