/// status : true
/// data : {"location_list":[{"location_id":"7a5bbc12-b6b2-47df-9729-21b41e18fb9a","created_by":"mobiz","created_date":"2023-11-06T17:09:49.785938Z","name":"Al Quoz 4","area":"0c77e8a3-ccc1-4986-88a2-0607f003cf08"},{"location_id":"8ee6890a-3eb2-4b44-ae9d-1aeb6f9bf3c0","created_by":"mobiz","created_date":"2023-11-06T17:09:42.632749Z","name":"Al Quoz 2","area":"0c77e8a3-ccc1-4986-88a2-0607f003cf08"},{"location_id":"e6b5a8d4-23da-481d-b729-a6c6dc74bfea","created_by":"mobiz","created_date":"2023-11-06T17:09:27.974112Z","name":"Al Khail Gate","area":"0c77e8a3-ccc1-4986-88a2-0607f003cf08"},{"location_id":"3b6e3c66-7076-40e0-87bb-4e139ad0a715","created_by":"mobiz","created_date":"2023-11-06T16:58:27.020436Z","name":"35 B Street","area":"0c77e8a3-ccc1-4986-88a2-0607f003cf08"}]}
/// message : "Successfully Passed Data!"

class LocationListModel {
  LocationListModel({
      bool? status,
    LocationData? data,
      String? message,}){
    _status = status;
    _data = data;
    _message = message;
}

  LocationListModel.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? LocationData.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _status;
  LocationData? _data;
  String? _message;
LocationListModel copyWith({  bool? status,
  LocationData? data,
  String? message,
}) => LocationListModel(  status: status ?? _status,
  data: data ?? _data,
  message: message ?? _message,
);
  bool? get status => _status;
  LocationData? get data => _data;
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

/// location_list : [{"location_id":"7a5bbc12-b6b2-47df-9729-21b41e18fb9a","created_by":"mobiz","created_date":"2023-11-06T17:09:49.785938Z","name":"Al Quoz 4","area":"0c77e8a3-ccc1-4986-88a2-0607f003cf08"},{"location_id":"8ee6890a-3eb2-4b44-ae9d-1aeb6f9bf3c0","created_by":"mobiz","created_date":"2023-11-06T17:09:42.632749Z","name":"Al Quoz 2","area":"0c77e8a3-ccc1-4986-88a2-0607f003cf08"},{"location_id":"e6b5a8d4-23da-481d-b729-a6c6dc74bfea","created_by":"mobiz","created_date":"2023-11-06T17:09:27.974112Z","name":"Al Khail Gate","area":"0c77e8a3-ccc1-4986-88a2-0607f003cf08"},{"location_id":"3b6e3c66-7076-40e0-87bb-4e139ad0a715","created_by":"mobiz","created_date":"2023-11-06T16:58:27.020436Z","name":"35 B Street","area":"0c77e8a3-ccc1-4986-88a2-0607f003cf08"}]

class LocationData {
  LocationData({
      List<LocationList>? locationList,}){
    _locationList = locationList;
}

  LocationData.fromJson(dynamic json) {
    if (json['location_list'] != null) {
      _locationList = [];
      json['location_list'].forEach((v) {
        _locationList?.add(LocationList.fromJson(v));
      });
    }
  }
  List<LocationList>? _locationList;
  LocationData copyWith({  List<LocationList>? locationList,
}) => LocationData(  locationList: locationList ?? _locationList,
);
  List<LocationList>? get locationList => _locationList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_locationList != null) {
      map['location_list'] = _locationList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// location_id : "7a5bbc12-b6b2-47df-9729-21b41e18fb9a"
/// created_by : "mobiz"
/// created_date : "2023-11-06T17:09:49.785938Z"
/// name : "Al Quoz 4"
/// area : "0c77e8a3-ccc1-4986-88a2-0607f003cf08"

class LocationList {
  LocationList({
      String? locationId, 
      String? createdBy, 
      String? createdDate, 
      String? name, 
      String? area,}){
    _locationId = locationId;
    _createdBy = createdBy;
    _createdDate = createdDate;
    _name = name;
    _area = area;
}

  LocationList.fromJson(dynamic json) {
    _locationId = json['location_id'];
    _createdBy = json['created_by'];
    _createdDate = json['created_date'];
    _name = json['name'];
    _area = json['area'];
  }
  String? _locationId;
  String? _createdBy;
  String? _createdDate;
  String? _name;
  String? _area;
LocationList copyWith({  String? locationId,
  String? createdBy,
  String? createdDate,
  String? name,
  String? area,
}) => LocationList(  locationId: locationId ?? _locationId,
  createdBy: createdBy ?? _createdBy,
  createdDate: createdDate ?? _createdDate,
  name: name ?? _name,
  area: area ?? _area,
);
  String? get locationId => _locationId;
  String? get createdBy => _createdBy;
  String? get createdDate => _createdDate;
  String? get name => _name;
  String? get area => _area;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['location_id'] = _locationId;
    map['created_by'] = _createdBy;
    map['created_date'] = _createdDate;
    map['name'] = _name;
    map['area'] = _area;
    return map;
  }

}