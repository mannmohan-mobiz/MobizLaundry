part of 'picker_bloc.dart';

abstract class PickerEvent extends Equatable {
  const PickerEvent();
}

// Dashboard Counts
class GetDashboardCountEvent extends PickerEvent {
  final String token;
  final String userid;

  GetDashboardCountEvent(this.token, this.userid);

  @override
  List<Object?> get props => [token, userid];
}

// Deposit Add
class AddDepositEvent extends PickerEvent {
  final String token;
  final String userId;
  final String amount;

  AddDepositEvent(this.token, this.userId, this.amount);

  @override
  List<Object?> get props => [token, userId, amount];
}

// Get Expense Head
class ExpenseHeadGetEvent extends PickerEvent {
  final String token;
  ExpenseHeadGetEvent(this.token);
  @override
  List<Object?> get props => [token];
}

// Add Expene
class ExpenseAddEvent extends PickerEvent {
  Map<String, String> body;
  final String token;
  ExpenseAddEvent(this.body, this.token);

  @override
  List<Object?> get props => [body, token];
}

// List all Expenses
class ExpenseListFetchEvent extends PickerEvent {
  final String token;
  final String id;

  ExpenseListFetchEvent(this.token, this.id);

  @override
  List<Object?> get props =>[token, id];
}

// List OutStanding
class OutstandingDueFetchEvent extends PickerEvent {
  final String id;
  final String token;

  OutstandingDueFetchEvent(this.id, this.token);
  @override
  List<Object?> get props => [id, token];
}

// List Deposit History
class DepositHistoryFetchEvent extends PickerEvent {
  final String token;
  final Map<String, String> body;

  DepositHistoryFetchEvent(this.token, this.body);

  @override
  List<Object?> get props => [token, body];
}

// Order history List
class OrderHistoryListEvent extends PickerEvent {
  final String token;
  final Map<String, String> data;

  OrderHistoryListEvent(this.token, this.data);

  @override
  List<Object?> get props => [token, data];
}

// order details
class OrderDetailsEvent extends PickerEvent {
  final String token;
  final String ordNo;

  OrderDetailsEvent(this.token, this.ordNo);

  @override
  List<Object?> get props => [token, ordNo];
}

// Collection List Event
class CollectionListFetchEvent extends PickerEvent {
  final String token;
  final Map<String, String> data;

  CollectionListFetchEvent(this.token, this.data);

  @override
  List<Object?> get props => [token, data];
}

// Pickup List
class PickupListFetchEvent extends PickerEvent {
  final String token;
  final String id;

  PickupListFetchEvent(this.token, this.id);

  @override
  List<Object?> get props => [token, id];
}

// Ready For Despatch
class ReadyForDespatchListFetchEvent extends PickerEvent {
  final String token;
  final String id;

  ReadyForDespatchListFetchEvent(this.token, this.id);

  @override
  List<Object?> get props => [token, id];
}

// Undelivered
class UndeliveredListFetchEvent extends PickerEvent {
  final String token;
  final String id;

  UndeliveredListFetchEvent(this.token, this.id);

  @override
  List<Object?> get props => [token, id];
}


// Confirm New Order
class PickerConfirmOrderEvent extends PickerEvent {
  final Map<String, String> body;
  final String token;

  PickerConfirmOrderEvent(this.body, this.token);

  @override
  // TODO: implement props
  List<Object?> get props => [body, token];
}

// Pickup Confirmed List
class PickupConfirmedListFetchEvent extends PickerEvent {
  final String token;
  final String id;

  PickupConfirmedListFetchEvent(this.token, this.id);

  @override
  List<Object?> get props => [token, id];
}

// Pickup Search Customer List
class PickupSearchCustomerListFetchEvent extends PickerEvent {
  final String token;
  final String key;

  const PickupSearchCustomerListFetchEvent(this.token, this.key);

  @override
  List<Object?> get props => [token, key];
}

// Pickup Delivery date List
class PickupDeliveryDateListFetchEvent extends PickerEvent {
  final String token;
  final String mode;

  const PickupDeliveryDateListFetchEvent(this.token, this.mode);

  @override
  List<Object?> get props => [token, mode];
}

// Pickup Delivery Time List
class PickupDeliveryTimeListFetchEvent extends PickerEvent {
  final String token;
  final String deliveryDate;

  const PickupDeliveryTimeListFetchEvent(this.token, this.deliveryDate);

  @override
  List<Object?> get props => [token, deliveryDate];
}

// Pickup Delivery mode List
class PickupDeliveryModeFetchEvent extends PickerEvent {
  final String token;
  const PickupDeliveryModeFetchEvent(this.token);

  @override
  List<Object?> get props => [token];
}

// Delivered orders List
class PickupDeliveredOrdersFetchEvent extends PickerEvent {
  final String token;
  const PickupDeliveredOrdersFetchEvent(this.token);

  @override
  List<Object?> get props => [token];
}


