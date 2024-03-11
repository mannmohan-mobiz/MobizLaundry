/// status : true
/// data : {"order":{"order_id":"99904eb0-36c2-4040-87e5-77dbb26ac84d","customer":{"customer_id":"6f004347-bb72-4e16-853b-4eb4a229173b","created_by":"sreelekha","created_date":"2024-02-22T12:12:20.677265Z","name":"sreelekha","customer_type":"Home","building_no":"3","room_no":"r4","mobile":"7034278084","alt_mobile":"4545454554","whats_app":"7034278084","credit_limit":"5","credit_days":"30","credit_invoices":"6","GPSE":"7","GPSN":"8","status":"Active","TRN":"","billing_addrs":"","designation":"engineer","building_name":"skyline","floor_number":"12","flat_number":"13B","alt_email":null,"company_name":null,"user":178,"staff":null,"Location":"3b6e3c66-7076-40e0-87bb-4e139ad0a715","Pricegroup":"5ecad9a6-d93c-4274-a2e8-0f0dd1cab27e"},"staff":{"staff_id":"20c15a06-0797-413b-823a-c533e52c047e","name":"Ashok","cur_mobile":"0","per_mobile":"0"},"created_by":"sreelekha","created_date":"2024-02-29T09:03:24.817728Z","order_number":"ac365224","pickup_date":"2024-02-29","pickup_time":"10:00 PM - 11:00 PM","Pickup_mode":"Staff Pick","confirm_pickup":false,"status":"Confirmed","order_type":"Normal","total_amount":"6.0","order_via":"Via App","order_date":"2024-03-07","Delivery_date":null,"Delivery_time":null,"paid_status":false,"discount":"0.0","net_taxable":"0.0","vat":"0.0","grant_total":"0.0","invoice":null,"customer_address":null},"cart_count":2}
/// message : "Cart Count!"

class PickerCartCountModel {
  PickerCartCountModel({
      bool? status, 
      Data? data, 
      String? message,}){
    _status = status;
    _data = data;
    _message = message;
}

  PickerCartCountModel.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _status;
  Data? _data;
  String? _message;
PickerCartCountModel copyWith({  bool? status,
  Data? data,
  String? message,
}) => PickerCartCountModel(  status: status ?? _status,
  data: data ?? _data,
  message: message ?? _message,
);
  bool? get status => _status;
  Data? get data => _data;
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

/// order : {"order_id":"99904eb0-36c2-4040-87e5-77dbb26ac84d","customer":{"customer_id":"6f004347-bb72-4e16-853b-4eb4a229173b","created_by":"sreelekha","created_date":"2024-02-22T12:12:20.677265Z","name":"sreelekha","customer_type":"Home","building_no":"3","room_no":"r4","mobile":"7034278084","alt_mobile":"4545454554","whats_app":"7034278084","credit_limit":"5","credit_days":"30","credit_invoices":"6","GPSE":"7","GPSN":"8","status":"Active","TRN":"","billing_addrs":"","designation":"engineer","building_name":"skyline","floor_number":"12","flat_number":"13B","alt_email":null,"company_name":null,"user":178,"staff":null,"Location":"3b6e3c66-7076-40e0-87bb-4e139ad0a715","Pricegroup":"5ecad9a6-d93c-4274-a2e8-0f0dd1cab27e"},"staff":{"staff_id":"20c15a06-0797-413b-823a-c533e52c047e","name":"Ashok","cur_mobile":"0","per_mobile":"0"},"created_by":"sreelekha","created_date":"2024-02-29T09:03:24.817728Z","order_number":"ac365224","pickup_date":"2024-02-29","pickup_time":"10:00 PM - 11:00 PM","Pickup_mode":"Staff Pick","confirm_pickup":false,"status":"Confirmed","order_type":"Normal","total_amount":"6.0","order_via":"Via App","order_date":"2024-03-07","Delivery_date":null,"Delivery_time":null,"paid_status":false,"discount":"0.0","net_taxable":"0.0","vat":"0.0","grant_total":"0.0","invoice":null,"customer_address":null}
/// cart_count : 2

class Data {
  Data({
      Order? order, 
      int? cartCount,}){
    _order = order;
    _cartCount = cartCount;
}

