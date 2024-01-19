/// status : true
/// data : {"cart":[{"cart_id":"06d55b7b-209b-4d05-be6f-9d0d11013568","order":{"order_id":"dde383d4-b480-4733-9272-ee42b7b5cee4","created_date":"2024-01-05T04:55:38.781350Z","order_number":"924a8124","total_amount":"4.0","Delivery_date":"2024-01-05","Delivery_time":"09:00 AM - 10:00 AM","order_type":"Normal","net_taxable":"0","vat":"0"},"quantity":"2","amount":"4","item_service":{"item_ser_id":"7b122c67-a82a-4fec-9b19-439d7dfec0de","item":{"item_id":"a4b6880c-faa4-4dda-9e28-b3b690e8df95","item_name":"Shirts","item_image":"/media/shirts.jpeg"},"category":{"category_id":"3c407064-2f5a-478d-8fc7-c9640c99bf43","service_master":{"category_name":"Wash Only","category_image":"/media/washing_jNMZn9m.jpg"}},"sub_category":{"sub_cat_id":"6fb7ea9a-4f2b-47f0-8b66-17269fe667ce","sub_service_master":{"sub_cat_name":"Only Washing","sub_cat_image":"/media/hand_washing_dAZqyrz.jpg"}}},"price_list":"204f52f9-2028-4c97-877f-796fc6fc225a"}],"cart_count":1,"wallet_balance":"1116.0","delivery_address":{"name":null,"building_no":null,"room_no":null,"building_name":null,"floor_number":null,"flat_number":null},"payment_method":"Cash"}
/// message : "Customer Cart List!"

class CustomerHomeOrderHistoryDetailModel {
  CustomerHomeOrderHistoryDetailModel({
      bool? status,
    OrderHistoryDetail? data,
      String? message,}){
    _status = status;
    _data = data;
    _message = message;
}

  CustomerHomeOrderHistoryDetailModel.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? OrderHistoryDetail.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _status;
  OrderHistoryDetail? _data;
  String? _message;
CustomerHomeOrderHistoryDetailModel copyWith({  bool? status,
  OrderHistoryDetail? data,
  String? message,
}) => CustomerHomeOrderHistoryDetailModel(  status: status ?? _status,
  data: data ?? _data,
  message: message ?? _message,
);
  bool? get status => _status;
  OrderHistoryDetail? get data => _data;
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

/// cart : [{"cart_id":"06d55b7b-209b-4d05-be6f-9d0d11013568","order":{"order_id":"dde383d4-b480-4733-9272-ee42b7b5cee4","created_date":"2024-01-05T04:55:38.781350Z","order_number":"924a8124","total_amount":"4.0","Delivery_date":"2024-01-05","Delivery_time":"09:00 AM - 10:00 AM","order_type":"Normal","net_taxable":"0","vat":"0"},"quantity":"2","amount":"4","item_service":{"item_ser_id":"7b122c67-a82a-4fec-9b19-439d7dfec0de","item":{"item_id":"a4b6880c-faa4-4dda-9e28-b3b690e8df95","item_name":"Shirts","item_image":"/media/shirts.jpeg"},"category":{"category_id":"3c407064-2f5a-478d-8fc7-c9640c99bf43","service_master":{"category_name":"Wash Only","category_image":"/media/washing_jNMZn9m.jpg"}},"sub_category":{"sub_cat_id":"6fb7ea9a-4f2b-47f0-8b66-17269fe667ce","sub_service_master":{"sub_cat_name":"Only Washing","sub_cat_image":"/media/hand_washing_dAZqyrz.jpg"}}},"price_list":"204f52f9-2028-4c97-877f-796fc6fc225a"}]
/// cart_count : 1
/// wallet_balance : "1116.0"
/// delivery_address : {"name":null,"building_no":null,"room_no":null,"building_name":null,"floor_number":null,"flat_number":null}
/// payment_method : "Cash"

class OrderHistoryDetail {
  OrderHistoryDetail({
      List<Cart>? cart, 
      num? cartCount, 
      String? walletBalance, 
      DeliveryAddress? deliveryAddress, 
      String? paymentMethod,}){
    _cart = cart;
    _cartCount = cartCount;
    _walletBalance = walletBalance;
    _deliveryAddress = deliveryAddress;
    _paymentMethod = paymentMethod;
}

