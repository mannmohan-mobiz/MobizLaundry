/// status : true
/// data : [{"cart_id":"cb6f2615-e029-4cdb-9a1f-c4f9d11f0e61","order":{"order_id":"90d13731-d44d-4335-b74b-751020b641a9","customer":{"customer_id":"6f004347-bb72-4e16-853b-4eb4a229173b","created_by":"sreelekha","created_date":"2024-02-22T12:12:20.677265Z","name":"sreelekha","customer_type":"Home","building_no":"3","room_no":"r4","mobile":"7034278084","alt_mobile":"4545454554","whats_app":"7034278084","credit_limit":"5","credit_days":"30","credit_invoices":"6","GPSE":"7","GPSN":"8","status":"Active","TRN":"","billing_addrs":"","designation":"engineer","building_name":"skyline","floor_number":"12","flat_number":"13B","alt_email":null,"company_name":null,"user":178,"staff":null,"Location":"3b6e3c66-7076-40e0-87bb-4e139ad0a715","Pricegroup":"5ecad9a6-d93c-4274-a2e8-0f0dd1cab27e"},"staff":{"staff_id":"20c15a06-0797-413b-823a-c533e52c047e","name":"Ashok","cur_mobile":"0","per_mobile":"0"},"created_by":"sreelekha","created_date":"2024-02-29T09:09:34.541762Z","order_number":"14fbc224","pickup_date":"2024-02-29","pickup_time":"11:00 PM - 12:00 AM","Pickup_mode":"Direct","confirm_pickup":true,"status":"Confirmed","order_type":"Normal","total_amount":"5.0","order_via":"Via App","order_date":"2024-03-07","Delivery_date":null,"Delivery_time":null,"paid_status":false,"discount":"0.0","net_taxable":"0.0","vat":"0.0","grant_total":"0.0","invoice":null,"customer_address":null},"quantity":"1","amount":"3","item_service":{"item_ser_id":"9c736dc0-affe-499e-a8d3-35b35fbd249d","item":{"item_id":"c49fe075-3836-4ed6-a465-c0309e1680d0","item_name":"Jeans","item_image":"/media/jeans.jpeg"},"category":{"category_id":"3c407064-2f5a-478d-8fc7-c9640c99bf43","service_master":{"category_name":"Wash Only","category_image":"/media/washing_jNMZn9m.jpg"}},"sub_category":{"sub_cat_id":"6fb7ea9a-4f2b-47f0-8b66-17269fe667ce","sub_service_master":{"sub_cat_name":"Only Washing","sub_cat_image":"/media/hand_washing_dAZqyrz.jpg"}}}},{"cart_id":"1faeff9c-5b99-46b0-a7f1-564f8fdeafcb","order":{"order_id":"90d13731-d44d-4335-b74b-751020b641a9","customer":{"customer_id":"6f004347-bb72-4e16-853b-4eb4a229173b","created_by":"sreelekha","created_date":"2024-02-22T12:12:20.677265Z","name":"sreelekha","customer_type":"Home","building_no":"3","room_no":"r4","mobile":"7034278084","alt_mobile":"4545454554","whats_app":"7034278084","credit_limit":"5","credit_days":"30","credit_invoices":"6","GPSE":"7","GPSN":"8","status":"Active","TRN":"","billing_addrs":"","designation":"engineer","building_name":"skyline","floor_number":"12","flat_number":"13B","alt_email":null,"company_name":null,"user":178,"staff":null,"Location":"3b6e3c66-7076-40e0-87bb-4e139ad0a715","Pricegroup":"5ecad9a6-d93c-4274-a2e8-0f0dd1cab27e"},"staff":{"staff_id":"20c15a06-0797-413b-823a-c533e52c047e","name":"Ashok","cur_mobile":"0","per_mobile":"0"},"created_by":"sreelekha","created_date":"2024-02-29T09:09:34.541762Z","order_number":"14fbc224","pickup_date":"2024-02-29","pickup_time":"11:00 PM - 12:00 AM","Pickup_mode":"Direct","confirm_pickup":true,"status":"Confirmed","order_type":"Normal","total_amount":"5.0","order_via":"Via App","order_date":"2024-03-07","Delivery_date":null,"Delivery_time":null,"paid_status":false,"discount":"0.0","net_taxable":"0.0","vat":"0.0","grant_total":"0.0","invoice":null,"customer_address":null},"quantity":"2","amount":"2","item_service":{"item_ser_id":"7b122c67-a82a-4fec-9b19-439d7dfec0de","item":{"item_id":"a4b6880c-faa4-4dda-9e28-b3b690e8df95","item_name":"Shirts","item_image":"/media/shirts.jpeg"},"category":{"category_id":"3c407064-2f5a-478d-8fc7-c9640c99bf43","service_master":{"category_name":"Wash Only","category_image":"/media/washing_jNMZn9m.jpg"}},"sub_category":{"sub_cat_id":"6fb7ea9a-4f2b-47f0-8b66-17269fe667ce","sub_service_master":{"sub_cat_name":"Only Washing","sub_cat_image":"/media/hand_washing_dAZqyrz.jpg"}}}}]
/// message : "Already Added this item to the cart!"

