part of 'service_bloc.dart';

abstract class ServiceEvent extends Equatable {
  const ServiceEvent();
}

// Dashboard Count
class ServiceDashboardCountEvent extends ServiceEvent {
  final String token;
  final String userId;

  ServiceDashboardCountEvent(this.token, this.userId);
  @override
  // TODO: implement props
  List<Object?> get props => [token, userId];

}

// Pending order list
class ServicePendingOrderEvent extends ServiceEvent {
  final String token;
  final String userId;

  ServicePendingOrderEvent(this.token, this.userId);
  @override
  List<Object?> get props => [token, userId];

}

// Dispatched Order List
class ServiceDispatchedOrderEvent extends ServiceEvent {
  final String token;
  final String userId;

  ServiceDispatchedOrderEvent(this.token, this.userId);
  @override
  List<Object?> get props => [token, userId];

}

// Dispatched Order Details
class ServiceDispatchedOrderDetailsEvent extends ServiceEvent {
  final String token;
  final String userId;
  final String orderId;

  ServiceDispatchedOrderDetailsEvent(this.token, this.userId, this.orderId);
  @override
  List<Object?> get props => [token, userId,orderId];

}

// InProcessOrderList
class ServiceInProcessOrderListEvent extends ServiceEvent {
  final String token;
  final String userId;

  ServiceInProcessOrderListEvent(this.token, this.userId);
  @override
  List<Object?> get props => [token, userId];

}

// InProcessOrderData
class ServiceInProcessOrderDetailsEvent extends ServiceEvent {
  final String token;
  final Map<String, String> body;

  ServiceInProcessOrderDetailsEvent(this.token, this.body);
  @override
  List<Object?> get props => [token, body];

}

// Completed Order List
class ServiceCompletedOrderListEvent extends ServiceEvent {
  final String token;
  final String id;

  ServiceCompletedOrderListEvent(this.token, this.id);

  @override
  List<Object?> get props => [token, id];
}

// Ready for Deliver List
class ServiceReadyToDeliverOrderListEvent extends ServiceEvent {
  final String token;
  final String id;

  ServiceReadyToDeliverOrderListEvent(this.token, this.id);

  @override
  List<Object?> get props => [token, id];
}

// Undelivered Order List
class ServiceUndeliveredOrderListEvent extends ServiceEvent {
  final String token;
  final String id;

  ServiceUndeliveredOrderListEvent(this.token, this.id);

  @override
  List<Object?> get props => [token, id];
}

// LocPrc Fetching
class ServiceLocPrcFetchingEvent extends ServiceEvent {
  final String token;

  ServiceLocPrcFetchingEvent(this.token);

  @override
  List<Object?> get props => [token];
}

// Add new client
class ServiceAddnewClientEvent extends ServiceEvent {
  final String token;
  final Map<String , String> body;

  ServiceAddnewClientEvent(this.token, this.body);

  @override
  // TODO: implement props
  List<Object?> get props => [token, body];
}

// Client List
class ServiceClientListFetchEvent extends ServiceEvent {
  final String token;
  final String userId;

  ServiceClientListFetchEvent(this.token, this.userId);

  @override
  List<Object?> get props => [token, userId];
}

// Client Details
class ServiceClientDetailsEvent extends ServiceEvent {
  final String token;
  final Map<String, String> body;

  ServiceClientDetailsEvent(this.token, this.body);

  @override
  List<Object?> get props => [token, body];
}

// Complaint List Fetching
// class ComplaintListFetchEvent extends ServiceEvent{
//   final String token;
//   final String id;
//
//   ComplaintListFetchEvent(this.token, this.id);
//
//   @override
//   List<Object?> get props => [token, id];
// }