// Pickup Delivery address List
class PickupDeliveryAddressFetchEvent extends PickerEvent {
   final CartList data;
  final Map<String, dynamic> address;
  const PickupDeliveryAddressFetchEvent(this.data,this.address);

  @override
  List<Object?> get props => [data,address];
}

// Pickup Delivery mode List
class PickupPaymentListFetchEvent extends PickerEvent {
  final String token;
  const PickupPaymentListFetchEvent(this.token);

  @override
  List<Object?> get props => [token];
}

// Punch In
class PickerPunchInOutEvent extends PickerEvent {
  final String token;
  final String task;
  final String id;

  PickerPunchInOutEvent(this.token, this.id, this.task);

  @override
  List<Object?> get props => [token, id];
}

// Location Price Group
class FetchLocationPriceEvent extends PickerEvent {
  final String token;

  FetchLocationPriceEvent(this.token);
  @override
  List<Object?> get props => [token];
}

// Add Client
class AddNewClientEvent extends PickerEvent {
  final Map<String, String> body;
  final String token;

  AddNewClientEvent(this.body, this.token);

  @override
  List<Object?> get props => [body, token];
}

// List Client
class ListAllClientsEvent extends PickerEvent {
  final String id;
  final String token;

  ListAllClientsEvent(this.id, this.token);
  @override
  List<Object?> get props => [id, token];

}

// Add New Order
class AddNewOrderEvent extends PickerEvent {
  final Map<String, String> body;
  final String token;

  AddNewOrderEvent(this.body, this.token);

  @override
  List<Object?> get props => [body, token];
}

// Get Category
class PckCategoryFetchEvent extends PickerEvent {
  final String token;
  final String id;

  PckCategoryFetchEvent(this.token, this.id);

  @override
  List<Object?> get props => [token, id];
}

// Get Sub Category
class PckSubCategoryFetchEvent extends PickerEvent {
  final String token;
  final String categId;

  PckSubCategoryFetchEvent(this.token, this.categId);

  @override
  List<Object?> get props => [token, categId];
}

// Get Cart List
class PckCartListFetchEvent extends PickerEvent {
  final String token;
  final String ordId;

  PckCartListFetchEvent(this.token, this.ordId);

  @override
  List<Object?> get props => [token, ordId];
}

// Get Collect Items List
class PckCollectItemsFetchEvent extends PickerEvent {
  final String token;
  final String ordId;

  PckCollectItemsFetchEvent(this.token, this.ordId);

  @override
  List<Object?> get props => [token, ordId];
}

// Get Order Report List
class PckOrderReportFetchEvent extends PickerEvent {
  final String token;
  final String id;
  final String fDate;
  final String tDate;

  PckOrderReportFetchEvent(this.token,this.id, this.fDate,this.tDate);

  @override
  List<Object?> get props => [token, fDate,tDate,id];
}

// Get Order Report Detail
class PckOrderReportDetailFetchEvent extends PickerEvent {
  final String token;
  final String ordId;

  PckOrderReportDetailFetchEvent(this.token,this.ordId);

  @override
  List<Object?> get props => [token, ordId];
}


// Get customer order history detail List
class PckCustomerHistoryDetailFetchEvent extends PickerEvent {
  final String token;
  final String ordId;

  PckCustomerHistoryDetailFetchEvent(this.token, this.ordId);

  @override
  List<Object?> get props => [token, ordId];
}

// Get Thankyou list
class PckThankListFetchEvent extends PickerEvent {
  final String token;
  final String ordId;
  final String customId;

  PckThankListFetchEvent(this.token, this.ordId,this.customId);

  @override
  List<Object?> get props => [token, ordId, customId];
}

// customer home
class CustomerHomeFetchEvent extends PickerEvent {
  final String token;
  final String customId;

  CustomerHomeFetchEvent(this.token,this.customId);

  @override
  List<Object?> get props => [token, customId];
}

// customer home add to wallet
class AddToWalletFetchEvent extends PickerEvent {
  final String token;
  final String customId;

  AddToWalletFetchEvent(this.token,this.customId);

  @override
  List<Object?> get props => [token, customId];
}

// customer home wallet recharge receipt
class WalletRechargeReceiptFetchEvent extends PickerEvent {
  final String token;
  final String transfId;

  WalletRechargeReceiptFetchEvent(this.token,this.transfId);

  @override
  List<Object?> get props => [token, transfId];
}

class PckItemFetchEvent extends PickerEvent {
  final String token;
  final String categId;
  final String subCategId;
  final String custId;
  final String ordIdd;


  PckItemFetchEvent(this.token, this.categId, this.subCategId, this.custId,this.ordIdd);

  @override
  List<Object?> get props => [token, categId, subCategId, custId, ordIdd];
}

class PckAddtoCartEvent extends PickerEvent {
  final Map<String, String> body;
  final String token;

  PckAddtoCartEvent(this.body, this.token);



  @override
  List<Object?> get props => [token,body];
}