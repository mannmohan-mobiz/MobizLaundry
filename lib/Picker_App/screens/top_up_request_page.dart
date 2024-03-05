import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../BLoCs/PickerBloc/picker_bloc.dart';
import '../../Models/PickerModel/top_up_request_manage_model.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';
import '../../Repositories/PickerRepo/picker_repo.dart';
import '../src/colors.dart';
import '../util/common_methods.dart';
import 'customer_home_page.dart';

class TopUpRequestPage extends StatefulWidget {
  const TopUpRequestPage({super.key});

  @override
  State<TopUpRequestPage> createState() => _TopUpRequestPageState();
}

class _TopUpRequestPageState extends State<TopUpRequestPage> {
  final PickerRepository pickerRepository = PickerRepository();
  String? newMobile;
  String? lat;
  String? long;
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
    create: (context) => PickerBloc(
        RepositoryProvider.of<PickerRepository>(context)
    )..add(TopUpRequestFetchEvent(
        authData.user_token.toString())),
    child: Scaffold(
      backgroundColor: pickerBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: pickerWhiteColor,
        toolbarHeight: 100.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22)),
          side: BorderSide(color: pickerGoldColor),
        ),
        leading: IconButton(
            onPressed: () {
              close(context);
            },
            icon: Image.asset('Assets/Images/back_arrow.png')),
        title: const Text(
          'Top up requests',
          style: TextStyle(
              color: pickerGoldColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
        body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 20),
          child: BlocBuilder<PickerBloc, PickerState>(
          builder: (context, state) {
    if (state is TopUpRequestFetching) {
    return const Center(
    child: CircularProgressIndicator(
    color: pickerGoldColor,
    ));
    }else if (state is TopUpRequestFetched) {
      final tData = state.topUpRequestList;
      return ListView.builder(
          itemCount: tData.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (itemBuilder, index) =>
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  leading: Image.asset('Assets/Images/topup.png'),
                  title:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tData[index].customerName,
                        style: const TextStyle(
                            color: pickerBlackColor,
                            fontSize: 15),
                      ),
                      Text('Requested AED ${tData[index].amount}',
                        style: const TextStyle(
                            color: pickerBlackColor,
                            fontSize: 14),
                      ),
                      Text(DateFormat('dd-MM-yyyy').format(tData[index].date),
                        style: const TextStyle(
                            color: pickerBlackColor,
                            fontSize: 14),
                      ),
                    ],
                  ),
                  trailing: InkWell(
                    onTap: () {
                      Map<String, String> data = {
                        "customer_id": tData[index].customerId,
                      };
                      print('#########${(data)}');
                      pickerRepository.topUpRequestManageApi(token: authData.user_token.toString(),body: data).then((value) {
                     newMobile = value.data[index].mobile;
                     lat = value.data[index].gpse;
                     long = value.data[index].gpsn;
                      });
                      showCustomBottomSheet(
                          context,
                          title: 'Track customer name and top up',
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          // Uri googleUrl = Uri.parse(
                                          //     'https://www.google.com/maps/search/?api=1&query=${'$lat,$long'}');
                                          // if (await canLaunchUrl(googleUrl)) {
                                          // await launchUrl(googleUrl);
                                          // } else {
                                          // throw 'Could not open the map';
                                          // }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: Colors.white,
                                          surfaceTintColor: Colors.white,
                                          side: const BorderSide(
                                            width: 1.6,
                                            color: pickerGoldColor,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                12.0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Image.asset(
                                                'Assets/Images/nav.png'),
                                            const SizedBox(width: 10,),
                                            const Text(
                                              'Navigate',
                                              style: TextStyle(fontSize: 12.0,
                                                  color: pickerBlackColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 18,),
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          openDialer(newMobile);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: Colors.white,
                                          surfaceTintColor: Colors.white,
                                          side: const BorderSide(
                                            width: 1.6,
                                            color: pickerGoldColor,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                12.0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Image.asset(
                                                'Assets/Images/call.png'),
                                            const SizedBox(width: 10,),
                                            const Text(
                                              'Call',
                                              style: TextStyle(fontSize: 12.0,
                                                  color: pickerBlackColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20,),
                              SizedBox(
                                width: double.infinity,
                                height: 54,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (
                                          context) =>  CustomerHomePageScreen(custId:tData[index].customerId)),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12), // <-- Radius
                                    ),
                                    backgroundColor: pickerGoldColor,
                                  ),
                                  child: const Text(
                                    'Go to customer home & top-up',
                                    style: TextStyle(fontSize: 12.0,
                                        color: pickerWhiteColor),
                                  ),
                                ),
                              ),
                            ],
                          )
                      );
                    },
                    child: Container(
                      width: 110,
                      height: 38,
                      decoration: BoxDecoration(
                        color: pickerWhiteColor,
                        border: Border.all(color: pickerGoldColor),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Center(
                        child: Text(
                          'Manage', style: TextStyle(color: pickerGoldColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
              )
      );
    } else {
      return const Center(child: Text('No Data'));
    }
  },
),
        )
    ),
);
  }
}
