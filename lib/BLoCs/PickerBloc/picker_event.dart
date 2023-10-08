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