part of 'picker_bloc.dart';

abstract class PickerState extends Equatable {
  int navIndex = 0;
   PickerState({this.navIndex = 0});
}

class PickerInitial extends PickerState {
  @override
  List<Object> get props => [];
}

/***********************[Dashboard Counts]***********************/
class DashboardCountGettingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class DashboardCountGotState extends PickerState {
  DashboardData dashData;
  DashboardCountGotState(this.dashData);
  @override
  List<Object?> get props => [dashData];
}

class DashboardCountErrorState extends PickerState {
  final String message;

  DashboardCountErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Dashboard Counts]***********************/

/***********************[Deposit Add]***********************/
class DepositAddingState extends PickerState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DepositAddedState extends PickerState {
  final DateTime? createdDate;
  final String? totalAmount;
  final String? excess;
  final String? short;
  final String? staff;

  DepositAddedState(this.createdDate, this.totalAmount, this.excess, this.short, this.staff,);

  @override
  // TODO: implement props
  List<Object?> get props => [
    createdDate,
    totalAmount,
    excess,
    short,
    staff
  ];
}

class DepositErrorState extends PickerState {
  final String message;

  DepositErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
/***********************[Deposit Add]***********************/

/***********************[Get Expense Head]***********************/
class ExpenseHeadGettingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class ExpenseHeadSuccessState extends PickerState {
  final String data;
  ExpenseHeadSuccessState(this.data);

  @override
  List<Object?> get props => [data];
}

class ExpenseHeadErrorState extends PickerState {
  final String message;
  ExpenseHeadErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Get Expense Head]***********************/

/***********************[Add Expense]***********************/
class AddingExpenseState extends PickerState {
  @override
  List<Object?> get props => [];
}

class AddedExpenseState extends PickerState {
  @override
  List<Object?> get props => [];
}

class ErrorExpenseState extends PickerState {
  final String message;
  ErrorExpenseState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Add Expense]***********************/

/***********************[Get All Expense]***********************/
class ExpenseFetchingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class ExpenseFetchedState extends PickerState {
  final List<Datum> expenseData;

  ExpenseFetchedState(this.expenseData);
  @override
  List<Object?> get props => [expenseData];

}

class ExpenseErrorState extends PickerState {
  final String message;

  ExpenseErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Get All Expense]***********************/

/***********************[Outstanding Dues]***********************/
class OutstandingFetchingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class OutstandingFetchedState extends PickerState {
  List<OutStand>? data = [];
  OutstandingFetchedState(this.data);

  @override
  // TODO: implement props
  List<Object?> get props => [data];
}

class OutStandingErrorState extends PickerState {
  final String message;

  OutStandingErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Outstanding Dues]***********************/

/***********************[Outstanding Dues]***********************/
class DepositHistoryFetching extends PickerState {
  @override
  List<Object?> get props => [];
}

class DepostiHistoryFetched extends PickerState {
  List<DepoHist> data = [];
  DepostiHistoryFetched(this.data);
  @override
  List<Object?> get props => [data];
}

class DepositHistoryError extends PickerState {
  final String message;

  DepositHistoryError(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Outstanding Dues]***********************/

/***********************[Order History List]***********************/
class OrderHistoryFetching extends PickerState {
  @override
  List<Object?> get props => [];
}

class OrderdHistoryFetched extends PickerState {
     List<OrderHist> data=[];
     TotalCount tc;
    OrderdHistoryFetched(this.data, this.tc);
  @override
  List<Object?> get props => [data, tc];
}

class OrderHistoryError extends PickerState {
  final String message;

  OrderHistoryError(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Order History List]***********************/

/***********************[Order Details]***********************/
class OrderDetailsFetching extends PickerState {
  @override
  List<Object?> get props => [];
}

class OrderDetailsFetched extends PickerState {
  final Data finalData;

  OrderDetailsFetched(this.finalData);

  @override
  List<Object?> get props => [finalData];
}

class OrderDetailsError extends PickerState {
  final String message;

  OrderDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Order Details]***********************/

/***********************Collection List]***********************/
class CollectionListFetchingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class CollectionListFetchedState extends PickerState {
  List data = [];
  CollectionListFetchedState(this.data);

  @override
  List<Object?> get props => [data];
}

class CollectionListErrorState extends PickerState {
  final String message;

  CollectionListErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************Collection List]***********************/

/***********************[Pickup List]***********************/
class PickupListFetching extends PickerState {
  @override
  List<Object?> get props => [];
}

class PickupListFetched extends PickerState {
  List<PckPickupList> fData;

  PickupListFetched(this.fData);

  @override
  List<Object?> get props => [fData];
}

class PickupListError extends PickerState {
  final String message;

  PickupListError(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Pickup List]***********************/


/***********************[Pickup ReadyForDespatch List]***********************/
class ReadyForDespatchListFetching extends PickerState {
  @override
  List<Object?> get props => [];
}

class ReadyForDespatchListFetched extends PickerState {
  List<ReadyForDespatchList> readyForList;

  ReadyForDespatchListFetched(this.readyForList);

  @override
  List<Object?> get props => [readyForList];
}

class ReadyForDespatchListError extends PickerState {
  final String message;

  ReadyForDespatchListError(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Pickup ReadyForDespatch List]***********************/

/***********************[Pickup Undelivered List]***********************/
class UndeliveredListFetching extends PickerState {
  @override
  List<Object?> get props => [];
}

class UndeliveredListFetched extends PickerState {
  List<Undelivered> unDeliveredList;

  UndeliveredListFetched(this.unDeliveredList);

  @override
  List<Object?> get props => [unDeliveredList];
}

class UndeliveredListError extends PickerState {
  final String message;

  UndeliveredListError(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Pickup Undelivered List]***********************/

/***********************[Order Confirm]***********************/
class OrderConfirmingState extends PickerState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OrderConfirmedState extends PickerState {
  final List<PckOrderCnfrmList> cnfrmList;

  OrderConfirmedState(this.cnfrmList);

  @override
  // TODO: implement props
  List<Object?> get props => [cnfrmList];
}

class OrderConfirmerrorState extends PickerState {
  final String message;

  OrderConfirmerrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
/***********************[Order Confirm]***********************/

/***********************[pickup Confirmed List]***********************/

class PickupConfirmedListFetching extends PickerState {
  @override
  List<Object?> get props => [];
}

class PickupConfirmedListFetched extends PickerState {
  List<pickerConfirmedList>? dataList;

  PickupConfirmedListFetched(this.dataList);

  @override
  List<Object?> get props => [dataList];
}


class PickupConfirmedListError extends PickerState {
  final String message;

  PickupConfirmedListError(this.message);

  @override
  List<Object?> get props => [message];
}

/***********************[pickup Confirmed List]***********************/


/***********************[search customer List]***********************/

class PickupSearchCustomerListFetching extends PickerState {
  @override
  List<Object?> get props => [];
}

class PickupSearchCustomerListFetched extends PickerState {
  List<CustomerData> searchList;

  PickupSearchCustomerListFetched(this.searchList);

  @override
  List<Object?> get props => [searchList];
}

class PickupSearchCustomerListError extends PickerState {
  final String message;

  PickupSearchCustomerListError(this.message);

  @override
  List<Object?> get props => [message];
}


/***********************[search customer List]***********************/


/***********************[Delivery Date List]***********************/

class PickupDeliveryDateListFetching extends PickerState {
  @override
  List<Object?> get props => [];
}

class PickupDeliveryDateListFetched extends PickerState {
  List<Date> date;

  PickupDeliveryDateListFetched(this.date);

  @override
  List<Object?> get props => [date];
}

class PickupDeliveryDateListError extends PickerState {
  final String message;

  PickupDeliveryDateListError(this.message);

  @override
  List<Object?> get props => [message];
}


/***********************[Delivery Date List]***********************/

/***********************[Delivery Time List]***********************/

class PickupDeliveryTimeListFetching extends PickerState {
  @override
  List<Object?> get props => [];
}

class PickupDeliveryTimeListFetched extends PickerState {
  List<String> time;

