import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:integrate_3screens/Models/CustomerModel/wallet_outstanding_model.dart';

import '../../Repositories/CustomerRepo/customer_repository.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerRepository customerRepository;
  CustomerBloc(this.customerRepository) : super(CustomerInitial()) {
    on<GetBalanceEvent>((event, emit) async {
      emit(CustomerBalanceFetching());
      try {
        await customerRepository.getBalanceData(token: event.token, id: event.id).then((value) {
          if (value.stats == true && value.message ==  "Customer Wallet Details!") {
            emit(CustomerBalanceFetched(value.data));
          } else {
            emit(CustomerBalanceError(value.message));
          }
        });
      } catch (e) {
        emit(CustomerBalanceError(e.toString()));
      }
    });
  }
}
