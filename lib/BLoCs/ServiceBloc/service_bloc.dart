import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:golden_falcon/BLoCs/PickerBloc/picker_bloc.dart';
import 'package:golden_falcon/Models/ServiceModel/ServiceAddCustomer/locationProceListModel.dart';
import 'package:golden_falcon/Models/ServiceModel/ServiceDashboard/serviceDashboardCountModel.dart';
import 'package:golden_falcon/Models/ServiceModel/ServiceDispatchedOrder/serviceDispatchedOrderDetail.dart';
import 'package:golden_falcon/Models/ServiceModel/ServiceDispatchedOrder/serviceDispatchedOrderListModel.dart';
import 'package:golden_falcon/Models/ServiceModel/ServiceInProcessOrder/serviceInProcessOrderDetailsModel.dart';
import 'package:golden_falcon/Models/ServiceModel/ServicePendingOrder/servicePendingOrderListModel.dart';
import 'package:golden_falcon/Repositories/ServiceRepository/service_repository.dart';

import '../../Models/ServiceModel/ServiceAddCustomer/ServiceClientDetailsModel.dart';
import '../../Models/ServiceModel/ServiceAddCustomer/ServiceClientListModel.dart';
import '../../Models/ServiceModel/ServiceCompletedOrder/serviceCompletedOrderListModel.dart';
import '../../Models/ServiceModel/ServiceInProcessOrder/serviceInProcessOrderListModel.dart';
import '../../Models/ServiceModel/ServiceReadytoDeliverModel/serviceReadytoDeliverListModel.dart';
import '../../Models/ServiceModel/ServiceUnedeliveredModel/serviceOrderUndeliveredListModel.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final ServiceRepository serviceRepository;
  ServiceBloc(this.serviceRepository) : super(ServiceInitial())  {
    on<ServiceDashboardCountEvent>((event, emit) async {
      emit(ServiceDashboardCountFetchingState());
      try {
        Future.delayed(Duration(seconds: 1));
        await serviceRepository.getServiceDashboardCounts(token: event.token, userId: event.userId).then((value) {
          if (value.status == true && value.message == "Dashboard Data!") {
            emit(ServiceDashboardCountFetchedState(value.data));
          } else {
            emit(ServiceDashboardCountErrorState(value.message));
          }
        });
      } catch (e) {
        emit(ServiceDashboardCountErrorState(e.toString()));
      }
    });
    on<ServicePendingOrderEvent>((event, emit) async {
      emit(ServicePendingOrderListFetchingState());
      try {
        await serviceRepository.getServicePendingOrderList(token: event.token, userId: event.userId).then((value) {
          if (value.status == true && value.message == "Pending Orders List!") {
            emit(ServicePendingOrderListFetchedState(value.data));
          } else {
            emit(ServicePendingOrderListErrorState(value.message));
          }
        });
      } catch (e) {
        emit(ServicePendingOrderListErrorState(e.toString()));
      }
    });
    on<ServiceDispatchedOrderEvent>((event, emit) async {
      emit(ServiceDispatchedOrderListFetchingState());
      try {
        await serviceRepository.getDispatchedOrderList(token: event.token, userId: event.userId).then((value) {
          if (value.status == true && value.message == "Dispatched Orders List!") {
            emit(ServiceDispatchedOrderListFetchedState(value.data));
          } else {
            emit(ServiceDispatchedOrderListErrorState(value.message));
          }
        });
      } catch (e) {
        emit(ServiceDispatchedOrderListErrorState(e.toString()));
      }
    });
    on<ServiceDispatchedOrderDetailsEvent>((event, emit) async {
      emit(ServiceDispatchedOrderDetailsFetchingState());
      try {
        await serviceRepository.getDispatchedOrderDetails(token: event.token, userId: event.userId, orderId: event.orderId).then((value) {
          if (value.status == true && value.message == "Orders Details!") {
            emit(ServiceDispatchedOrderDetailsFetchedState(value.data));
          } else {
            emit(ServiceDispatchedOrderDetailsErrorState(value.message));
          }
        });
      } catch (e) {
        emit(ServiceDispatchedOrderDetailsErrorState(e.toString()));
      }
    });
    on<ServiceInProcessOrderListEvent>((event, emit) async {
      emit(ServiceInProcessOrderListFetchingState());
      try {
        await serviceRepository.getInProcessOrderList(token: event.token, userId: event.userId).then((value) {
          if (value.status == true && value.message == "In progress Orders List!") {
            emit(ServiceInProcessOrderListFetchedState(value.data));
          } else {
            emit(ServiceInProcessOrderListErrorState(value.message));
          }
        });
      } catch (e) {
        emit(ServiceInProcessOrderListErrorState(e.toString()));
      }
    });
    on<ServiceInProcessOrderDetailsEvent>((event, emit) async {
      emit(ServiceInProcessDetailsFetchingState());
      try {
        await serviceRepository.getInProcessOrderDetails(token: event.token, body: event.body).then((value) {
          if (value.status == true && value.message == "Orders Details!") {
            emit(ServiceInProcessDetailsFetchedState(value.data));
          } else {
            emit(ServiceInProcessDetailsErrorState(value.message));
          }
        });
      } catch (e) {
        emit(ServiceInProcessDetailsErrorState(e.toString()));
      }
    });
    on<ServiceCompletedOrderListEvent>((event, emit) async {
      emit(ServiceCompletedOrderListFetchingState());
      try {
        await serviceRepository.getCompletedOrderList(token: event.token, id: event.id).then((value) {
          if (value.status == true && value.message == "Completed Orders List!") {
            emit(ServiceCompletedOrderListFetchedState(value.data));
          } else {
            emit(ServiceCompletedOrderListErrorState(value.message));
          }
        });
      } catch(e) {
        emit(ServiceCompletedOrderListErrorState(e.toString()));
      }
    });
    on<ServiceUndeliveredOrderListEvent>((event, emit) async {
      emit(ServiceUndeliveredOrderListFetchingState());
      try {
        await serviceRepository.getUndeliverOrderList(token: event.token, id: event.id).then((value) {
          if (value.status == true && value.message == "UnDelivered Orders List!") {
            emit(ServiceUndeliveredOrderListFetchedState(value.data));
          } else {
            emit(ServiceUndeliveredOrderListErrorState(value.message));
          }
        });
      } catch (e) {
        emit(ServiceUndeliveredOrderListErrorState(e.toString()));
      }
    });
    on<ServiceReadyToDeliverOrderListEvent>((event, emit) async {
      emit(ServiceReadyToDeliverOrderListFetchingState());
      try {
        await serviceRepository.getReadytoDeliverList(token: event.token, id: event.id).then((value) {
          if (value.status == true && value.message == "Ready For Delivery Orders List!") {
            emit(ServiceReadyToDeliverOrderListFetchedState(value.data));
          } else {
            emit(ServiceReadyToDeliverOrderListErrorState(value.message));
          }
        });
      } catch (e) {
        emit(ServiceReadyToDeliverOrderListErrorState(e.toString()));
      }
    });
    on<ServiceLocPrcFetchingEvent>((event, emit) async {
      emit(ServiceLocPrcFetchingState());
      try {
        await serviceRepository.getLocPrcDetails(token: event.token).then((value) {
          if (value.status == true && value.message == "Successfully Passed Data!") {
            emit(ServiceLocPrcFetchedState(value.data));
          } else {
            emit(ServiceLocPrcErrorState(value.message));
          }
        });
      } catch (e) {
        emit(ServiceLocPrcErrorState(e.toString()));
      }
    });
    on<ServiceAddnewClientEvent>((event, emit) async {
      emit(ServiceNewClientAddingState());
      try {
        await serviceRepository.addNewClient(token: event.token, body: event.body).then((value) {
          if (value.status == true && value.message == "New Customer Added Successfully!") {
            emit(ServiceNewClientAddedState());
          } else {
            emit(ServiceNewClientErrorState());
          }
        });
      } catch (e) {
        emit(ServiceNewClientErrorState());
      }
    });
    on<ServiceClientListFetchEvent>((event, emit) async {
      emit(ServiceClientListFetchingState());
      try {
        await  serviceRepository.getClientList(token: event.token, userId: event.userId).then((value) {
          if (value.status == true && value.message == "Customers List!") {
            emit(ServiceClientListFetchedState(value.data));
          } else {
            emit(ServiceClientListErrorState(value.message));
          }
        });
      } catch (e) {
        emit(ServiceClientListErrorState(e.toString()));
      }
    });
    on<ServiceClientDetailsEvent>((event, emit) async {
      emit(ServiceClientDetailsFetchingState());
      try {
        await serviceRepository.getClientDetails(token: event.token, body: event.body).then((value) {
          if (value.status == true && value.message == "Customer Details!") {
            emit(ServiceClientDetailsFetchedState(value.data));
          } else {
            emit(ServiceClientDetailsError(value.message));
          }
        });
      } catch (e) {
        emit(ServiceClientDetailsError(e.toString()));
      }
    });
  }
}
