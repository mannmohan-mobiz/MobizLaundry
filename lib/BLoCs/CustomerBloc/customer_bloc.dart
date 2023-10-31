

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:integrate_3screens/Models/CustomerModel/category_model.dart';
import 'package:integrate_3screens/Models/CustomerModel/sub_category_model.dart';
import 'package:integrate_3screens/Models/CustomerModel/wallet_outstanding_model.dart';

import '../../Models/CustomerModel/item_model.dart';
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
    on<GetCategoryEvent>((event, emit) async {
      emit(CategoryGettingState());
      try {
        await customerRepository.getCategories(id: event.id, token: event.token).then((value) {
          if (value.status == true && value.message == "Branch Categories List!") {
            emit(CategoryGotState(value.data));
          } else {
            emit(CategoryErrorState(value.message));
          }
        });
      } catch (e) {
        emit(CategoryErrorState(e.toString()));
      }
    });
    on<GetSubCategoryEvent>((event, emit) async {
      emit(SubCategoryGettingState());
      try {
        await customerRepository.getSubCat(cat_id: event.cat_id, token: event.token).then((value) {
          if (value.status == true && value.message == "Branch Sub Categories List!") {
            emit(SubCategoryGotState(value.data));
          } else {
            emit(SubCategoryErrorState(value.message));
          }
        });
      } catch (e) {
        emit(SubCategoryErrorState(e.toString()));
      }
    });
    on<GetItemEvent>((event, emit) async {
      emit(ItemGettingState());
      try {
        await customerRepository.getItems(token: event.token, body: event.body).then((value) {
          if (value.status == true && value.message == "Branch Sub Categories List!") {
            emit(ItemGotState(value.data));
          } else {
            emit(ItemErrorState(value.message));
          }
        });
      } catch (e) {
        emit(ItemErrorState(e.toString()));
      }
    });
  }
}