class PickerAddToCartModel {
  PickerAddToCartModel({
      final bool? status,
      List<AddCartList>? data,
      String? message,}){
    _status = status;
    _data = data;
    _message = message;
}

  PickerAddToCartModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(AddCartList.fromJson(v));
      });
    }
    _message = json['message'];
  }
  bool? _status;
  List<AddCartList>? _data;
  String? _message;
PickerAddToCartModel copyWith({  bool? status,
  List<AddCartList>? data,
  String? message,
}) => PickerAddToCartModel(  status: status ?? _status,
  data: data ?? _data,
  message: message ?? _message,
);
  bool? get status => _status;
  List<AddCartList>? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}

/// cart_id : "cb6f2615-e029-4cdb-9a1f-c4f9d11f0e61"
/// order : {"order_id":"90d13731-d44d-4335-b74b-751020b641a9","customer":{"customer_id":"6f004347-bb72-4e16-853b-4eb4a229173b","created_by":"sreelekha","created_date":"2024-02-22T12:12:20.677265Z","name":"sreelekha","customer_type":"Home","building_no":"3","room_no":"r4","mobile":"7034278084","alt_mobile":"4545454554","whats_app":"7034278084","credit_limit":"5","credit_days":"30","credit_invoices":"6","GPSE":"7","GPSN":"8","status":"Active","TRN":"","billing_addrs":"","designation":"engineer","building_name":"skyline","floor_number":"12","flat_number":"13B","alt_email":null,"company_name":null,"user":178,"staff":null,"Location":"3b6e3c66-7076-40e0-87bb-4e139ad0a715","Pricegroup":"5ecad9a6-d93c-4274-a2e8-0f0dd1cab27e"},"staff":{"staff_id":"20c15a06-0797-413b-823a-c533e52c047e","name":"Ashok","cur_mobile":"0","per_mobile":"0"},"created_by":"sreelekha","created_date":"2024-02-29T09:09:34.541762Z","order_number":"14fbc224","pickup_date":"2024-02-29","pickup_time":"11:00 PM - 12:00 AM","Pickup_mode":"Direct","confirm_pickup":true,"status":"Confirmed","order_type":"Normal","total_amount":"5.0","order_via":"Via App","order_date":"2024-03-07","Delivery_date":null,"Delivery_time":null,"paid_status":false,"discount":"0.0","net_taxable":"0.0","vat":"0.0","grant_total":"0.0","invoice":null,"customer_address":null}
/// quantity : "1"
/// amount : "3"
/// item_service : {"item_ser_id":"9c736dc0-affe-499e-a8d3-35b35fbd249d","item":{"item_id":"c49fe075-3836-4ed6-a465-c0309e1680d0","item_name":"Jeans","item_image":"/media/jeans.jpeg"},"category":{"category_id":"3c407064-2f5a-478d-8fc7-c9640c99bf43","service_master":{"category_name":"Wash Only","category_image":"/media/washing_jNMZn9m.jpg"}},"sub_category":{"sub_cat_id":"6fb7ea9a-4f2b-47f0-8b66-17269fe667ce","sub_service_master":{"sub_cat_name":"Only Washing","sub_cat_image":"/media/hand_washing_dAZqyrz.jpg"}}}

class AddCartList {
  AddCartList({
      String? cartId, 
      Order? order, 
      String? quantity, 
      String? amount, 
      ItemService? itemService,}){
    _cartId = cartId;
    _order = order;
    _quantity = quantity;
    _amount = amount;
    _itemService = itemService;
}

  AddCartList.fromJson(dynamic json) {
    _cartId = json['cart_id'];
    _order = json['order'] != null ? Order.fromJson(json['order']) : null;
    _quantity = json['quantity'];
    _amount = json['amount'];
    _itemService = json['item_service'] != null ? ItemService.fromJson(json['item_service']) : null;
  }
  String? _cartId;
  Order? _order;
  String? _quantity;
  String? _amount;
  ItemService? _itemService;
  AddCartList copyWith({  String? cartId,
  Order? order,
  String? quantity,
  String? amount,
  ItemService? itemService,
}) => AddCartList(  cartId: cartId ?? _cartId,
  order: order ?? _order,
  quantity: quantity ?? _quantity,
  amount: amount ?? _amount,
  itemService: itemService ?? _itemService,
);
  String? get cartId => _cartId;
  Order? get order => _order;
  String? get quantity => _quantity;
  String? get amount => _amount;
  ItemService? get itemService => _itemService;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cart_id'] = _cartId;
    if (_order != null) {
      map['order'] = _order?.toJson();
    }
    map['quantity'] = _quantity;
    map['amount'] = _amount;
    if (_itemService != null) {
      map['item_service'] = _itemService?.toJson();
    }
    return map;
  }

}

