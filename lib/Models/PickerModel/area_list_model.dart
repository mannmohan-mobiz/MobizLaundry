/// status : true
/// data : {"area_list":[{"area_id":"1b26cdc2-c3d6-4361-87ea-7b611551e82d","created_by":"mobiz","created_date":"2023-11-07T04:31:11.374904Z","name":"Al Nahda","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"263c1d1c-809e-439c-9236-a2f92931bf3e","created_by":"mobiz","created_date":"2023-11-06T16:57:45.461231Z","name":"Jumerirah","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"8403c320-f36c-4019-ae03-54c7b45a1c14","created_by":"mobiz","created_date":"2023-11-06T16:56:47.996780Z","name":"Jumeriah Village","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"5faa4ae5-67dd-42de-9e0e-dc4edc182e4a","created_by":"mobiz","created_date":"2023-11-06T16:56:01.564727Z","name":"Palm Jumeriah","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"6874f3fb-96be-4e16-b256-6ee5534b239d","created_by":"mobiz","created_date":"2023-11-06T16:55:46.759116Z","name":"IMPZ","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"0c77e8a3-ccc1-4986-88a2-0607f003cf08","created_by":"mobiz","created_date":"2023-11-06T16:55:39.230412Z","name":"Al Quoz","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"765c7d9e-f1f8-4620-953c-145662493547","created_by":"mobiz","created_date":"2023-11-06T16:55:34.332065Z","name":"Al Barsha","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"59d682a2-3b6f-462f-994a-3e4a2affd185","created_by":"mobiz","created_date":"2023-11-06T16:55:25.887791Z","name":"Discovery Garden","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"1d977c69-6988-4670-9df6-6fc800aec0ad","created_by":"mobiz","created_date":"2023-11-06T16:55:16.663629Z","name":"AL Quoz","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"}]}
/// message : "Successfully Passed Data!"

class AreaListModel {
  AreaListModel({
      bool? status,
    AreaData? data,
      String? message,}){
    _status = status;
    _data = data;
    _message = message;
}

  AreaListModel.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? AreaData.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _status;
  AreaData? _data;
  String? _message;
AreaListModel copyWith({  bool? status,
  AreaData? data,
  String? message,
}) => AreaListModel(  status: status ?? _status,
  data: data ?? _data,
  message: message ?? _message,
);
  bool? get status => _status;
  AreaData? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// area_list : [{"area_id":"1b26cdc2-c3d6-4361-87ea-7b611551e82d","created_by":"mobiz","created_date":"2023-11-07T04:31:11.374904Z","name":"Al Nahda","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"263c1d1c-809e-439c-9236-a2f92931bf3e","created_by":"mobiz","created_date":"2023-11-06T16:57:45.461231Z","name":"Jumerirah","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"8403c320-f36c-4019-ae03-54c7b45a1c14","created_by":"mobiz","created_date":"2023-11-06T16:56:47.996780Z","name":"Jumeriah Village","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"5faa4ae5-67dd-42de-9e0e-dc4edc182e4a","created_by":"mobiz","created_date":"2023-11-06T16:56:01.564727Z","name":"Palm Jumeriah","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"6874f3fb-96be-4e16-b256-6ee5534b239d","created_by":"mobiz","created_date":"2023-11-06T16:55:46.759116Z","name":"IMPZ","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"0c77e8a3-ccc1-4986-88a2-0607f003cf08","created_by":"mobiz","created_date":"2023-11-06T16:55:39.230412Z","name":"Al Quoz","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"765c7d9e-f1f8-4620-953c-145662493547","created_by":"mobiz","created_date":"2023-11-06T16:55:34.332065Z","name":"Al Barsha","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"59d682a2-3b6f-462f-994a-3e4a2affd185","created_by":"mobiz","created_date":"2023-11-06T16:55:25.887791Z","name":"Discovery Garden","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"1d977c69-6988-4670-9df6-6fc800aec0ad","created_by":"mobiz","created_date":"2023-11-06T16:55:16.663629Z","name":"AL Quoz","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"}]

class AreaData {
  AreaData({
      List<AreaList>? areaList,}){
    _areaList = areaList;
}

  AreaData.fromJson(dynamic json) {
    if (json['area_list'] != null) {
      _areaList = [];
      json['area_list'].forEach((v) {
        _areaList?.add(AreaList.fromJson(v));
      });
    }
  }
  List<AreaList>? _areaList;
  AreaData copyWith({  List<AreaList>? areaList,
}) => AreaData(  areaList: areaList ?? _areaList,
);
  List<AreaList>? get areaList => _areaList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_areaList != null) {
      map['area_list'] = _areaList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// area_id : "1b26cdc2-c3d6-4361-87ea-7b611551e82d"
/// created_by : "mobiz"
/// created_date : "2023-11-07T04:31:11.374904Z"
/// name : "Al Nahda"
/// is_dlt : false
/// emirate : "d6795abd-31e1-41a7-8c03-e0548b14b5e7"

class AreaList {
  AreaList({
      String? areaId, 
      String? createdBy, 
      String? createdDate, 
      String? name, 
      bool? isDlt, 
      String? emirate,}){
    _areaId = areaId;
    _createdBy = createdBy;
    _createdDate = createdDate;
    _name = name;
    _isDlt = isDlt;
    _emirate = emirate;
}

  AreaList.fromJson(dynamic json) {
    _areaId = json['area_id'];
    _createdBy = json['created_by'];
    _createdDate = json['created_date'];
    _name = json['name'];
    _isDlt = json['is_dlt'];
    _emirate = json['emirate'];
  }
  String? _areaId;
  String? _createdBy;
  String? _createdDate;
  String? _name;
  bool? _isDlt;
  String? _emirate;
AreaList copyWith({  String? areaId,
  String? createdBy,
  String? createdDate,
  String? name,
  bool? isDlt,
  String? emirate,
}) => AreaList(  areaId: areaId ?? _areaId,
  createdBy: createdBy ?? _createdBy,
  createdDate: createdDate ?? _createdDate,
  name: name ?? _name,
  isDlt: isDlt ?? _isDlt,
  emirate: emirate ?? _emirate,
);
  String? get areaId => _areaId;
  String? get createdBy => _createdBy;
  String? get createdDate => _createdDate;
  String? get name => _name;
  bool? get isDlt => _isDlt;
  String? get emirate => _emirate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['area_id'] = _areaId;
    map['created_by'] = _createdBy;
    map['created_date'] = _createdDate;
    map['name'] = _name;
    map['is_dlt'] = _isDlt;
    map['emirate'] = _emirate;
    return map;
  }

}