  Data.fromJson(dynamic json) {
    _order = json['order'] != null ? Order.fromJson(json['order']) : null;
    _cartCount = json['cart_count'];
  }
  Order? _order;
  int? _cartCount;
Data copyWith({  Order? order,
  int? cartCount,
}) => Data(  order: order ?? _order,
  cartCount: cartCount ?? _cartCount,
);
  Order? get order => _order;
  int? get cartCount => _cartCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_order != null) {
      map['order'] = _order?.toJson();
    }
    map['cart_count'] = _cartCount;
    return map;
  }

}

/// order_id : "99904eb0-36c2-4040-87e5-77dbb26ac84d"
/// customer : {"customer_id":"6f004347-bb72-4e16-853b-4eb4a229173b","created_by":"sreelekha","created_date":"2024-02-22T12:12:20.677265Z","name":"sreelekha","customer_type":"Home","building_no":"3","room_no":"r4","mobile":"7034278084","alt_mobile":"4545454554","whats_app":"7034278084","credit_limit":"5","credit_days":"30","credit_invoices":"6","GPSE":"7","GPSN":"8","status":"Active","TRN":"","billing_addrs":"","designation":"engineer","building_name":"skyline","floor_number":"12","flat_number":"13B","alt_email":null,"company_name":null,"user":178,"staff":null,"Location":"3b6e3c66-7076-40e0-87bb-4e139ad0a715","Pricegroup":"5ecad9a6-d93c-4274-a2e8-0f0dd1cab27e"}
/// staff : {"staff_id":"20c15a06-0797-413b-823a-c533e52c047e","name":"Ashok","cur_mobile":"0","per_mobile":"0"}
/// created_by : "sreelekha"
/// created_date : "2024-02-29T09:03:24.817728Z"
/// order_number : "ac365224"
/// pickup_date : "2024-02-29"
/// pickup_time : "10:00 PM - 11:00 PM"
/// Pickup_mode : "Staff Pick"
/// confirm_pickup : false
/// status : "Confirmed"
/// order_type : "Normal"
/// total_amount : "6.0"
/// order_via : "Via App"
/// order_date : "2024-03-07"
/// Delivery_date : null
/// Delivery_time : null
/// paid_status : false
/// discount : "0.0"
/// net_taxable : "0.0"
/// vat : "0.0"
/// grant_total : "0.0"
/// invoice : null
/// customer_address : null

class Order {
  Order({
      String? orderId, 
      Customer? customer, 
      Staff? staff, 
      String? createdBy, 
      String? createdDate, 
      String? orderNumber, 
      String? pickupDate, 
      String? pickupTime, 
      String? pickupMode, 
      bool? confirmPickup, 
      String? status, 
      String? orderType, 
      String? totalAmount, 
      String? orderVia, 
      String? orderDate, 
      dynamic deliveryDate, 
      dynamic deliveryTime, 
      bool? paidStatus, 
      String? discount, 
      String? netTaxable, 
      String? vat, 
      String? grantTotal, 
      dynamic invoice, 
      dynamic customerAddress,}){
    _orderId = orderId;
    _customer = customer;
    _staff = staff;
    _createdBy = createdBy;
    _createdDate = createdDate;
    _orderNumber = orderNumber;
    _pickupDate = pickupDate;
    _pickupTime = pickupTime;
    _pickupMode = pickupMode;
    _confirmPickup = confirmPickup;
    _status = status;
    _orderType = orderType;
    _totalAmount = totalAmount;
    _orderVia = orderVia;
    _orderDate = orderDate;
    _deliveryDate = deliveryDate;
    _deliveryTime = deliveryTime;
    _paidStatus = paidStatus;
    _discount = discount;
    _netTaxable = netTaxable;
    _vat = vat;
    _grantTotal = grantTotal;
    _invoice = invoice;
    _customerAddress = customerAddress;
}

