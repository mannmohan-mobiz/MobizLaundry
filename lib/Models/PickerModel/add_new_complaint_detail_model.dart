/// status : true
/// data : {"cart":[{"cart_id":"37bf39ee-b11e-46c7-8ab4-1b5e00259a9f","order":{"order_id":"e5acda13-1cb9-4b41-8f6b-3a6446597abd","created_date":"2024-01-12T09:25:28.603409Z","order_number":"8bdbd124","pickup_date":"2024-01-12","pickup_time":"10:00 AM - 11:00 AM","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c","total_amount":"20.00","Delivery_date":"2024-01-19","status":"Delivered","order_date":"2024-01-18","Delivery_time":"09:34","order_type":"Normal","net_taxable":"20.00","vat":"5"},"quantity":"1","amount":"20","item_service":{"item_ser_id":"c837b09e-f3d1-44bf-9ad8-c39b371235ba","item":{"item_id":"a4b6880c-faa4-4dda-9e28-b3b690e8df95","item_name":"Shirts","item_image":"/media/shirts.jpeg"},"category":{"category_id":"ee6b720e-f5aa-45aa-9d7b-c55f2c37fd9b","service_master":{"category_name":"Dry Cleaning","category_image":"/media/dry.jpeg"}},"sub_category":{"sub_cat_id":"ac5cbc4f-7dbe-40cd-9e42-e7e3e0aa8955","sub_service_master":{"sub_cat_name":"Dry Cleaning","sub_cat_image":"/media/dry_5CJhkjo.jpeg"}}},"price_list":"0fe1adcc-611f-44a9-bf14-932be3eb4d4d"}],"cart_count":1,"wallet_balance":"-146.0","delivery_address":{"name":null,"customer_type":null,"building_no":null,"room_no":null,"building_name":null,"floor_number":null,"flat_number":null},"payment_method":"Wallet","Service_type":"Normal","VAT":"5","Net_taxable":"20.00","total_orderprice":"20.00"}
/// message : "Customer Cart List!"

class AddNewComplaintDetailModel {
  AddNewComplaintDetailModel({
      bool? status,
      AddNewComplaintDetail? data,
      String? message,}){
    _status = status;
    _data = data;
    _message = message;
}

  AddNewComplaintDetailModel.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? AddNewComplaintDetail.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _status;
  AddNewComplaintDetail? _data;
  String? _message;
AddNewComplaintDetailModel copyWith({  bool? status,
  AddNewComplaintDetail? data,
  String? message,
}) => AddNewComplaintDetailModel(  status: status ?? _status,
  data: data ?? _data,
  message: message ?? _message,
);
  bool? get status => _status;
  AddNewComplaintDetail? get data => _data;
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

/// cart : [{"cart_id":"37bf39ee-b11e-46c7-8ab4-1b5e00259a9f","order":{"order_id":"e5acda13-1cb9-4b41-8f6b-3a6446597abd","created_date":"2024-01-12T09:25:28.603409Z","order_number":"8bdbd124","pickup_date":"2024-01-12","pickup_time":"10:00 AM - 11:00 AM","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c","total_amount":"20.00","Delivery_date":"2024-01-19","status":"Delivered","order_date":"2024-01-18","Delivery_time":"09:34","order_type":"Normal","net_taxable":"20.00","vat":"5"},"quantity":"1","amount":"20","item_service":{"item_ser_id":"c837b09e-f3d1-44bf-9ad8-c39b371235ba","item":{"item_id":"a4b6880c-faa4-4dda-9e28-b3b690e8df95","item_name":"Shirts","item_image":"/media/shirts.jpeg"},"category":{"category_id":"ee6b720e-f5aa-45aa-9d7b-c55f2c37fd9b","service_master":{"category_name":"Dry Cleaning","category_image":"/media/dry.jpeg"}},"sub_category":{"sub_cat_id":"ac5cbc4f-7dbe-40cd-9e42-e7e3e0aa8955","sub_service_master":{"sub_cat_name":"Dry Cleaning","sub_cat_image":"/media/dry_5CJhkjo.jpeg"}}},"price_list":"0fe1adcc-611f-44a9-bf14-932be3eb4d4d"}]
/// cart_count : 1
/// wallet_balance : "-146.0"
/// delivery_address : {"name":null,"customer_type":null,"building_no":null,"room_no":null,"building_name":null,"floor_number":null,"flat_number":null}
/// payment_method : "Wallet"
/// Service_type : "Normal"
/// VAT : "5"
/// Net_taxable : "20.00"
/// total_orderprice : "20.00"

class AddNewComplaintDetail {
  AddNewComplaintDetail({
      List<Cart>? cart, 
      num? cartCount, 
      String? walletBalance, 
      DeliveryAddress? deliveryAddress, 
      String? paymentMethod, 
      String? serviceType, 
      String? vat, 
      String? netTaxable, 
      String? totalOrderprice,}){
    _cart = cart;
    _cartCount = cartCount;
    _walletBalance = walletBalance;
    _deliveryAddress = deliveryAddress;
    _paymentMethod = paymentMethod;
    _serviceType = serviceType;
    _vat = vat;
    _netTaxable = netTaxable;
    _totalOrderprice = totalOrderprice;
}

