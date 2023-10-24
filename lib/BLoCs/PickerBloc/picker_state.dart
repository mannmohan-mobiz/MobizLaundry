part of 'picker_bloc.dart';

abstract class PickerState extends Equatable {
  const PickerState();
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
  final int pickupPendingCount;
  final int confirmedCount;
  final int readyForDispatchCount;
  final int deliveredCount;
  final int notProcessedCount;
  final String depositeAmount;
  final int orderViaAppCount;
  final int orderViaStaffCount;
  final int orderViaDirectCount;

  DashboardCountGotState(
    this.pickupPendingCount,
    this.confirmedCount,
    this.readyForDispatchCount,
    this.deliveredCount,
    this.notProcessedCount,
    this.depositeAmount,
    this.orderViaAppCount,
    this.orderViaStaffCount,
    this.orderViaDirectCount,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [
    pickupPendingCount,
    confirmedCount,
    readyForDispatchCount,
    deliveredCount,
    notProcessedCount,
    depositeAmount,
    orderViaAppCount,
    orderViaStaffCount,
    orderViaDirectCount,
  ];
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
  List<PickupLst> fData;

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