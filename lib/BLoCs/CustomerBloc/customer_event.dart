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


class GetCategoryEvent extends CustomerEvent {
  final String token;
  final String id;

  GetCategoryEvent(this.token, this.id);

  @override
  List<Object> get props => [token, id]  ;
}

class GetSubCategoryEvent extends CustomerEvent {
  final String token;
  final String cat_id;

  GetSubCategoryEvent(this.token, this.cat_id);

  @override
  List<Object> get props => [token, cat_id]  ;
}

class GetItemEvent extends CustomerEvent {
  final String token;
  final Map<String, String> body;

  GetItemEvent(this.token, this.body);

  @override
  List<Object?> get props => [token, body];
}