  OrderHistoryDetail.fromJson(dynamic json) {
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
  }
  List<Cart>? _cart;
  num? _cartCount;
  String? _walletBalance;
  DeliveryAddress? _deliveryAddress;
  String? _paymentMethod;
  OrderHistoryDetail copyWith({  List<Cart>? cart,
  num? cartCount,
  String? walletBalance,
  DeliveryAddress? deliveryAddress,
  String? paymentMethod,
}) => OrderHistoryDetail(  cart: cart ?? _cart,
  cartCount: cartCount ?? _cartCount,
  walletBalance: walletBalance ?? _walletBalance,
  deliveryAddress: deliveryAddress ?? _deliveryAddress,
  paymentMethod: paymentMethod ?? _paymentMethod,
);
  List<Cart>? get cart => _cart;
  num? get cartCount => _cartCount;
  String? get walletBalance => _walletBalance;
  DeliveryAddress? get deliveryAddress => _deliveryAddress;
  String? get paymentMethod => _paymentMethod;

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
    return map;
  }

}

/// name : null
/// building_no : null
/// room_no : null
/// building_name : null
/// floor_number : null
/// flat_number : null

class DeliveryAddress {
  DeliveryAddress({
      dynamic name, 
      dynamic buildingNo, 
      dynamic roomNo, 
      dynamic buildingName, 
      dynamic floorNumber, 
      dynamic flatNumber,}){
    _name = name;
    _buildingNo = buildingNo;
    _roomNo = roomNo;
    _buildingName = buildingName;
    _floorNumber = floorNumber;
    _flatNumber = flatNumber;
}

  DeliveryAddress.fromJson(dynamic json) {
    _name = json['name'];
    _buildingNo = json['building_no'];
    _roomNo = json['room_no'];
    _buildingName = json['building_name'];
    _floorNumber = json['floor_number'];
    _flatNumber = json['flat_number'];
  }
  dynamic _name;
  dynamic _buildingNo;
  dynamic _roomNo;
  dynamic _buildingName;
  dynamic _floorNumber;
  dynamic _flatNumber;
DeliveryAddress copyWith({  dynamic name,
  dynamic buildingNo,
  dynamic roomNo,
  dynamic buildingName,
  dynamic floorNumber,
  dynamic flatNumber,
}) => DeliveryAddress(  name: name ?? _name,
  buildingNo: buildingNo ?? _buildingNo,
  roomNo: roomNo ?? _roomNo,
  buildingName: buildingName ?? _buildingName,
  floorNumber: floorNumber ?? _floorNumber,
  flatNumber: flatNumber ?? _flatNumber,
);
  dynamic get name => _name;
  dynamic get buildingNo => _buildingNo;
  dynamic get roomNo => _roomNo;
  dynamic get buildingName => _buildingName;
  dynamic get floorNumber => _floorNumber;
  dynamic get flatNumber => _flatNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['building_no'] = _buildingNo;
    map['room_no'] = _roomNo;
    map['building_name'] = _buildingName;
    map['floor_number'] = _floorNumber;
    map['flat_number'] = _flatNumber;
    return map;
  }

}

/// cart_id : "06d55b7b-209b-4d05-be6f-9d0d11013568"
/// order : {"order_id":"dde383d4-b480-4733-9272-ee42b7b5cee4","created_date":"2024-01-05T04:55:38.781350Z","order_number":"924a8124","total_amount":"4.0","Delivery_date":"2024-01-05","Delivery_time":"09:00 AM - 10:00 AM","order_type":"Normal","net_taxable":"0","vat":"0"}
/// quantity : "2"
/// amount : "4"
/// item_service : {"item_ser_id":"7b122c67-a82a-4fec-9b19-439d7dfec0de","item":{"item_id":"a4b6880c-faa4-4dda-9e28-b3b690e8df95","item_name":"Shirts","item_image":"/media/shirts.jpeg"},"category":{"category_id":"3c407064-2f5a-478d-8fc7-c9640c99bf43","service_master":{"category_name":"Wash Only","category_image":"/media/washing_jNMZn9m.jpg"}},"sub_category":{"sub_cat_id":"6fb7ea9a-4f2b-47f0-8b66-17269fe667ce","sub_service_master":{"sub_cat_name":"Only Washing","sub_cat_image":"/media/hand_washing_dAZqyrz.jpg"}}}
/// price_list : "204f52f9-2028-4c97-877f-796fc6fc225a"

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

