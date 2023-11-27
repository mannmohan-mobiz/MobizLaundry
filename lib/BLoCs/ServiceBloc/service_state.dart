part of 'service_bloc.dart';

abstract class ServiceState extends Equatable {
  const ServiceState();
}

class ServiceInitial extends ServiceState {
  @override
  List<Object> get props => [];
}

class ServiceDashboardCountFetchingState extends ServiceState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ServiceDashboardCountFetchedState extends ServiceState {
  final DashboardCountData dashData;

  ServiceDashboardCountFetchedState(this.dashData);

  @override
  // TODO: implement props
  List<Object?> get props => [dashData];
}

class ServiceDashboardCountErrorState extends ServiceState {
  final String message;

  ServiceDashboardCountErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class ServicePendingOrderListFetchingState extends ServiceState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ServicePendingOrderListFetchedState extends ServiceState {
  final List<PendingOrderList> pendingOrderList;

  ServicePendingOrderListFetchedState(this.pendingOrderList);

  @override
  // TODO: implement props
  List<Object?> get props => [pendingOrderList];
}

class ServicePendingOrderListErrorState extends ServiceState {
  final String message;

  ServicePendingOrderListErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}


class ServiceDispatchedOrderListFetchingState extends ServiceState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ServiceDispatchedOrderListFetchedState extends ServiceState {
  final List<DispatchedOrderList> dispatchedOrderList;

  ServiceDispatchedOrderListFetchedState(this.dispatchedOrderList);

  @override
  // TODO: implement props
  List<Object?> get props => [dispatchedOrderList];
}

class ServiceDispatchedOrderListErrorState extends ServiceState {
  final String message;

  ServiceDispatchedOrderListErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class ServiceDispatchedOrderDetailsFetchingState extends ServiceState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ServiceDispatchedOrderDetailsFetchedState extends ServiceState {
  final DispatchedOrderData dispatchedOrderData;

  ServiceDispatchedOrderDetailsFetchedState(this.dispatchedOrderData);

  @override
  // TODO: implement props
  List<Object?> get props => [dispatchedOrderData];
}

class ServiceDispatchedOrderDetailsErrorState extends ServiceState {
  final String message;

  ServiceDispatchedOrderDetailsErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class ServiceInProcessOrderListFetchingState extends ServiceState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ServiceInProcessOrderListFetchedState extends ServiceState {
  final List<InProcessList> inProcessList;

  ServiceInProcessOrderListFetchedState(this.inProcessList);

  @override
  // TODO: implement props
  List<Object?> get props => [inProcessList];
}

class ServiceInProcessOrderListErrorState extends ServiceState {
  final String message;

  ServiceInProcessOrderListErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class ServiceInProcessDetailsFetchingState extends ServiceState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ServiceInProcessDetailsFetchedState extends ServiceState {
  final InProcessOrderData inProcessOrderData;

  ServiceInProcessDetailsFetchedState(this.inProcessOrderData);

  @override
  // TODO: implement props
  List<Object?> get props => [inProcessOrderData];
}

class ServiceInProcessDetailsErrorState extends ServiceState {
  final String message;

  ServiceInProcessDetailsErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class ServiceCompletedOrderListFetchingState extends ServiceState {
  @override
  List<Object?> get props => [];
}

class ServiceCompletedOrderListFetchedState extends ServiceState {
  final List<CompletedOrderList> completedOrder;

  ServiceCompletedOrderListFetchedState(this.completedOrder);
  @override
  List<Object?> get props => [completedOrder];
}

class ServiceCompletedOrderListErrorState extends ServiceState {
  final String message;

  ServiceCompletedOrderListErrorState(this.message);
  @override
  List<Object?> get props => [message];
}

class ServiceReadyToDeliverOrderListFetchingState extends ServiceState {
  @override
  List<Object?> get props => [];
}

class ServiceReadyToDeliverOrderListFetchedState extends ServiceState {
  final List<ReadytoDeliverOrderList> readyDeliverOrder;

  ServiceReadyToDeliverOrderListFetchedState(this.readyDeliverOrder);
  @override
  List<Object?> get props => [readyDeliverOrder];
}

class ServiceReadyToDeliverOrderListErrorState extends ServiceState {
  final String message;

  ServiceReadyToDeliverOrderListErrorState(this.message);
  @override
  List<Object?> get props => [message];
}

class ServiceUndeliveredOrderListFetchingState extends ServiceState {
  @override
  List<Object?> get props => [];
}

class ServiceUndeliveredOrderListFetchedState extends ServiceState {
  final List<UndeliveredOrderList> unDeliverOrder;

  ServiceUndeliveredOrderListFetchedState(this.unDeliverOrder);
  @override
  List<Object?> get props => [unDeliverOrder];
}

class ServiceUndeliveredOrderListErrorState extends ServiceState {
  final String message;

  ServiceUndeliveredOrderListErrorState(this.message);
  @override
  List<Object?> get props => [message];
}


class ServiceLocPrcFetchingState extends ServiceState {
  @override
  List<Object?> get props => [];
}

class ServiceLocPrcFetchedState extends ServiceState{
  final LocPrcData lpData;

  ServiceLocPrcFetchedState(this.lpData);

  @override
  List<Object?> get props => [lpData];
}

class ServiceLocPrcErrorState extends ServiceState {
  final String message;

  ServiceLocPrcErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

class ServiceNewClientAddingState extends ServiceState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ServiceNewClientAddedState extends ServiceState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ServiceNewClientErrorState extends ServiceState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ServiceClientListFetchingState extends ServiceState {
  @override
  List<Object?> get props => [];
}

class ServiceClientListFetchedState extends ServiceState {
  final List<ClientList> clientData;

  ServiceClientListFetchedState(this.clientData);

  @override
  List<Object?> get props => [clientData];
}

class ServiceClientListErrorState extends ServiceState {
  final String message;

  ServiceClientListErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

class ServiceClientDetailsFetchingState extends ServiceState {
  @override
  List<Object?> get props => [];
}

class ServiceClientDetailsFetchedState extends ServiceState {
  final ClientDetailsData clientData;

  ServiceClientDetailsFetchedState(this.clientData);

  @override
  List<Object?> get props => [clientData];
}

class ServiceClientDetailsError extends ServiceState {
  final String message;

  ServiceClientDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}