  PickupDeliveryTimeListFetched(this.time);

  @override
  List<Object?> get props => [time];
}

class PickupDeliveryTimeListError extends PickerState {
  final String message;

  PickupDeliveryTimeListError(this.message);

  @override
  List<Object?> get props => [message];
}

/***********************[Delivery Time List]***********************/

/***********************[Delivery Mode List]***********************/

class PickupDeliveryModeFetching extends PickerState {
  @override
  List<Object?> get props => [];
}

class PickupDeliveryModeFetched extends PickerState {
  List<DeliveryModes> deliveryModes;

  PickupDeliveryModeFetched(this.deliveryModes);

  @override
  List<Object?> get props => [deliveryModes];
}

class PickupDeliveryModeError extends PickerState {
  final String message;

  PickupDeliveryModeError(this.message);

  @override
  List<Object?> get props => [message];
}


/***********************[Delivery Mode List]***********************/

/***********************[Delivered orders List]***********************/

class DeliveredOrdersFetching extends PickerState {
  @override
  List<Object?> get props => [];
}

class DeliveredOrdersFetched extends PickerState {
  List<DeliveredOrder> deliveredOrderList;

  DeliveredOrdersFetched(this.deliveredOrderList);

  @override
  List<Object?> get props => [deliveredOrderList];
}

class DeliveredOrdersError extends PickerState {
  final String message;

  DeliveredOrdersError(this.message);

  @override
  List<Object?> get props => [message];
}

/***********************[Delivered orders List]***********************/


/***********************[Delivery address List]***********************/

class PickupDeliveryAddressFetching extends PickerState {
  @override
  List<Object?> get props => [];
}

class PickupDeliveryAddressFetched extends PickerState {
  List<Map<String, String?>>? deliveryAddress;

  PickupDeliveryAddressFetched(this.deliveryAddress);

  @override
  List<Object?> get props => [deliveryAddress];
}

class PickupDeliveryAddressError extends PickerState {
  final String message;

  PickupDeliveryAddressError(this.message);

  @override
  List<Object?> get props => [message];
}


/***********************[Delivery address List]***********************/

/***********************[Delivery Mode List]***********************/

class PickupPaymentListFetching extends PickerState {
  @override
  List<Object?> get props => [];
}

class PickupPaymentListFetched extends PickerState {
   List<PaymentList>? paymentList;

  PickupPaymentListFetched(this.paymentList);

  @override
  List<Object?> get props => [paymentList];
}

class PickupPaymentListError extends PickerState {
  final String message;

  PickupPaymentListError(this.message);

  @override
  List<Object?> get props => [message];
}


/***********************[Delivery Mode List]***********************/

/***********************[Picker Punch In]***********************/
class PickerPunchingInOutState extends PickerState {
  @override
  List<Object?> get props => [];
}

class PickerPunchedInOutState extends PickerState {
  final String punchIn_time;
  final String punchOut_time;

  PickerPunchedInOutState(this.punchIn_time, this.punchOut_time);

  @override
  List<Object?> get props => [punchIn_time, punchOut_time];
}

class PickerPunchingErrorState extends PickerState {
  final String message;

  PickerPunchingErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Picker Punch In]***********************/

/***********************[Location Price Group]***********************/
class LocationPriceFetching extends PickerState {
  @override
  List<Object?> get props => [];
}

class LocationPriceFetched extends PickerState {
  List<PriceGroupList> pgList = [];
  CustomerTypeList ctList;

  LocationPriceFetched(this.pgList, this.ctList);

  @override
  List<Object?> get props => [pgList, ctList];
}

class LocationPriceError extends PickerState {
  final String message;

  LocationPriceError(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Location Price Group]***********************/

/***********************[Add New Client]***********************/
class AddingNewclient extends PickerState {
  @override
  List<Object?> get props => [];
}

class AddedNewClient extends PickerState {
  final String message;

  AddedNewClient(this.message);

  @override
  List<Object?> get props => [message];
}

class AddNewClientError extends PickerState {
  final String message;

