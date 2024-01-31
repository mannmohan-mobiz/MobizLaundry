import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:golden_falcon/Models/PickerModel/add_to_cart_model.dart';
// import 'package:golden_falcon/Models/PickerModel/cart_list_model.dart';
// import 'package:golden_falcon/Models/PickerModel/cart_list_model.dart' as CartList;
import 'package:golden_falcon/Models/PickerModel/deposit_history_model.dart';
import 'package:golden_falcon/Models/PickerModel/new_order_save.dart';
import 'package:golden_falcon/Models/PickerModel/order_details_model.dart';
import 'package:golden_falcon/Models/PickerModel/outstanding_model.dart';
import 'package:golden_falcon/Models/PickerModel/picker_category_model.dart';
import 'package:golden_falcon/Models/PickerModel/picker_sub_category_model.dart';
import '../../Models/PickerModel/cart_list_model.dart';
import '../../Models/PickerModel/cart_list_model.dart' as CartListValue;
import '../../Models/PickerModel/collect_items_model.dart';
import '../../Models/PickerModel/customer_home_order_history_detail_model.dart';
import '../../Models/PickerModel/customer_list_model.dart';
import '../../Models/PickerModel/dashboard_count_model.dart';
import '../../Models/PickerModel/delivery_address_list.dart';
import '../../Models/PickerModel/expense_list_model.dart';
import '../../Models/PickerModel/location_price_model.dart';
import '../../Models/PickerModel/modes.dart';
import '../../Models/PickerModel/order_history_model.dart';
import '../../Models/PickerModel/order_report_detail_model.dart';
import '../../Models/PickerModel/order_report_model.dart';
import '../../Models/PickerModel/picker_confirmed_list_model.dart';
import '../../Models/PickerModel/picker_delivery_date.dart';
import '../../Models/PickerModel/picker_item_price_model.dart';
import '../../Models/PickerModel/picker_order_confirm.dart';
import '../../Models/PickerModel/picker_payment_list.dart';
import '../../Models/PickerModel/pickup_list_midel.dart';
import '../../Models/PickerModel/ready_for_despatch.dart';
import '../../Models/PickerModel/search.dart';
import '../../Models/PickerModel/thankyou_model.dart';
import '../../Models/PickerModel/undelivered_model.dart';
import '../../Models/PickerModel/undelivered_status_model.dart';
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
                value.data
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
    on<PickupListFetchEvent>((event, emit) async {
      emit(PickupListFetching());
      try {
        await pickerRepository.getPickUps(token: event.token, id: event.id).then((value) {
          if (value.status == true && value.message == "Pickup List!") {
            emit(PickupListFetched(value.data));
          } else {
            emit(PickupListError(value.message));
          }
        });
      } catch (e) {
        emit(PickupListError(e.toString()));
      }
    });
    on<ReadyForDespatchListFetchEvent>((event, emit) async {
      emit(ReadyForDespatchListFetching());
      try {
        await pickerRepository.getReadyForDespatch(token: event.token, id: event.id).then((value) {
          if (value.status == true && value.message == "Ready For Dispatch Orders List!") {
            emit(ReadyForDespatchListFetched(value.data));
          } else {
            emit(ReadyForDespatchListError(value.message));
          }
        });
      } catch (e) {
        emit(ReadyForDespatchListError(e.toString()));
      }
    });
    on<UndeliveredListFetchEvent>((event, emit) async {
      emit(UndeliveredListFetching());
      try {
        await pickerRepository.getUndeliveredApi(token: event.token, id: event.id).then((value) {
          if (value.status == true && value.message == "Undelivered Orders List!") {
            emit(UndeliveredListFetched(value.data));
          } else {
            emit(UndeliveredListError(value.message));
          }
        });
      } catch (e) {
        emit(UndeliveredListError(e.toString()));
      }
    });
    on<PickerConfirmOrderEvent>((event, emit) async {
      emit(OrderConfirmingState());
      try {
        await pickerRepository.confirmOrder(body: event.body, token: event.token).then((value) {
          if (value.status == true && value.message == "Order Confirmed Successfully!"){
            emit(OrderConfirmedState(value.data));
          } else {
            emit(OrderConfirmerrorState(value.message));
          }
        });
      } catch (e) {
        emit(OrderConfirmerrorState(e.toString()));
      }
    });

    on<PickupConfirmedListFetchEvent>((event, emit) async {
      debugPrint('###DDEERR###');
      emit(PickupConfirmedListFetching());
      try {
        await pickerRepository.getPickUpConfirmedList(token: event.token, id: event.id).then((value) {
          debugPrint('33W33${value.status}');
          debugPrint('${value.message}');
          if (value.status == true && value.message == "Confirmed Orders List!") {
            emit(PickupConfirmedListFetched(value.data));
          } else {
            emit(PickupConfirmedListError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(PickupConfirmedListError(e.toString()));
      }
    });


    on<PickupSearchCustomerListFetchEvent>((event, emit) async {
      debugPrint('###DDEERRsss###');
      emit(PickupSearchCustomerListFetching());
      try {
        await pickerRepository.getSearchCustomerList(token: event.token, key: event.key).then((value) {
          debugPrint('33W33sss${value.status}');
          debugPrint('${value.message}');
          if (value.status == true && value.message == "Data fetched successfully!") {
            emit(PickupSearchCustomerListFetched(value.data));
          } else {
            emit(PickupSearchCustomerListError(value.message));
          }
        });
      } catch (e) {
        emit(PickupConfirmedListError(e.toString()));
      }
    });

    on<PickupDeliveryDateListFetchEvent>((event, emit) async {
      debugPrint('###DDEERRsss###');
      emit(PickupDeliveryDateListFetching());
      try {
        await pickerRepository.getDeliveryDateList(token: event.token, mode: event.mode).then((value) {
          debugPrint('33W33sss${value.status}');
          debugPrint('${value.message}');
          if (value.status == true && value.message == "Delivery Dates passed successfully") {
            emit(PickupDeliveryDateListFetched(value.data));
          } else {
            emit(PickupDeliveryDateListError(value.message));
          }
        });
      } catch (e) {
        emit(PickupConfirmedListError(e.toString()));
      }
    });


    on<PickupDeliveryTimeListFetchEvent>((event, emit) async {
      debugPrint('###DDEERRsss###');
      emit(PickupDeliveryTimeListFetching());
      try {
        await pickerRepository.getDeliveryTimeList(token: event.token, deliveryDate: event.deliveryDate).then((value) {
          debugPrint('33W33sss${value.status}');
          debugPrint('${value.message}');
          if (value.status == true  && value.message == "Time intervals") {
            emit(PickupDeliveryTimeListFetched(value.data));
          } else {
            emit(PickupDeliveryTimeListError(value.message));
          }
        });
      } catch (e) {
        emit(PickupDeliveryTimeListError(e.toString()));
      }
    });


    on<PickupDeliveryModeFetchEvent>((event, emit) async {
      debugPrint('###DDEERRsss111###');
      emit(PickupDeliveryModeFetching());
      debugPrint('###DDEERRsss222###');
      try {
        await pickerRepository.getDeliveryModesData(token: event.token,).then((value) {
          debugPrint('33W33sss111${value.status}');
          debugPrint('2222222${value.message}');
          if (value.status == true && value.message == "data passed successfully") {
            emit(PickupDeliveryModeFetched(value.data));
          } else {
            emit(PickupDeliveryModeError(value.message));
          }
        });
      } catch (e) {
        emit(PickupDeliveryModeError(e.toString()));
      }
    });
    // on<PickupDeliveryAddressFetchEvent>((event, emit) async {
    //   debugPrint('###DDEERRsss111###');
    //   emit(PickupDeliveryAddressFetching());
    //   debugPrint('###DDEERRsss222###');
    //   try {
    //     await pickerRepository.getDeliveryAddressListData(token: event.token, customerId: event.custId,).then((value) {
    //       debugPrint('33W33sss111${value.status}');
    //       debugPrint('2222222${value.message}');
    //       if (value.status == true && value.message == "Data passed successfully!") {
    //         emit(PickupDeliveryAddressFetched(value.data));
    //       } else {
    //         emit(PickupDeliveryAddressError(value.message.toString()));
    //       }
    //     });
    //   } catch (e) {
    //     emit(PickupDeliveryAddressError(e.toString()));
    //   }
    // });

    on<PickupDeliveryAddressFetchEvent>((event, emit) async {
      print('checkkkkk');
      CartListValue.Customer customerData = CartListValue.Customer(
          name: event.address["name"],
          buildingName: event.address["building_name_no"],
          buildingNo: '',
          floorNumber: event.address["floor_no"],
          flatNumber: event.address["flat_no_house_no"],
          mobile: event.address["person_incharge_mob"]
      );
      emit(PckCartListFetchedState(event.data, customerData.toJson()));
    });

    on<PickupPaymentListFetchEvent>((event, emit) async {
      debugPrint('###DDEERRsss111###');
      emit(PickupPaymentListFetching());
      debugPrint('###DDEERRsss222###');
      try {
        await pickerRepository.getPaymentListApi(token: event.token,).then((value) {
          debugPrint('33W33sss111${value.status}');
          debugPrint('2222222${value.message}');
          if (value.status == true && value.message == "data passed successfully") {
            emit(PickupPaymentListFetched(value.data));
          } else {
            emit(PickupPaymentListError(value.message.toString()));
          }
        });
      } catch (e) {
        emit(PickupPaymentListError(e.toString()));
      }
    });

    on<PickerPunchInOutEvent>((event, emit) async {
      emit(PickerPunchingInOutState());
      try {
        await pickerRepository.punchIn(token: event.token, id: event.id, task: event.task).then((value) {
          if (value.status == true && value.message == "Successfully Logged In!") {
            emit(PickerPunchedInOutState(value.data[0].punchInTime, value.data[0].punchOutTime == null ? "" : value.data[0].punchOutTime ));
          } else {
            emit(PickerPunchingErrorState(value.message));
          }
        });
      } catch (e) {
        emit(PickerPunchingErrorState(e.toString()));
      }
    });
    on<FetchLocationPriceEvent>((event, emit) async {
      emit(LocationPriceFetching());
      try {
        await pickerRepository.getLPGData(token: event.token).then((value) {
          if (value.status == true && value.message == "Successfully Passed Data!") {
            emit(LocationPriceFetched(value.data.priceGroupList, value.data.customerTypeList));
          } else {
            emit(LocationPriceError(value.message));
          }
        });
      } catch (e) {
        emit(LocationPriceError(e.toString()));
      }
    });
    on<AddNewClientEvent>((event, emit) async {
      emit(AddingNewclient());
      try {
        await pickerRepository.addNewClient(body: event.body, token: event.token).then((value) {
          if (value.status == true && value.message == "New Customer Added Successfully!") {
            emit(AddedNewClient(value.message));
          } else {
            emit(AddNewClientError(value.message));
          }
        });
      } catch (e) {
        emit(AddNewClientError(e.toString()));
      }
    });
    on<ListAllClientsEvent>((event, emit) async {
      emit(FetchingClientList());
      try {
        await pickerRepository.listMyClients(token: event.token, id: event.id).then((value) {
          if (value.status == true && value.message == "Customers List!") {
            emit(FetchedClientList(value.data));
          } else {
            emit(FetchClientListError(value.message));
          }
        });
      } catch (e) {
        emit(FetchClientListError(e.toString()));
      }
    });
    on<AddNewOrderEvent>((event, emit) async {
      emit(AddingNewOrderState());
      try {
        await pickerRepository.saveNewOrder(token: event.token, body: event.body).then((value) {
          if (value.status == true && value.message ==  "Order Successfully Saved!") {
            emit(AddedNewOrderState(value.data));
          } else {
            emit(AddNewOrderErrorState(value.message));
          }
        });
      } catch (e) {
        emit(AddNewOrderErrorState(e.toString()));
      }
    });
    on<PckCategoryFetchEvent>((event, emit) async {
      emit(PckCategoryFetchingState());
      try {
        await pickerRepository.getPickerCategs(id: event.id, token: event.token).then((value) {
          print("*************[VALUE]*******************");
          print(value.data.toList());
          print("*************[VALUE]*******************");
          if (value.status == true && value.message == "Branch Categories List!") {
            emit(PckCategoryFetchedState(value.data));
          } else {
            emit(PckCategoryErrorState(value.message));
          }
        });
      } catch (e) {
        emit(PckCategoryErrorState(e.toString()));
      }
    });
    on<PckSubCategoryFetchEvent>((event, emit) async {
      emit(PckSubCategoryFetchingState());
      try {
        await pickerRepository.getPickerSubCategs(categ_id: event.categId, token: event.token).then((value) {
          if (value.status == true) {
            emit(PckSubCategoryFetchedState(value.data));
          } else {
            emit(PckSubCategoryErrorState(value.message));
          }
        });
      } catch (e) {
        emit(PckSubCategoryErrorState(e.toString()));
      }
    });
    on<PckCartListFetchEvent>((event, emit) async {
      emit(PckCartListFetchingState());
      try {
        await pickerRepository.addToCartListData(token: event.token, orderId: event.ordId).then((value) {
          if (value.status == true) {
            emit(PckCartListFetchedState(value.data,value.data.cart.first.order.customer.toJson()));
          } else {
            emit(PckCartListErrorState(value.message));
          }
        });
      } catch (e) {
        emit(PckCartListErrorState(e.toString()));
      }
    });

    on<PckCollectItemsFetchEvent>((event, emit) async {
      emit(PckCollectItemsFetchingState());
      try {
        await pickerRepository.collectItemsListApi(token: event.token, orderId: event.ordId).then((value) {
          if (value.status == true) {
            emit(PckCollectItemsFetchedState(value.data));
          } else {
            emit(PckCollectItemsErrorState(value.message.toString()));
          }
        });
      } catch (e) {
        emit(PckCartListErrorState(e.toString()));
      }
    });

    on<PckOrderReportFetchEvent>((event, emit) async {
      emit(PckOrderReportFetchingState());
      try {
        await pickerRepository.getOrderReport(token: event.token, body: {
          "id": event.id,
          "from_date": event.fDate,
          "to_date": event.tDate
        }).then((value) {
          if (value.status == true) {
            emit(PckOrderReportFetchedState(value.data));
          } else {
            emit(PckOrderReportErrorState(value.message.toString()));
          }
        });
      } catch (e) {
        emit(PckOrderReportErrorState(e.toString()));
      }
    });

    on<PckOrderReportDetailFetchEvent>((event, emit) async {
      emit(PckOrdReportDetailFetchingState());
      try {
        await pickerRepository.getOrderReportDetail(token: event.token, orderid: event.ordId).then((value) {
          if (value.status == true) {
            emit(PckOrdReportDetailFetchedState(value.data));
          } else {
            emit(PckOrdReportDetailErrorState(value.message.toString()));
          }
        });
      } catch (e) {
        emit(PckOrdReportDetailErrorState(e.toString()));
      }
    });

    on<PckCustomerHistoryDetailFetchEvent>((event, emit) async {
      emit(PckCustHistoryDetailFetchingState());
      try {
        await pickerRepository.getCustomerHistoryDetail(token: event.token, orderid: event.ordId).then((value) {
          if (value.status == true) {
            emit(PckCustHistoryDetailFetchedState(value.data));
          } else {
            emit(PckCustHistoryDetailErrorState(value.message.toString()));
          }
        });
      } catch (e) {
        emit(PckCustHistoryDetailErrorState(e.toString()));
      }
    });
    on<PckThankListFetchEvent>((event, emit) async {
      emit(PckThankyouFetchingState());
      try {
        await pickerRepository.thankYouListData(token: event.token, orderId: event.ordId, customerId: event.customId,).then((value) {
          if (value.status == true) {
            emit(PckThankyouFetchedState(value.data));
          } else {
            emit(PckThankyouErrorState(value.message));
          }
        });
      } catch (e) {
        emit(PckThankyouErrorState(e.toString()));
      }
    });
    on<PckItemFetchEvent>((event, emit) async {
      emit(PckItemFetchingState());
      try {
        await pickerRepository.getItemsPrice(
            body: {
              "sub_cat_id": event.subCategId,
              "category_id": event.categId,
              "customer_id":event.custId,
              "order_id": event.ordIdd
            },
          token: event.token
        ).then((value) {
          if (value.status == true) {
            emit(PckItemFetchedState(value.data));
          } else {
            emit(PckItemErrorState(value.message));
          }
        });
      } catch (e) {
        emit(PckItemErrorState(e.toString()));
      }
    });
    on<PckAddtoCartEvent>((event, emit) async {
      emit(PckAddingtoCartState());
      try {
        await pickerRepository.addToCart(token: event.token, body: event.body).then((value) {
          if (value.status == true) {
            emit(PckAddedtoCartState(value.data));
          } else {
            emit(PckAddtoCartError(value.message));
          }
        });
      } catch (e) {
        emit(PckAddtoCartError(e.toString()));
      }
    });
  }
}