/// item_ser_id : "9c736dc0-affe-499e-a8d3-35b35fbd249d"
/// item : {"item_id":"c49fe075-3836-4ed6-a465-c0309e1680d0","item_name":"Jeans","item_image":"/media/jeans.jpeg"}
/// category : {"category_id":"3c407064-2f5a-478d-8fc7-c9640c99bf43","service_master":{"category_name":"Wash Only","category_image":"/media/washing_jNMZn9m.jpg"}}
/// sub_category : {"sub_cat_id":"6fb7ea9a-4f2b-47f0-8b66-17269fe667ce","sub_service_master":{"sub_cat_name":"Only Washing","sub_cat_image":"/media/hand_washing_dAZqyrz.jpg"}}

class ItemService {
  ItemService({
      String? itemSerId, 
      Item? item, 
      Category? category, 
      SubCategory? subCategory,}){
    _itemSerId = itemSerId;
    _item = item;
    _category = category;
    _subCategory = subCategory;
}

  ItemService.fromJson(dynamic json) {
    _itemSerId = json['item_ser_id'];
    _item = json['item'] != null ? Item.fromJson(json['item']) : null;
    _category = json['category'] != null ? Category.fromJson(json['category']) : null;
    _subCategory = json['sub_category'] != null ? SubCategory.fromJson(json['sub_category']) : null;
  }
  String? _itemSerId;
  Item? _item;
  Category? _category;
  SubCategory? _subCategory;
ItemService copyWith({  String? itemSerId,
  Item? item,
  Category? category,
  SubCategory? subCategory,
}) => ItemService(  itemSerId: itemSerId ?? _itemSerId,
  item: item ?? _item,
  category: category ?? _category,
  subCategory: subCategory ?? _subCategory,
);
  String? get itemSerId => _itemSerId;
  Item? get item => _item;
  Category? get category => _category;
  SubCategory? get subCategory => _subCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_ser_id'] = _itemSerId;
    if (_item != null) {
      map['item'] = _item?.toJson();
    }
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    if (_subCategory != null) {
      map['sub_category'] = _subCategory?.toJson();
    }
    return map;
  }

}

/// sub_cat_id : "6fb7ea9a-4f2b-47f0-8b66-17269fe667ce"
/// sub_service_master : {"sub_cat_name":"Only Washing","sub_cat_image":"/media/hand_washing_dAZqyrz.jpg"}

class SubCategory {
  SubCategory({
      String? subCatId, 
      SubServiceMaster? subServiceMaster,}){
    _subCatId = subCatId;
    _subServiceMaster = subServiceMaster;
}

  SubCategory.fromJson(dynamic json) {
    _subCatId = json['sub_cat_id'];
    _subServiceMaster = json['sub_service_master'] != null ? SubServiceMaster.fromJson(json['sub_service_master']) : null;
  }
  String? _subCatId;
  SubServiceMaster? _subServiceMaster;
SubCategory copyWith({  String? subCatId,
  SubServiceMaster? subServiceMaster,
}) => SubCategory(  subCatId: subCatId ?? _subCatId,
  subServiceMaster: subServiceMaster ?? _subServiceMaster,
);
  String? get subCatId => _subCatId;
  SubServiceMaster? get subServiceMaster => _subServiceMaster;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sub_cat_id'] = _subCatId;
    if (_subServiceMaster != null) {
      map['sub_service_master'] = _subServiceMaster?.toJson();
    }
    return map;
  }

}

/// sub_cat_name : "Only Washing"
/// sub_cat_image : "/media/hand_washing_dAZqyrz.jpg"

class SubServiceMaster {
  SubServiceMaster({
      String? subCatName, 
      String? subCatImage,}){
    _subCatName = subCatName;
    _subCatImage = subCatImage;
}

  SubServiceMaster.fromJson(dynamic json) {
    _subCatName = json['sub_cat_name'];
    _subCatImage = json['sub_cat_image'];
  }
  String? _subCatName;
  String? _subCatImage;
SubServiceMaster copyWith({  String? subCatName,
  String? subCatImage,
}) => SubServiceMaster(  subCatName: subCatName ?? _subCatName,
  subCatImage: subCatImage ?? _subCatImage,
);
  String? get subCatName => _subCatName;
  String? get subCatImage => _subCatImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sub_cat_name'] = _subCatName;
    map['sub_cat_image'] = _subCatImage;
    return map;
  }

}

