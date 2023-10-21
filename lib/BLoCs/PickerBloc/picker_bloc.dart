import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:integrate_3screens/Models/PickerModel/deposit_history_model.dart';
import 'package:integrate_3screens/Models/PickerModel/expense_drop_down_model.dart';
import 'package:integrate_3screens/Models/PickerModel/order_details_model.dart';
import 'package:integrate_3screens/Models/PickerModel/outstanding_model.dart';

import '../../Models/PickerModel/expense_list_model.dart';
import '../../Models/PickerModel/order_history_model.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';

part 'picker_event.dart';
part 'picker_state.dart';

class PickerBloc extends Bloc<PickerEvent, PickerState> {
  final PickerRepository pickerRepository;
  PickerBloc(this.pickerRepository) : super(PickerInitial()) {
    on<GetDashboardCountEvent>((event, emit) async {
      emit(DashboardCountGettingState());
      try {
        await pickerRepository.getDashboardData(token: event.token, id: event.userid).then((value) {
          if (value.stats == true && value.message == "Picker Dashboard Details!") {
            emit(DashboardCountGotState(
                value.data.pickupPendingCount,
                value.data.confirmedCount,
                value.data.readyForDispatchCount,
                value.data.deliveredCount,
                value.data.notProcessedCount,
                value.data.depositeAmount,
                value.data.orderViaAppCount,
                value.data.orderViaStaffCount,
                value.data.orderViaDirectCount,
            ));
          } else {
            emit(DashboardCountErrorState(value.message));
          }
        });
      } catch (e){
        emit(DashboardCountErrorState(e.toString()));
      }
    });
    on<AddDepositEvent>((event, emit)  async {
      emit(DepositAddingState());
      try {
        await pickerRepository.addDeposit(token: event.token, userId: event.userId, amount: event.amount).then((value) {
          print(value);
          if (value.status == true && value.message == "Data Saved Successfully!") {
            emit(DepositAddedState(value.data.createdDate, value.data.totalAmount, value.data.excess, value.data.short, value.data.staff));
          } else {
            print('else from bloc');
            emit(DepositErrorState(value.message));
          }
        });
      } catch (e) {
        emit(DepositErrorState(e.toString()));
      }
    });
    on<ExpenseHeadGetEvent>((event, emit) async {
      emit(ExpenseHeadGettingState());
      try {
        await pickerRepository.getExpenseHead(token: event.token).then((value) {
          if (value.status == true && value.message == "Dropdown data!") {
            emit(ExpenseHeadSuccessState(value.data));
          } else {
            emit(ExpenseHeadErrorState(value.message));
          }
        });
      } catch (e) {
        emit(ExpenseHeadErrorState(e.toString()));
      }
    });
    on<ExpenseAddEvent>((event, emit) async {
      emit(AddingExpenseState());
      try {
        print("TRY");
        await pickerRepository.addExpense(event.body, event.token).then((value) {
          print("From BLoC");
          print(value.message);
          if (value.status == true && value.message == "Data Saved Successfully!") {
            emit(AddedExpenseState());
          } else {
            emit(ErrorExpenseState(value.message));
          }
        });
      } catch(e) {
        emit(ErrorExpenseState(e.toString()));
      }
    });
    on<ExpenseListFetchEvent>((event, emit) async {
      emit(ExpenseFetchingState());
      try {
        await pickerRepository.getExpenses(id: event.id, token: event.token).then((value) {
          if (value.status == true && value.message == "Expense List!") {
           emit(ExpenseFetchedState(value.data));
          } else {
            emit(ExpenseErrorState(value.message));
          }
        });
      } catch (e) {
        emit(ExpenseErrorState(e.toString()));
      }
    });
    on<OutstandingDueFetchEvent>((event, emit) async {
      emit(OutstandingFetchingState());
      try {
        await pickerRepository.getOutstandings(id: event.id, token: event.token).then((value) {
          if(value.status == true && value.message == "Outstanding Dues List!") {
            emit(OutstandingFetchedState(value.data));
          } else {
            emit(OutStandingErrorState(value.message));
          }
        });
      } catch (e) {
        emit(OutStandingErrorState(e.toString()));
      }
    });
    on<DepositHistoryFetchEvent>((event, emit) async {
      emit(DepositHistoryFetching());
      try {
        await pickerRepository.getHistory(token: event.token, body: event.body).then((value) {
          if (value.status == true && value.message == "Deposit History!") {
            emit(DepostiHistoryFetched(value.data));
          } else {
            emit(DepositHistoryError(value.message));
          }
        });
      } catch(e) {
        emit(DepositHistoryError(e.toString()));
      }
    });
    on<OrderHistoryListEvent>((event, emit) async {
      emit(OrderHistoryFetching());
      try {
        await pickerRepository.getOrderList(token: event.token, data: event.data ).then((value) {
          if (value.status == true && value.message == "Order List!") {
            emit(OrderdHistoryFetched(value.data, value.totalCount));
          } else {
            emit(OrderHistoryError(value.message));
          }
        });
      } catch (e) {
        emit(OrderHistoryError(e.toString()));
      }
    });
    on<OrderDetailsEvent>((event, emit) async {
      emit(OrderHistoryFetching());
      try {
        await pickerRepository.getOrderDetails(orderNo: event.ordNo, token: event.token).then((value) {
          if (value.status == true && value.message == "Customer Order Details!") {
            emit(OrderDetailsFetched(value.data));
          } else {
            emit(OrderDetailsError(value.message));
          }
        });
      } catch(e) {
        emit(OrderDetailsError(e.toString()));
      }
    });
    on<CollectionListFetchEvent>((event, emit) async {
      emit(CollectionListFetchingState());
      try {
        await pickerRepository.getCollectionList(token: event.token, data: event.data).then((value) {
          if (value.status == true && value.message == "Collection List!") {
            emit(CollectionListFetchedState(value.data));
          } else {
            emit(CollectionListErrorState(value.message));
          }
        });
      } catch(e) {
        emit(CollectionListErrorState(e.toString()));
      }
    });
  }
}
