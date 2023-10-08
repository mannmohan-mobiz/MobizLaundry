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
