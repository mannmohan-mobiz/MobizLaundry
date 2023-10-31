part of 'customer_bloc.dart';

abstract class CustomerState extends Equatable {
  const CustomerState();
}

class CustomerInitial extends CustomerState {
  @override
  List<Object> get props => [];
}

class CustomerBalanceFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CustomerBalanceFetched extends CustomerState {
  final CData c_data;

  CustomerBalanceFetched(this.c_data);

  @override
  List<Object?> get props => [c_data];
}

class CustomerBalanceError extends CustomerState {
  final String message;

  CustomerBalanceError(this.message);

  @override
  List<Object?> get props => [message];
}