  Order.fromJson(dynamic json) {
    _orderId = json['order_id'];
    _customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    _staff = json['staff'] != null ? Staff.fromJson(json['staff']) : null;
    _createdBy = json['created_by'];
    _createdDate = json['created_date'];
    _orderNumber = json['order_number'];
    _pickupDate = json['pickup_date'];
    _pickupTime = json['pickup_time'];
    _pickupMode = json['Pickup_mode'];
    _confirmPickup = json['confirm_pickup'];
    _status = json['status'];
    _orderType = json['order_type'];
    _totalAmount = json['total_amount'];
    _orderVia = json['order_via'];
    _orderDate = json['order_date'];
    _deliveryDate = json['Delivery_date'];
    _deliveryTime = json['Delivery_time'];
    _paidStatus = json['paid_status'];
    _discount = json['discount'];
    _netTaxable = json['net_taxable'];
    _vat = json['vat'];
    _grantTotal = json['grant_total'];
    _invoice = json['invoice'];
    _customerAddress = json['customer_address'];
  }
  String? _orderId;
  Customer? _customer;
  Staff? _staff;
  String? _createdBy;
  String? _createdDate;
  String? _orderNumber;
  String? _pickupDate;
  String? _pickupTime;
  String? _pickupMode;
  bool? _confirmPickup;
  String? _status;
  String? _orderType;
  String? _totalAmount;
  String? _orderVia;
  String? _orderDate;
  dynamic _deliveryDate;
  dynamic _deliveryTime;
  bool? _paidStatus;
  String? _discount;
  String? _netTaxable;
  String? _vat;
  String? _grantTotal;
  dynamic _invoice;
  dynamic _customerAddress;
Order copyWith({  String? orderId,
  Customer? customer,
  Staff? staff,
  String? createdBy,
  String? createdDate,
  String? orderNumber,
  String? pickupDate,
  String? pickupTime,
  String? pickupMode,
  bool? confirmPickup,
  String? status,
  String? orderType,
  String? totalAmount,
  String? orderVia,
  String? orderDate,
  dynamic deliveryDate,
  dynamic deliveryTime,
  bool? paidStatus,
  String? discount,
  String? netTaxable,
  String? vat,
  String? grantTotal,
  dynamic invoice,
  dynamic customerAddress,
}) => Order(  orderId: orderId ?? _orderId,
  customer: customer ?? _customer,
  staff: staff ?? _staff,
  createdBy: createdBy ?? _createdBy,
  createdDate: createdDate ?? _createdDate,
  orderNumber: orderNumber ?? _orderNumber,
  pickupDate: pickupDate ?? _pickupDate,
  pickupTime: pickupTime ?? _pickupTime,
  pickupMode: pickupMode ?? _pickupMode,
  confirmPickup: confirmPickup ?? _confirmPickup,
  status: status ?? _status,
  orderType: orderType ?? _orderType,
  totalAmount: totalAmount ?? _totalAmount,
  orderVia: orderVia ?? _orderVia,
  orderDate: orderDate ?? _orderDate,
  deliveryDate: deliveryDate ?? _deliveryDate,
  deliveryTime: deliveryTime ?? _deliveryTime,
  paidStatus: paidStatus ?? _paidStatus,
  discount: discount ?? _discount,
  netTaxable: netTaxable ?? _netTaxable,
  vat: vat ?? _vat,
  grantTotal: grantTotal ?? _grantTotal,
  invoice: invoice ?? _invoice,
  customerAddress: customerAddress ?? _customerAddress,
);
  String? get orderId => _orderId;
  Customer? get customer => _customer;
  Staff? get staff => _staff;
  String? get createdBy => _createdBy;
  String? get createdDate => _createdDate;
  String? get orderNumber => _orderNumber;
  String? get pickupDate => _pickupDate;
  String? get pickupTime => _pickupTime;
  String? get pickupMode => _pickupMode;
  bool? get confirmPickup => _confirmPickup;
  String? get status => _status;
  String? get orderType => _orderType;
  String? get totalAmount => _totalAmount;
  String? get orderVia => _orderVia;
  String? get orderDate => _orderDate;
  dynamic get deliveryDate => _deliveryDate;
  dynamic get deliveryTime => _deliveryTime;
  bool? get paidStatus => _paidStatus;
  String? get discount => _discount;
  String? get netTaxable => _netTaxable;
  String? get vat => _vat;
  String? get grantTotal => _grantTotal;
  dynamic get invoice => _invoice;
  dynamic get customerAddress => _customerAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = _orderId;
    if (_customer != null) {
      map['customer'] = _customer?.toJson();
    }
    if (_staff != null) {
      map['staff'] = _staff?.toJson();
    }
    map['created_by'] = _createdBy;
    map['created_date'] = _createdDate;
    map['order_number'] = _orderNumber;
    map['pickup_date'] = _pickupDate;
    map['pickup_time'] = _pickupTime;
    map['Pickup_mode'] = _pickupMode;
    map['confirm_pickup'] = _confirmPickup;
    map['status'] = _status;
    map['order_type'] = _orderType;
    map['total_amount'] = _totalAmount;
    map['order_via'] = _orderVia;
    map['order_date'] = _orderDate;
    map['Delivery_date'] = _deliveryDate;
    map['Delivery_time'] = _deliveryTime;
    map['paid_status'] = _paidStatus;
    map['discount'] = _discount;
    map['net_taxable'] = _netTaxable;
    map['vat'] = _vat;
    map['grant_total'] = _grantTotal;
    map['invoice'] = _invoice;
    map['customer_address'] = _customerAddress;
    return map;
  }

}