  AddNewComplaintDetail.fromJson(dynamic json) {
    if (json['cart'] != null) {
      _cart = [];
      json['cart'].forEach((v) {
        _cart?.add(Cart.fromJson(v));
      });
    }
    _cartCount = json['cart_count'];
    _walletBalance = json['wallet_balance'];
    _deliveryAddress = json['delivery_address'] != null ? DeliveryAddress.fromJson(json['delivery_address']) : null;
    _paymentMethod = json['payment_method'];
    _serviceType = json['Service_type'];
    _vat = json['VAT'];
    _netTaxable = json['Net_taxable'];
    _totalOrderprice = json['total_orderprice'];
  }
  List<Cart>? _cart;
  num? _cartCount;
  String? _walletBalance;
  DeliveryAddress? _deliveryAddress;
  String? _paymentMethod;
  String? _serviceType;
  String? _vat;
  String? _netTaxable;
  String? _totalOrderprice;
  AddNewComplaintDetail copyWith({  List<Cart>? cart,
  num? cartCount,
  String? walletBalance,
  DeliveryAddress? deliveryAddress,
  String? paymentMethod,
  String? serviceType,
  String? vat,
  String? netTaxable,
  String? totalOrderprice,
}) => AddNewComplaintDetail(  cart: cart ?? _cart,
  cartCount: cartCount ?? _cartCount,
  walletBalance: walletBalance ?? _walletBalance,
  deliveryAddress: deliveryAddress ?? _deliveryAddress,
  paymentMethod: paymentMethod ?? _paymentMethod,
  serviceType: serviceType ?? _serviceType,
  vat: vat ?? _vat,
  netTaxable: netTaxable ?? _netTaxable,
  totalOrderprice: totalOrderprice ?? _totalOrderprice,
);
  List<Cart>? get cart => _cart;
  num? get cartCount => _cartCount;
  String? get walletBalance => _walletBalance;
  DeliveryAddress? get deliveryAddress => _deliveryAddress;
  String? get paymentMethod => _paymentMethod;
  String? get serviceType => _serviceType;
  String? get vat => _vat;
  String? get netTaxable => _netTaxable;
  String? get totalOrderprice => _totalOrderprice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_cart != null) {
      map['cart'] = _cart?.map((v) => v.toJson()).toList();
    }
    map['cart_count'] = _cartCount;
    map['wallet_balance'] = _walletBalance;
    if (_deliveryAddress != null) {
      map['delivery_address'] = _deliveryAddress?.toJson();
    }
    map['payment_method'] = _paymentMethod;
    map['Service_type'] = _serviceType;
    map['VAT'] = _vat;
    map['Net_taxable'] = _netTaxable;
    map['total_orderprice'] = _totalOrderprice;
    return map;
  }

}

