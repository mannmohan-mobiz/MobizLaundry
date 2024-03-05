/// status : true
/// data : {"emirates_list":[{"emirate_id":"d6795abd-31e1-41a7-8c03-e0548b14b5e7","country":{"country_id":"5cc7186b-5417-4676-827b-61fa95d0e2e2","created_by":"mobiz","created_date":"2023-11-06T16:52:27.407878Z","name":"UAE","is_dlt":false},"created_by":"mobiz","created_date":"2023-11-06T16:53:00.260563Z","name":"Dubai","is_dlt":false}]}
/// message : "Successfully Passed Data!"

class EmiratesListModel {
  EmiratesListModel({
      bool? status,
    EmiratesData? data,
      String? message,}){
    _status = status;
    _data = data;
    _message = message;
}

  EmiratesListModel.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? EmiratesData.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _status;
  EmiratesData? _data;
  String? _message;
EmiratesListModel copyWith({  bool? status,
  EmiratesData? data,
  String? message,
}) => EmiratesListModel(  status: status ?? _status,
  data: data ?? _data,
  message: message ?? _message,
);
  bool? get status => _status;
  EmiratesData? get data => _data;
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

/// emirates_list : [{"emirate_id":"d6795abd-31e1-41a7-8c03-e0548b14b5e7","country":{"country_id":"5cc7186b-5417-4676-827b-61fa95d0e2e2","created_by":"mobiz","created_date":"2023-11-06T16:52:27.407878Z","name":"UAE","is_dlt":false},"created_by":"mobiz","created_date":"2023-11-06T16:53:00.260563Z","name":"Dubai","is_dlt":false}]

class EmiratesData {
  EmiratesData({
      List<EmiratesList>? emiratesList,}){
    _emiratesList = emiratesList;
}

  EmiratesData.fromJson(dynamic json) {
    if (json['emirates_list'] != null) {
      _emiratesList = [];
      json['emirates_list'].forEach((v) {
        _emiratesList?.add(EmiratesList.fromJson(v));
      });
    }
  }
  List<EmiratesList>? _emiratesList;
  EmiratesData copyWith({  List<EmiratesList>? emiratesList,
}) => EmiratesData(  emiratesList: emiratesList ?? _emiratesList,
);
  List<EmiratesList>? get emiratesList => _emiratesList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_emiratesList != null) {
      map['emirates_list'] = _emiratesList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// emirate_id : "d6795abd-31e1-41a7-8c03-e0548b14b5e7"
/// country : {"country_id":"5cc7186b-5417-4676-827b-61fa95d0e2e2","created_by":"mobiz","created_date":"2023-11-06T16:52:27.407878Z","name":"UAE","is_dlt":false}
/// created_by : "mobiz"
/// created_date : "2023-11-06T16:53:00.260563Z"
/// name : "Dubai"
/// is_dlt : false

class EmiratesList {
  EmiratesList({
      String? emirateId, 
      Country? country, 
      String? createdBy, 
      String? createdDate, 
      String? name, 
      bool? isDlt,}){
    _emirateId = emirateId;
    _country = country;
    _createdBy = createdBy;
    _createdDate = createdDate;
    _name = name;
    _isDlt = isDlt;
}

  EmiratesList.fromJson(dynamic json) {
    _emirateId = json['emirate_id'];
    _country = json['country'] != null ? Country.fromJson(json['country']) : null;
    _createdBy = json['created_by'];
    _createdDate = json['created_date'];
    _name = json['name'];
    _isDlt = json['is_dlt'];
  }
  String? _emirateId;
  Country? _country;
  String? _createdBy;
  String? _createdDate;
  String? _name;
  bool? _isDlt;
EmiratesList copyWith({  String? emirateId,
  Country? country,
  String? createdBy,
  String? createdDate,
  String? name,
  bool? isDlt,
}) => EmiratesList(  emirateId: emirateId ?? _emirateId,
  country: country ?? _country,
  createdBy: createdBy ?? _createdBy,
  createdDate: createdDate ?? _createdDate,
  name: name ?? _name,
  isDlt: isDlt ?? _isDlt,
);
  String? get emirateId => _emirateId;
  Country? get country => _country;
  String? get createdBy => _createdBy;
  String? get createdDate => _createdDate;
  String? get name => _name;
  bool? get isDlt => _isDlt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['emirate_id'] = _emirateId;
    if (_country != null) {
      map['country'] = _country?.toJson();
    }
    map['created_by'] = _createdBy;
    map['created_date'] = _createdDate;
    map['name'] = _name;
    map['is_dlt'] = _isDlt;
    return map;
  }

}

/// country_id : "5cc7186b-5417-4676-827b-61fa95d0e2e2"
/// created_by : "mobiz"
/// created_date : "2023-11-06T16:52:27.407878Z"
/// name : "UAE"
/// is_dlt : false

class Country {
  Country({
      String? countryId, 
      String? createdBy, 
      String? createdDate, 
      String? name, 
      bool? isDlt,}){
    _countryId = countryId;
    _createdBy = createdBy;
    _createdDate = createdDate;
    _name = name;
    _isDlt = isDlt;
}

  Country.fromJson(dynamic json) {
    _countryId = json['country_id'];
    _createdBy = json['created_by'];
    _createdDate = json['created_date'];
    _name = json['name'];
    _isDlt = json['is_dlt'];
  }
  String? _countryId;
  String? _createdBy;
  String? _createdDate;
  String? _name;
  bool? _isDlt;
Country copyWith({  String? countryId,
  String? createdBy,
  String? createdDate,
  String? name,
  bool? isDlt,
}) => Country(  countryId: countryId ?? _countryId,
  createdBy: createdBy ?? _createdBy,
  createdDate: createdDate ?? _createdDate,
  name: name ?? _name,
  isDlt: isDlt ?? _isDlt,
);
  String? get countryId => _countryId;
  String? get createdBy => _createdBy;
  String? get createdDate => _createdDate;
  String? get name => _name;
  bool? get isDlt => _isDlt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country_id'] = _countryId;
    map['created_by'] = _createdBy;
    map['created_date'] = _createdDate;
    map['name'] = _name;
    map['is_dlt'] = _isDlt;
    return map;
  }

}