/// staff_id : "20c15a06-0797-413b-823a-c533e52c047e"
/// name : "Ashok"
/// cur_mobile : "0"
/// per_mobile : "0"

class Staff {
  Staff({
      String? staffId, 
      String? name, 
      String? curMobile, 
      String? perMobile,}){
    _staffId = staffId;
    _name = name;
    _curMobile = curMobile;
    _perMobile = perMobile;
}

  Staff.fromJson(dynamic json) {
    _staffId = json['staff_id'];
    _name = json['name'];
    _curMobile = json['cur_mobile'];
    _perMobile = json['per_mobile'];
  }
  String? _staffId;
  String? _name;
  String? _curMobile;
  String? _perMobile;
Staff copyWith({  String? staffId,
  String? name,
  String? curMobile,
  String? perMobile,
}) => Staff(  staffId: staffId ?? _staffId,
  name: name ?? _name,
  curMobile: curMobile ?? _curMobile,
  perMobile: perMobile ?? _perMobile,
);
  String? get staffId => _staffId;
  String? get name => _name;
  String? get curMobile => _curMobile;
  String? get perMobile => _perMobile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['staff_id'] = _staffId;
    map['name'] = _name;
    map['cur_mobile'] = _curMobile;
    map['per_mobile'] = _perMobile;
    return map;
  }

}

/// customer_id : "6f004347-bb72-4e16-853b-4eb4a229173b"
/// created_by : "sreelekha"
/// created_date : "2024-02-22T12:12:20.677265Z"
/// name : "sreelekha"
/// customer_type : "Home"
/// building_no : "3"
/// room_no : "r4"
/// mobile : "7034278084"
/// alt_mobile : "4545454554"
/// whats_app : "7034278084"
/// credit_limit : "5"
/// credit_days : "30"
/// credit_invoices : "6"
/// GPSE : "7"
/// GPSN : "8"
/// status : "Active"
/// TRN : ""
/// billing_addrs : ""
/// designation : "engineer"
/// building_name : "skyline"
/// floor_number : "12"
/// flat_number : "13B"
/// alt_email : null
/// company_name : null
/// user : 178
/// staff : null
/// Location : "3b6e3c66-7076-40e0-87bb-4e139ad0a715"
/// Pricegroup : "5ecad9a6-d93c-4274-a2e8-0f0dd1cab27e"