/// name : null
/// customer_type : null
/// building_no : null
/// room_no : null
/// building_name : null
/// floor_number : null
/// flat_number : null

class DeliveryAddress {
  DeliveryAddress({
      dynamic name, 
      dynamic customerType, 
      dynamic buildingNo, 
      dynamic roomNo, 
      dynamic buildingName, 
      dynamic floorNumber, 
      dynamic flatNumber,}){
    _name = name;
    _customerType = customerType;
    _buildingNo = buildingNo;
    _roomNo = roomNo;
    _buildingName = buildingName;
    _floorNumber = floorNumber;
    _flatNumber = flatNumber;
}

  DeliveryAddress.fromJson(dynamic json) {
    _name = json['name'];
    _customerType = json['customer_type'];
    _buildingNo = json['building_no'];
    _roomNo = json['room_no'];
    _buildingName = json['building_name'];
    _floorNumber = json['floor_number'];
    _flatNumber = json['flat_number'];
  }
  dynamic _name;
  dynamic _customerType;
  dynamic _buildingNo;
  dynamic _roomNo;
  dynamic _buildingName;
  dynamic _floorNumber;
  dynamic _flatNumber;
DeliveryAddress copyWith({  dynamic name,
  dynamic customerType,
  dynamic buildingNo,
  dynamic roomNo,
  dynamic buildingName,
  dynamic floorNumber,
  dynamic flatNumber,
}) => DeliveryAddress(  name: name ?? _name,
  customerType: customerType ?? _customerType,
  buildingNo: buildingNo ?? _buildingNo,
  roomNo: roomNo ?? _roomNo,
  buildingName: buildingName ?? _buildingName,
  floorNumber: floorNumber ?? _floorNumber,
  flatNumber: flatNumber ?? _flatNumber,
);
  dynamic get name => _name;
  dynamic get customerType => _customerType;
  dynamic get buildingNo => _buildingNo;
  dynamic get roomNo => _roomNo;
  dynamic get buildingName => _buildingName;
  dynamic get floorNumber => _floorNumber;
  dynamic get flatNumber => _flatNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['customer_type'] = _customerType;
    map['building_no'] = _buildingNo;
    map['room_no'] = _roomNo;
    map['building_name'] = _buildingName;
    map['floor_number'] = _floorNumber;
    map['flat_number'] = _flatNumber;
    return map;
  }

}

/// cart_id : "37bf39ee-b11e-46c7-8ab4-1b5e00259a9f"
/// order : {"order_id":"e5acda13-1cb9-4b41-8f6b-3a6446597abd","created_date":"2024-01-12T09:25:28.603409Z","order_number":"8bdbd124","pickup_date":"2024-01-12","pickup_time":"10:00 AM - 11:00 AM","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c","total_amount":"20.00","Delivery_date":"2024-01-19","status":"Delivered","order_date":"2024-01-18","Delivery_time":"09:34","order_type":"Normal","net_taxable":"20.00","vat":"5"}
/// quantity : "1"
/// amount : "20"
/// item_service : {"item_ser_id":"c837b09e-f3d1-44bf-9ad8-c39b371235ba","item":{"item_id":"a4b6880c-faa4-4dda-9e28-b3b690e8df95","item_name":"Shirts","item_image":"/media/shirts.jpeg"},"category":{"category_id":"ee6b720e-f5aa-45aa-9d7b-c55f2c37fd9b","service_master":{"category_name":"Dry Cleaning","category_image":"/media/dry.jpeg"}},"sub_category":{"sub_cat_id":"ac5cbc4f-7dbe-40cd-9e42-e7e3e0aa8955","sub_service_master":{"sub_cat_name":"Dry Cleaning","sub_cat_image":"/media/dry_5CJhkjo.jpeg"}}}
/// price_list : "0fe1adcc-611f-44a9-bf14-932be3eb4d4d"

