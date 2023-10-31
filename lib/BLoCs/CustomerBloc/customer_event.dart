part of 'customer_bloc.dart';

abstract class CustomerEvent extends Equatable {
  const CustomerEvent();
}

class GetBalanceEvent extends CustomerEvent {
  final String token;
  final String id;

  GetBalanceEvent(this.token, this.id);

  @override
  List<Object?> get props => [token, id];
}