class Customer {
  Customer({
      String? customerId, 
      String? createdBy, 
      String? createdDate, 
      String? name, 
      String? customerType, 
      String? buildingNo, 
      String? roomNo, 
      String? mobile, 
      String? altMobile, 
      String? whatsApp, 
      String? creditLimit, 
      String? creditDays, 
      String? creditInvoices, 
      String? gpse, 
      String? gpsn, 
      String? status, 
      String? trn, 
      String? billingAddrs, 
      String? designation, 
      String? buildingName, 
      String? floorNumber, 
      String? flatNumber, 
      dynamic altEmail, 
      dynamic companyName, 
      num? user, 
      dynamic staff, 
      String? location, 
      String? pricegroup,}){
    _customerId = customerId;
    _createdBy = createdBy;
    _createdDate = createdDate;
    _name = name;
    _customerType = customerType;
    _buildingNo = buildingNo;
    _roomNo = roomNo;
    _mobile = mobile;
    _altMobile = altMobile;
    _whatsApp = whatsApp;
    _creditLimit = creditLimit;
    _creditDays = creditDays;
    _creditInvoices = creditInvoices;
    _gpse = gpse;
    _gpsn = gpsn;
    _status = status;
    _trn = trn;
    _billingAddrs = billingAddrs;
    _designation = designation;
    _buildingName = buildingName;
    _floorNumber = floorNumber;
    _flatNumber = flatNumber;
    _altEmail = altEmail;
    _companyName = companyName;
    _user = user;
    _staff = staff;
    _location = location;
    _pricegroup = pricegroup;
}