  AddNewClientError(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Add New Client]***********************/

/***********************[List my Client]***********************/
class FetchingClientList extends PickerState {
  @override
  List<Object?> get props => [];
}

class FetchedClientList extends PickerState {
  List<CustomerListData> customerList = [];

  FetchedClientList(this.customerList);

  @override
  // TODO: implement props
  List<Object?> get props => [customerList];
}

class FetchClientListError extends PickerState {
  final String message;

  FetchClientListError(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[List my Client]***********************/

/***********************[Add New Order]***********************/
class AddingNewOrderState extends PickerState {
  @override
  List<Object?> get props => [];
}

class AddedNewOrderState extends PickerState {
 final NewOrderData ordData;
  AddedNewOrderState(this.ordData);

  @override
  List<Object?> get props => [ordData];
}

class AddNewOrderErrorState extends PickerState {
  final String message;

  AddNewOrderErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Add New Order]***********************/

/***********************[Get Category]***********************/
class PckCategoryFetchingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class PckCategoryFetchedState extends PickerState {
  List<PickerCategList> categList = [];

  PckCategoryFetchedState(this.categList);

  @override
  List<Object?> get props => [categList];
}

class PckCategoryErrorState extends PickerState {
  final String message;

  PckCategoryErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Get Category]***********************/

/***********************[Get Sub Category]***********************/
class PckSubCategoryFetchingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class PckSubCategoryFetchedState extends PickerState {
  List<PickerSubCategList> subCategList = [];

  PckSubCategoryFetchedState(this.subCategList);

  @override
  List<Object?> get props => [subCategList];
}

class PckSubCategoryErrorState extends PickerState {
  final String message;

  PckSubCategoryErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Get Sub Category]***********************/


/***********************[Get Cart List]***********************/
class PckCartListFetchingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class PckCartListFetchedState extends PickerState {
  CartList? cartList;
  Map<String, dynamic?>? deliveryAddress;

  PckCartListFetchedState(this.cartList,this.deliveryAddress);

  @override
  List<Object?> get props => [cartList,deliveryAddress];
}

class PckCartListErrorState extends PickerState {
  final String message;

  PckCartListErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Get Cart List]]***********************/


/***********************[Get COLLECT ITEMS List]***********************/
class PckCollectItemsFetchingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class PckCollectItemsFetchedState extends PickerState {
  CollectItems? collectItemsData;

  PckCollectItemsFetchedState(this.collectItemsData);

  @override
  List<Object?> get props => [collectItemsData];
}

class PckCollectItemsErrorState extends PickerState {
  final String message;

  PckCollectItemsErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Get Cart List]]***********************/

/***********************[Get Order REport List]***********************/
class PckOrderReportFetchingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class PckOrderReportFetchedState extends PickerState {
  OrderReport? reportValues;

  PckOrderReportFetchedState(this.reportValues);

  @override
  List<Object?> get props => [reportValues];
}

class PckOrderReportErrorState extends PickerState {
  final String message;

  PckOrderReportErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Get Order REport List]]***********************/

/***********************[Get  statement account List]***********************/
class StatementAccountFetchingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class StatementAccountFetchedState extends PickerState {
  List<StatementAccoun> statementAccountList = [];

  StatementAccountFetchedState(this.statementAccountList);

  @override
  List<Object?> get props => [statementAccountList];
}

class StatementAccountErrorState extends PickerState {
  final String message;

  StatementAccountErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Get statement account List]]***********************/

/***********************[Get Customer History Detail List]***********************/
class PckCustHistoryDetailFetchingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class PckCustHistoryDetailFetchedState extends PickerState {
  OrderHistoryDetail? orderHistoryDetailList;

  PckCustHistoryDetailFetchedState(this.orderHistoryDetailList);

  @override
  List<Object?> get props => [orderHistoryDetailList];
}

class PckCustHistoryDetailErrorState extends PickerState {
  final String message;

  PckCustHistoryDetailErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Get Customer History Detail List]]***********************/

/***********************[Get Order Report Detail List]***********************/
class PckOrdReportDetailFetchingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class PckOrdReportDetailFetchedState extends PickerState {
  OrderReportDetail? orderReportDetailList;

  PckOrdReportDetailFetchedState(this.orderReportDetailList);

  @override
  List<Object?> get props => [orderReportDetailList];
}

class PckOrdReportDetailErrorState extends PickerState {
  final String message;

  PckOrdReportDetailErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Get Order Report Detail List]]***********************/

/***********************[Get Thankyou List]***********************/
class PckThankyouFetchingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class PckThankyouFetchedState extends PickerState {
  ThankyouDetail? thankYouDetail;

  PckThankyouFetchedState(this.thankYouDetail);

  @override
  List<Object?> get props => [thankYouDetail];
}

class PckThankyouErrorState extends PickerState {
  final String message;

  PckThankyouErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Get Thankyou List]]***********************/

/***********************[Customer Home]***********************/
class CustomerHomeFetchingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class CustomerHomeFetchedState extends PickerState {
  CustomerHome? customerHomeData;

  CustomerHomeFetchedState(this.customerHomeData);

  @override
  List<Object?> get props => [customerHomeData];
}

class CustomerHomeErrorState extends PickerState {
  final String message;

  CustomerHomeErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Customer Home]]***********************/


/***********************[Customer Home Add to wallet]***********************/
class AddToWalletFetchingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class AddToWalletFetchedState extends PickerState {
  AddToWallet? addToWalletData;

  AddToWalletFetchedState(this.addToWalletData);

  @override
  List<Object?> get props => [addToWalletData];
}

class AddToWalletErrorState extends PickerState {
  final String message;

  AddToWalletErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Customer Home Add to wallet]]***********************/

/***********************[wallet recharge receipt]***********************/
class WalletRechargeReceiptFetchingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class WalletRechargeReceiptFetchedState extends PickerState {
  WalletRechargeReceipt? walletRechargeReceiptData;

  WalletRechargeReceiptFetchedState(this.walletRechargeReceiptData);

  @override
  List<Object?> get props => [walletRechargeReceiptData];
}

class WalletRechargeReceiptErrorState extends PickerState {
  final String message;

  WalletRechargeReceiptErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[wallet recharge receipt]]***********************/

/***********************[Get Item List]***********************/
class PckItemFetchingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class PckItemFetchedState extends PickerState {
  List<PckItemPriceList> pckItemList = [];

  PckItemFetchedState(this.pckItemList);

  @override
  List<Object?> get props => [pckItemList];
}

class PckItemErrorState extends PickerState {
  final String message;

  PckItemErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Get Item List]***********************/

/***********************[Complaint List]***********************/
class ComplaintFetchingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class ComplaintFetchedState extends PickerState {
  Complaint? complaintList;

  ComplaintFetchedState(this.complaintList);

  @override
  List<Object?> get props => [complaintList];
}

class ComplaintErrorState extends PickerState {
  final String message;

  ComplaintErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Complaint List]***********************/

/***********************[Add new Complaint List]***********************/
class AddNewComplaintFetchingState extends PickerState {
  @override
  List<Object?> get props => [];
}

class AddNewComplaintFetchedState extends PickerState {
  AddNewComplaint? addNewComplaintList;

  AddNewComplaintFetchedState(this.addNewComplaintList);

  @override
  List<Object?> get props => [addNewComplaintList];
}

class AddNewComplaintErrorState extends PickerState {
  final String message;

  AddNewComplaintErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Add new  Complaint List]***********************/

/***********************[Add to Cart]***********************/
class PckAddingtoCartState extends PickerState {
  @override
  List<Object?> get props => [];
}

class PckAddedtoCartState extends PickerState {
  List<AddCartList> adCrtList = [];

  PckAddedtoCartState(this.adCrtList);

  @override
  List<Object?> get props => [adCrtList];
}

class PckAddtoCartError extends PickerState {
  final String message;

  PckAddtoCartError(this.message);

  @override
  List<Object?> get props => [message];
}
/***********************[Add to Cart]***********************/