/// category_id : "3c407064-2f5a-478d-8fc7-c9640c99bf43"
/// service_master : {"category_name":"Wash Only","category_image":"/media/washing_jNMZn9m.jpg"}

class Category {
  Category({
      String? categoryId, 
      ServiceMaster? serviceMaster,}){
    _categoryId = categoryId;
    _serviceMaster = serviceMaster;
}

  Category.fromJson(dynamic json) {
    _categoryId = json['category_id'];
    _serviceMaster = json['service_master'] != null ? ServiceMaster.fromJson(json['service_master']) : null;
  }
  String? _categoryId;
  ServiceMaster? _serviceMaster;
Category copyWith({  String? categoryId,
  ServiceMaster? serviceMaster,
}) => Category(  categoryId: categoryId ?? _categoryId,
  serviceMaster: serviceMaster ?? _serviceMaster,
);
  String? get categoryId => _categoryId;
  ServiceMaster? get serviceMaster => _serviceMaster;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_id'] = _categoryId;
    if (_serviceMaster != null) {
      map['service_master'] = _serviceMaster?.toJson();
    }
    return map;
  }

}

/// category_name : "Wash Only"
/// category_image : "/media/washing_jNMZn9m.jpg"

class ServiceMaster {
  ServiceMaster({
      String? categoryName, 
      String? categoryImage,}){
    _categoryName = categoryName;
    _categoryImage = categoryImage;
}

  ServiceMaster.fromJson(dynamic json) {
    _categoryName = json['category_name'];
    _categoryImage = json['category_image'];
  }
  String? _categoryName;
  String? _categoryImage;
ServiceMaster copyWith({  String? categoryName,
  String? categoryImage,
}) => ServiceMaster(  categoryName: categoryName ?? _categoryName,
  categoryImage: categoryImage ?? _categoryImage,
);
  String? get categoryName => _categoryName;
  String? get categoryImage => _categoryImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_name'] = _categoryName;
    map['category_image'] = _categoryImage;
    return map;
  }

}

/// item_id : "c49fe075-3836-4ed6-a465-c0309e1680d0"
/// item_name : "Jeans"
/// item_image : "/media/jeans.jpeg"

class Item {
  Item({
      String? itemId, 
      String? itemName, 
      String? itemImage,}){
    _itemId = itemId;
    _itemName = itemName;
    _itemImage = itemImage;
}

  Item.fromJson(dynamic json) {
    _itemId = json['item_id'];
    _itemName = json['item_name'];
    _itemImage = json['item_image'];
  }
  String? _itemId;
  String? _itemName;
  String? _itemImage;
Item copyWith({  String? itemId,
  String? itemName,
  String? itemImage,
}) => Item(  itemId: itemId ?? _itemId,
  itemName: itemName ?? _itemName,
  itemImage: itemImage ?? _itemImage,
);
  String? get itemId => _itemId;
  String? get itemName => _itemName;
  String? get itemImage => _itemImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_id'] = _itemId;
    map['item_name'] = _itemName;
    map['item_image'] = _itemImage;
    return map;
  }

}

/// order_id : "90d13731-d44d-4335-b74b-751020b641a9"
/// customer : {"customer_id":"6f004347-bb72-4e16-853b-4eb4a229173b","created_by":"sreelekha","created_date":"2024-02-22T12:12:20.677265Z","name":"sreelekha","customer_type":"Home","building_no":"3","room_no":"r4","mobile":"7034278084","alt_mobile":"4545454554","whats_app":"7034278084","credit_limit":"5","credit_days":"30","credit_invoices":"6","GPSE":"7","GPSN":"8","status":"Active","TRN":"","billing_addrs":"","designation":"engineer","building_name":"skyline","floor_number":"12","flat_number":"13B","alt_email":null,"company_name":null,"user":178,"staff":null,"Location":"3b6e3c66-7076-40e0-87bb-4e139ad0a715","Pricegroup":"5ecad9a6-d93c-4274-a2e8-0f0dd1cab27e"}
/// staff : {"staff_id":"20c15a06-0797-413b-823a-c533e52c047e","name":"Ashok","cur_mobile":"0","per_mobile":"0"}
/// created_by : "sreelekha"
/// created_date : "2024-02-29T09:09:34.541762Z"
/// order_number : "14fbc224"
/// pickup_date : "2024-02-29"
/// pickup_time : "11:00 PM - 12:00 AM"
/// Pickup_mode : "Direct"
/// confirm_pickup : true
/// status : "Confirmed"
/// order_type : "Normal"
/// total_amount : "5.0"
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