  Customer.fromJson(dynamic json) {
    _customerId = json['customer_id'];
    _createdBy = json['created_by'];
    _createdDate = json['created_date'];
    _name = json['name'];
    _customerType = json['customer_type'];
    _buildingNo = json['building_no'];
    _roomNo = json['room_no'];
    _mobile = json['mobile'];
    _altMobile = json['alt_mobile'];
    _whatsApp = json['whats_app'];
    _creditLimit = json['credit_limit'];
    _creditDays = json['credit_days'];
    _creditInvoices = json['credit_invoices'];
    _gpse = json['GPSE'];
    _gpsn = json['GPSN'];
    _status = json['status'];
    _trn = json['TRN'];
    _billingAddrs = json['billing_addrs'];
    _designation = json['designation'];
    _buildingName = json['building_name'];
    _floorNumber = json['floor_number'];
    _flatNumber = json['flat_number'];
    _altEmail = json['alt_email'];
    _companyName = json['company_name'];
    _user = json['user'];
    _staff = json['staff'];
    _location = json['Location'];
    _pricegroup = json['Pricegroup'];
  }
  String? _customerId;
  String? _createdBy;
  String? _createdDate;
  String? _name;
  String? _customerType;
  String? _buildingNo;
  String? _roomNo;
  String? _mobile;
  String? _altMobile;
  String? _whatsApp;
  String? _creditLimit;
  String? _creditDays;
  String? _creditInvoices;
  String? _gpse;
  String? _gpsn;
  String? _status;
  String? _trn;
  String? _billingAddrs;
  String? _designation;
  String? _buildingName;
  String? _floorNumber;
  String? _flatNumber;
  dynamic _altEmail;
  dynamic _companyName;
  num? _user;
  dynamic _staff;
  String? _location;
  String? _pricegroup;
Customer copyWith({  String? customerId,
  String? createdBy,
  String? createdDate,
  String? name,
  String? customerType,
  String? buildingNo,
  String? roomNo,
  String? mobile,
  String? altMobile,
  String? whatsApp,
  String? creditLimit,
  String? creditDays,
  String? creditInvoices,
  String? gpse,
  String? gpsn,
  String? status,
  String? trn,
  String? billingAddrs,
  String? designation,
  String? buildingName,
  String? floorNumber,
  String? flatNumber,
  dynamic altEmail,
  dynamic companyName,
  num? user,
  dynamic staff,
  String? location,
  String? pricegroup,
}) => Customer(  customerId: customerId ?? _customerId,
  createdBy: createdBy ?? _createdBy,
  createdDate: createdDate ?? _createdDate,
  name: name ?? _name,
  customerType: customerType ?? _customerType,
  buildingNo: buildingNo ?? _buildingNo,
  roomNo: roomNo ?? _roomNo,
  mobile: mobile ?? _mobile,
  altMobile: altMobile ?? _altMobile,
  whatsApp: whatsApp ?? _whatsApp,
  creditLimit: creditLimit ?? _creditLimit,
  creditDays: creditDays ?? _creditDays,
  creditInvoices: creditInvoices ?? _creditInvoices,
  gpse: gpse ?? _gpse,
  gpsn: gpsn ?? _gpsn,
  status: status ?? _status,
  trn: trn ?? _trn,
  billingAddrs: billingAddrs ?? _billingAddrs,
  designation: designation ?? _designation,
  buildingName: buildingName ?? _buildingName,
  floorNumber: floorNumber ?? _floorNumber,
  flatNumber: flatNumber ?? _flatNumber,
  altEmail: altEmail ?? _altEmail,
  companyName: companyName ?? _companyName,
  user: user ?? _user,
  staff: staff ?? _staff,
  location: location ?? _location,
  pricegroup: pricegroup ?? _pricegroup,
);
  String? get customerId => _customerId;
  String? get createdBy => _createdBy;
  String? get createdDate => _createdDate;
  String? get name => _name;
  String? get customerType => _customerType;
  String? get buildingNo => _buildingNo;
  String? get roomNo => _roomNo;
  String? get mobile => _mobile;
  String? get altMobile => _altMobile;
  String? get whatsApp => _whatsApp;
  String? get creditLimit => _creditLimit;
  String? get creditDays => _creditDays;
  String? get creditInvoices => _creditInvoices;
  String? get gpse => _gpse;
  String? get gpsn => _gpsn;
  String? get status => _status;
  String? get trn => _trn;
  String? get billingAddrs => _billingAddrs;
  String? get designation => _designation;
  String? get buildingName => _buildingName;
  String? get floorNumber => _floorNumber;
  String? get flatNumber => _flatNumber;
  dynamic get altEmail => _altEmail;
  dynamic get companyName => _companyName;
  num? get user => _user;
  dynamic get staff => _staff;
  String? get location => _location;
  String? get pricegroup => _pricegroup;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customer_id'] = _customerId;
    map['created_by'] = _createdBy;
    map['created_date'] = _createdDate;
    map['name'] = _name;
    map['customer_type'] = _customerType;
    map['building_no'] = _buildingNo;
    map['room_no'] = _roomNo;
    map['mobile'] = _mobile;
    map['alt_mobile'] = _altMobile;
    map['whats_app'] = _whatsApp;
    map['credit_limit'] = _creditLimit;
    map['credit_days'] = _creditDays;
    map['credit_invoices'] = _creditInvoices;
    map['GPSE'] = _gpse;
    map['GPSN'] = _gpsn;
    map['status'] = _status;
    map['TRN'] = _trn;
    map['billing_addrs'] = _billingAddrs;
    map['designation'] = _designation;
    map['building_name'] = _buildingName;
    map['floor_number'] = _floorNumber;
    map['flat_number'] = _flatNumber;
    map['alt_email'] = _altEmail;
    map['company_name'] = _companyName;
    map['user'] = _user;
    map['staff'] = _staff;
    map['Location'] = _location;
    map['Pricegroup'] = _pricegroup;
    return map;
  }

}