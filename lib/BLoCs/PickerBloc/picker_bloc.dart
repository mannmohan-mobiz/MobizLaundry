import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
          if (value.status == true && value.message == "Data Saved Successfully!") {
            emit(DepositAddedState(value.data.createdDate, value.data.totalAmount, value.data.excess, value.data.short, value.data.staff));
          } else {
            emit(DepositErrorState(value.message));
          }
        });
      } catch (e) {
        emit(DepositErrorState(e.toString()));
      }
    });
  }
}