class Cart {
  Cart({
      String? cartId, 
      Order? order, 
      String? quantity, 
      String? amount, 
      ItemService? itemService, 
      String? priceList,}){
    _cartId = cartId;
    _order = order;
    _quantity = quantity;
    _amount = amount;
    _itemService = itemService;
    _priceList = priceList;
}

  Cart.fromJson(dynamic json) {
    _cartId = json['cart_id'];
    _order = json['order'] != null ? Order.fromJson(json['order']) : null;
    _quantity = json['quantity'];
    _amount = json['amount'];
    _itemService = json['item_service'] != null ? ItemService.fromJson(json['item_service']) : null;
    _priceList = json['price_list'];
  }
  String? _cartId;
  Order? _order;
  String? _quantity;
  String? _amount;
  ItemService? _itemService;
  String? _priceList;
Cart copyWith({  String? cartId,
  Order? order,
  String? quantity,
  String? amount,
  ItemService? itemService,
  String? priceList,
}) => Cart(  cartId: cartId ?? _cartId,
  order: order ?? _order,
  quantity: quantity ?? _quantity,
  amount: amount ?? _amount,
  itemService: itemService ?? _itemService,
  priceList: priceList ?? _priceList,
);
  String? get cartId => _cartId;
  Order? get order => _order;
  String? get quantity => _quantity;
  String? get amount => _amount;
  ItemService? get itemService => _itemService;
  String? get priceList => _priceList;

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
    map['price_list'] = _priceList;
    return map;
  }

}

/// item_ser_id : "c837b09e-f3d1-44bf-9ad8-c39b371235ba"
/// item : {"item_id":"a4b6880c-faa4-4dda-9e28-b3b690e8df95","item_name":"Shirts","item_image":"/media/shirts.jpeg"}
/// category : {"category_id":"ee6b720e-f5aa-45aa-9d7b-c55f2c37fd9b","service_master":{"category_name":"Dry Cleaning","category_image":"/media/dry.jpeg"}}
/// sub_category : {"sub_cat_id":"ac5cbc4f-7dbe-40cd-9e42-e7e3e0aa8955","sub_service_master":{"sub_cat_name":"Dry Cleaning","sub_cat_image":"/media/dry_5CJhkjo.jpeg"}}

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

/// sub_cat_id : "ac5cbc4f-7dbe-40cd-9e42-e7e3e0aa8955"
/// sub_service_master : {"sub_cat_name":"Dry Cleaning","sub_cat_image":"/media/dry_5CJhkjo.jpeg"}

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

/// sub_cat_name : "Dry Cleaning"
/// sub_cat_image : "/media/dry_5CJhkjo.jpeg"

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

/// category_id : "ee6b720e-f5aa-45aa-9d7b-c55f2c37fd9b"
/// service_master : {"category_name":"Dry Cleaning","category_image":"/media/dry.jpeg"}

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

/// category_name : "Dry Cleaning"
/// category_image : "/media/dry.jpeg"

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

/// item_id : "a4b6880c-faa4-4dda-9e28-b3b690e8df95"
/// item_name : "Shirts"
/// item_image : "/media/shirts.jpeg"

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

/// order_id : "e5acda13-1cb9-4b41-8f6b-3a6446597abd"
/// created_date : "2024-01-12T09:25:28.603409Z"
/// order_number : "8bdbd124"
/// pickup_date : "2024-01-12"
/// pickup_time : "10:00 AM - 11:00 AM"
/// customer : "a59b6ef2-e15e-4175-80c3-141e8caf720c"
/// total_amount : "20.00"
/// Delivery_date : "2024-01-19"
/// status : "Delivered"
/// order_date : "2024-01-18"
/// Delivery_time : "09:34"
/// order_type : "Normal"
/// net_taxable : "20.00"
/// vat : "5"

