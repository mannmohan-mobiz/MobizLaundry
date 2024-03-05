import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_falcon/Picker_App/screens/picking_confirmation_page.dart';
import 'package:golden_falcon/Picker_App/screens/ready_for_despatch_page.dart';
import 'package:golden_falcon/Picker_App/screens/top_up_request_page.dart';
import 'package:golden_falcon/Picker_App/screens/undelivered_page.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../../Utils/row_shimmer.dart';
import '../src/colors.dart';
import '../util/bottom_navigation_new.dart';
import '../util/common_methods.dart';
import '../util/drawer.dart';
import '../util/drawer.dart';
import '../util/side_bar_page.dart';
import 'choose_account_type_screen.dart';
import 'confirmed_orders_page.dart';
import 'create_client_page.dart';
import 'delivered_screen.dart';
import 'delivery_page.dart';
import 'my_clients_page.dart';
import 'my_collections_page.dart';
import 'new_order_search_page.dart';
import 'notification_page.dart';
import 'outstanding_dues.dart';

class HomePageNew extends StatefulWidget {
  const HomePageNew({super.key});

  @override
  State<HomePageNew> createState() => _HomePageNewState();
}

class _HomePageNewState extends State<HomePageNew> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PickerRepository pickerRepository = PickerRepository();

  @override
  Widget build(BuildContext context) {
    List<String> labelButtonText1 = [
      'New Order',
      'Delivery',
      'Collection',
      'Create Client',
      'My Clients',
      'Undelivered'
    ];
    // List<String> labelButtonText2 = ['Create Client', 'My Clients','Undelivered'];

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: pickerBackgroundColor,
      drawer: const SideMenuPage(),
      appBar: AppBar(
        backgroundColor: pickerWhiteColor,
        toolbarHeight: 150.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22)),
          side: BorderSide(color: pickerGoldColor),
        ),
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: pickerGoldColor,
            size: 30,
          ),
        ),
        title: Image.asset('Assets/Images/golden_logo.png'),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationPage()));
            },
              child: Image.asset('Assets/Images/notification_icon.png')),
          const SizedBox(width: 12),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset('Assets/Images/refresh.png'),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
        child: ListView(
          children: [
            const Center(
              child: Text(
                'Picker Dashboard',
                style: TextStyle(
                  fontSize: 20,
                  color: pickerGoldColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Hai User!',
              style: TextStyle(
                fontSize: 15,
                color: pickerBlackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocProvider(
              create: (context) => PickerBloc(
                RepositoryProvider.of<PickerRepository>(context),
              )..add(GetDashboardCountEvent(
                  authData.user_token.toString(), authData.user_id.toString())),
              child: BlocBuilder<PickerBloc, PickerState>(
                builder: (context, state) {
                  if (state is DashboardCountGettingState) {
                    print(state.toString());
                    return const Column(
                      children: [
                        ShimmerRow(),
                        ShimmerRow(),
                        ShimmerRow(),
                      ],
                    );
                  } else if (state is DashboardCountGotState) {
                    List<Map<String, dynamic>> labelText = [
                      {
                        'label': 'Picking\nConfirmation',
                        'value': state.dashData.pickupPendingCount
                      },
                      {
                        'label': 'Confirmed',
                        'value': state.dashData.confirmedCount
                      },
                      {
                        'label': 'Ready for\nDispatch',
                        'value': state.dashData.readyForDispatchCount
                      },
                      {
                        'label': 'Outstanding',
                        'value': state.dashData.outstandingAmount
                      },
                      {
                        'label': 'Delivered',
                        'value': state.dashData.deliveredCount
                      },
                      {
                        'label': 'Deposit',
                        'value': state.dashData.depositAmount
                      },
                      {
                        'label': 'Pending for\nprocess',
                        'value': state.dashData.notProcessedCount
                      },
                      {
                        'label': 'Top Up\nRequest',
                        'value': state.dashData.topUpRequestCount
                      },
                    ];
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 1 / 1.35,
                              mainAxisSpacing: 50,
                              crossAxisSpacing: 30),
                      itemCount: labelText.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => onMenuClicked(index, context),
                        child: Container(
                          decoration: BoxDecoration(
                              color: pickerWhiteColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: pickerGoldColor)),
                          child: Column(
                            children: [
                              Text(
                                '${labelText[index]['value']}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: pickerGoldColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Divider(
                                thickness: 2,
                                color: pickerGoldColor,
                              ),
                              Flexible(
                                child: Text(
                                  '${labelText[index]['label']}',
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: pickerBlackColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    print(state.toString());
                    return const Column(
                      children: [
                        ShimmerRow(),
                        ShimmerRow(),
                        ShimmerRow(),
                      ],
                    );
                  }

                  // else {
                  //   return const Text('Unexpected state encountered');
                  // }
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3 / 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20),
              itemCount: labelButtonText1.length,
              itemBuilder: (context, index) => Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: pickerGoldColor,
                    fixedSize: const Size(150, 50),
                    side: const BorderSide(color: pickerWhiteColor, width: 2.0),
                  ),
                  onPressed: () => onButtonClicked(index, context),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 2.0, bottom: 2, right: 0),
                    child: Text(
                      labelButtonText1[index],
                      style: const TextStyle(
                          color: pickerWhiteColor, fontSize: 11),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  onMenuClicked(int index, BuildContext context,) {
    switch (index) {
      case 0:
        open(context, const PickingConfirmationPage());
        break;
      case 1:
        open(context, const ConfirmedOrdersPage());
        break;
      case 2:
        open(context, const ReadyForDespatchPage());
        break;
      case 3:
        open(context, const OutStandingDuesPage());
        break;
      case 4:
        open(context, const DeliveredScreen());
        break;
      case 7:
        open(context, const TopUpRequestPage());
        break;
    }
  }

  onButtonClicked(int index, BuildContext context) {
    switch (index) {
      case 0:
        open(context, const NewOrderSearchPage());
        break;
      case 1:
        open(context, const DeliveryPage());
        break;
      case 2:
        open(context, const MyCollectionsPage());
        break;
      case 3:
        open(context, const ChooseAccountType());
        break;
      case 4:
        open(context, const MyClientsPage());
        break;
      case 5:
        open(context, const UnDeliveredPage());
        break;
    }
  }
}