/// item_ser_id : "7b122c67-a82a-4fec-9b19-439d7dfec0de"
/// item : {"item_id":"a4b6880c-faa4-4dda-9e28-b3b690e8df95","item_name":"Shirts","item_image":"/media/shirts.jpeg"}
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

/// order_id : "dde383d4-b480-4733-9272-ee42b7b5cee4"
/// created_date : "2024-01-05T04:55:38.781350Z"
/// order_number : "924a8124"
/// total_amount : "4.0"
/// Delivery_date : "2024-01-05"
/// Delivery_time : "09:00 AM - 10:00 AM"
/// order_type : "Normal"
/// net_taxable : "0"
/// vat : "0"

class Order {
  Order({
      String? orderId, 
      String? createdDate, 
      String? orderNumber, 
      String? totalAmount, 
      String? deliveryDate, 
      String? deliveryTime, 
      String? orderType, 
      String? netTaxable, 
      String? vat,}){
    _orderId = orderId;
    _createdDate = createdDate;
    _orderNumber = orderNumber;
    _totalAmount = totalAmount;
    _deliveryDate = deliveryDate;
    _deliveryTime = deliveryTime;
    _orderType = orderType;
    _netTaxable = netTaxable;
    _vat = vat;
}

  Order.fromJson(dynamic json) {
    _orderId = json['order_id'];
    _createdDate = json['created_date'];
    _orderNumber = json['order_number'];
    _totalAmount = json['total_amount'];
    _deliveryDate = json['Delivery_date'];
    _deliveryTime = json['Delivery_time'];
    _orderType = json['order_type'];
    _netTaxable = json['net_taxable'];
    _vat = json['vat'];
  }
  String? _orderId;
  String? _createdDate;
  String? _orderNumber;
  String? _totalAmount;
  String? _deliveryDate;
  String? _deliveryTime;
  String? _orderType;
  String? _netTaxable;
  String? _vat;
Order copyWith({  String? orderId,
  String? createdDate,
  String? orderNumber,
  String? totalAmount,
  String? deliveryDate,
  String? deliveryTime,
  String? orderType,
  String? netTaxable,
  String? vat,
}) => Order(  orderId: orderId ?? _orderId,
  createdDate: createdDate ?? _createdDate,
  orderNumber: orderNumber ?? _orderNumber,
  totalAmount: totalAmount ?? _totalAmount,
  deliveryDate: deliveryDate ?? _deliveryDate,
  deliveryTime: deliveryTime ?? _deliveryTime,
  orderType: orderType ?? _orderType,
  netTaxable: netTaxable ?? _netTaxable,
  vat: vat ?? _vat,
);
  String? get orderId => _orderId;
  String? get createdDate => _createdDate;
  String? get orderNumber => _orderNumber;
  String? get totalAmount => _totalAmount;
  String? get deliveryDate => _deliveryDate;
  String? get deliveryTime => _deliveryTime;
  String? get orderType => _orderType;
  String? get netTaxable => _netTaxable;
  String? get vat => _vat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = _orderId;
    map['created_date'] = _createdDate;
    map['order_number'] = _orderNumber;
    map['total_amount'] = _totalAmount;
    map['Delivery_date'] = _deliveryDate;
    map['Delivery_time'] = _deliveryTime;
    map['order_type'] = _orderType;
    map['net_taxable'] = _netTaxable;
    map['vat'] = _vat;
    return map;
  }

}