class Order {
  Order({
      String? orderId, 
      String? createdDate, 
      String? orderNumber, 
      String? pickupDate, 
      String? pickupTime, 
      String? customer, 
      String? totalAmount, 
      String? deliveryDate, 
      String? status, 
      String? orderDate, 
      String? deliveryTime, 
      String? orderType, 
      String? netTaxable, 
      String? vat,}){
    _orderId = orderId;
    _createdDate = createdDate;
    _orderNumber = orderNumber;
    _pickupDate = pickupDate;
    _pickupTime = pickupTime;
    _customer = customer;
    _totalAmount = totalAmount;
    _deliveryDate = deliveryDate;
    _status = status;
    _orderDate = orderDate;
    _deliveryTime = deliveryTime;
    _orderType = orderType;
    _netTaxable = netTaxable;
    _vat = vat;
}

  Order.fromJson(dynamic json) {
    _orderId = json['order_id'];
    _createdDate = json['created_date'];
    _orderNumber = json['order_number'];
    _pickupDate = json['pickup_date'];
    _pickupTime = json['pickup_time'];
    _customer = json['customer'];
    _totalAmount = json['total_amount'];
    _deliveryDate = json['Delivery_date'];
    _status = json['status'];
    _orderDate = json['order_date'];
    _deliveryTime = json['Delivery_time'];
    _orderType = json['order_type'];
    _netTaxable = json['net_taxable'];
    _vat = json['vat'];
  }
  String? _orderId;
  String? _createdDate;
  String? _orderNumber;
  String? _pickupDate;
  String? _pickupTime;
  String? _customer;
  String? _totalAmount;
  String? _deliveryDate;
  String? _status;
  String? _orderDate;
  String? _deliveryTime;
  String? _orderType;
  String? _netTaxable;
  String? _vat;
Order copyWith({  String? orderId,
  String? createdDate,
  String? orderNumber,
  String? pickupDate,
  String? pickupTime,
  String? customer,
  String? totalAmount,
  String? deliveryDate,
  String? status,
  String? orderDate,
  String? deliveryTime,
  String? orderType,
  String? netTaxable,
  String? vat,
}) => Order(  orderId: orderId ?? _orderId,
  createdDate: createdDate ?? _createdDate,
  orderNumber: orderNumber ?? _orderNumber,
  pickupDate: pickupDate ?? _pickupDate,
  pickupTime: pickupTime ?? _pickupTime,
  customer: customer ?? _customer,
  totalAmount: totalAmount ?? _totalAmount,
  deliveryDate: deliveryDate ?? _deliveryDate,
  status: status ?? _status,
  orderDate: orderDate ?? _orderDate,
  deliveryTime: deliveryTime ?? _deliveryTime,
  orderType: orderType ?? _orderType,
  netTaxable: netTaxable ?? _netTaxable,
  vat: vat ?? _vat,
);
  String? get orderId => _orderId;
  String? get createdDate => _createdDate;
  String? get orderNumber => _orderNumber;
  String? get pickupDate => _pickupDate;
  String? get pickupTime => _pickupTime;
  String? get customer => _customer;
  String? get totalAmount => _totalAmount;
  String? get deliveryDate => _deliveryDate;
  String? get status => _status;
  String? get orderDate => _orderDate;
  String? get deliveryTime => _deliveryTime;
  String? get orderType => _orderType;
  String? get netTaxable => _netTaxable;
  String? get vat => _vat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = _orderId;
    map['created_date'] = _createdDate;
    map['order_number'] = _orderNumber;
    map['pickup_date'] = _pickupDate;
    map['pickup_time'] = _pickupTime;
    map['customer'] = _customer;
    map['total_amount'] = _totalAmount;
    map['Delivery_date'] = _deliveryDate;
    map['status'] = _status;
    map['order_date'] = _orderDate;
    map['Delivery_time'] = _deliveryTime;
    map['order_type'] = _orderType;
    map['net_taxable'] = _netTaxable;
    map['vat'] = _vat;
    return map;
  }

}