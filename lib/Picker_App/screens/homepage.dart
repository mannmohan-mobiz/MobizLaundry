import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integrate_3screens/BLoCs/PickerBloc/picker_bloc.dart';
import 'package:integrate_3screens/Picker_App/screens/ready_dispatch.dart';
import 'package:integrate_3screens/Picker_App/screens/un_delivered.dart';
import 'package:integrate_3screens/Repositories/PickerRepo/picker_repo.dart';
import 'package:integrate_3screens/Utils/row_shimmer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../Utils/common.dart';
import '../src/colors.dart';
import '../src/dimen.dart';
import '../src/textString.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/drawer.dart';
import '../model/chart_data.dart';
import '../util/open_painter.dart';
import 'Complaint.dart';
import 'deposit.dart';
import 'edit_client.dart';
import 'my_client.dart';
import 'my_collections.dart';
import 'my_order_list.dart';
import 'new_order.dart';
import 'order_details.dart';
import 'outstanding_due.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool isCardView = false;
  TooltipBehavior? _tooltipBehavior;
  final authData = AuthData();
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
        enable: true,
        canShowMarker: false,
        header: '',
        format: 'point.y marks in point.x');
    super.initState();
  }

  /// Get column series with tracker
  List<ColumnSeries<ChartSampleData, String>> _getTracker() {
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
          dataSource: <ChartSampleData>[
            ChartSampleData('Dry Clean', 71),
            ChartSampleData('Wash & Fold', 84),
            ChartSampleData('Press & Hang', 48),
            ChartSampleData('Carpet', 80),
          ],

          /// We can enable the track for column here.
          isTrackVisible: true,
          trackPadding: 1.5,
          spacing: 1.5,
          yAxisName: 'Count',
          borderWidth: 25,
          color: pickerPrimaryColor,
          trackColor: const Color.fromRGBO(198, 201, 207, 1),
          borderRadius: BorderRadius.circular(15),
          xValueMapper: (ChartSampleData sales, _) => sales.mode as String,
          yValueMapper: (ChartSampleData sales, _) => sales.count,
          name: 'Activity Log',
          dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              labelAlignment: ChartDataLabelAlignment.top,
              textStyle: TextStyle(fontSize: 10, color: Colors.white)))
    ];
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => PickerBloc(
        RepositoryProvider.of<PickerRepository>(context)
      )..add(GetDashboardCountEvent(authData.user_token.toString(), authData.user_id.toString())),
      child: Scaffold(
        key: scaffoldKey,
        appBar: PreferredSize(
          preferredSize:
          Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
          child:Appbar(text: 'Field Staff Dashboard',),
        ),
        drawer: const MenuDrawer(),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(smallTextPadding),
                        width: size.width * 0.33,
                        height: size.height * 0.07,
                        child:  ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder:
                                    (context) =>  NewOrderScreen(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: pickerPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(buttonBorderRadius),
                            ),
                            elevation: 15.0,
                          ),
                          child: Text(
                            'New Order',
                            style: TextStyle(
                                color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(smallTextPadding),
                        width: size.width * 0.33,
                        height: size.height * 0.07,
                        child:  ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder:
                                    (context) =>  DispatchReadyScreen(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: pickerPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(buttonBorderRadius),
                            ),
                            elevation: 15.0,
                          ),
                          child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                buttonText2,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              )
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(smallTextPadding),
                        width: size.width * 0.33,
                        height: size.height * 0.07,
                        child:  ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder:
                                    (context) =>  OrderDetailsScreen(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: pickerPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(buttonBorderRadius),
                            ),
                            elevation: 15.0,
                          ),
                          child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                'Payment',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(smallTextPadding),
                        width: size.width * 0.33,
                        height: size.height * 0.07,
                        child:  ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder:
                                    (context) =>  EditClientScreen(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: pickerPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(buttonBorderRadius),
                            ),
                            elevation: 15.0,
                          ),
                          child: Text(
                            'Create Client',
                            style: TextStyle(
                                color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(smallTextPadding),
                        width: size.width * 0.33,
                        height: size.height * 0.07,
                        child:  ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder:
                                    (context) =>  ComplaintScreen(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: pickerPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(buttonBorderRadius),
                            ),
                            elevation: 15.0,
                          ),
                          child: Text(
                            '+  complaint',
                            style: TextStyle(
                                color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(smallTextPadding),
                        width: size.width * 0.33,
                        height: size.height * 0.07,
                        child:  ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder:
                                    (context) =>  UnDeliveredScreen(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: pickerPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(buttonBorderRadius),
                            ),
                            elevation: 15.0,
                          ),
                          child: Text(
                            'Undelivered',
                            style: TextStyle(
                                color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<PickerBloc, PickerState>(
                    builder: (context, state) {
                      if (state is DashboardCountGettingState) {
                        print(state.toString());
                        return Column(
                          children: [
                            ShimmerRow(),
                            SizedBox(height: 12),
                            ShimmerRow(),
                            SizedBox(height: 12),
                            ShimmerRow(),
                          ],
                        );
                      } else if (state is DashboardCountGotState) {
                        print(state.toString());
                        return  Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: size.height * 0.04),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap:(){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder:
                                              (context) =>  MyCollectionScreen(),
                                          ));
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          // margin: EdgeInsets.only(right: size.width * 0.03),
                                          child: TweenAnimationBuilder(
                                            duration: const Duration(seconds: 2),
                                            tween: Tween(begin: 0.0, end: 1.0),
                                            curve: Curves.easeOutCubic,
                                            builder: (BuildContext context, double value,
                                                Widget? child) {
                                              return MultipleColorCircle(
                                                colorOccurrences: {
                                                  pickerCiyanColor: 3,
                                                  pickerCiyan2Color: 1
                                                },
                                                height: size.height * 0.035,
                                                child: Text(
                                                  '50',
                                                  style: TextStyle(
                                                      fontSize: circleText,
                                                      fontWeight: circleTextWeight),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: size.height * 0.03,
                                          margin: EdgeInsets.only(top: size.height * 0.03),
                                          child: Text(
                                            circleHeadText5,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: circleBottomText),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder:
                                              (context) =>  DepositScreen(),
                                          ));
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          //  margin: EdgeInsets.only(left: size.width * 0.06,right: size.width * 0.06),
                                          child: TweenAnimationBuilder(
                                            duration: const Duration(seconds: 2),
                                            tween: Tween(begin: 0.0, end: 1.0),
                                            curve: Curves.easeOutCubic,
                                            builder: (BuildContext context, double value,
                                                Widget? child) {
                                              return MultipleColorCircle(
                                                colorOccurrences: {
                                                  pickerBlueColor: 3,
                                                  pickerBlue2Color: 1
                                                },
                                                height: size.height * 0.035,
                                                child: Text(
                                                  state.depositeAmount,
                                                  style: TextStyle(
                                                      fontSize: circleText,
                                                      fontWeight: circleTextWeight),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: size.height * 0.03,
                                          margin: EdgeInsets.only(top: size.height * 0.03),
                                          child: Text(
                                            circleHeadText6,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: circleBottomText),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap:(){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder:
                                              (context) =>  OutStandinDueScreen(),
                                          ));
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          // margin: EdgeInsets.only(left: size.width * 0.06,right: size.width * 0.03),
                                          child: TweenAnimationBuilder(
                                            duration: const Duration(seconds: 2),
                                            tween: Tween(begin: 0.0, end: 1.0),
                                            curve: Curves.easeOutCubic,
                                            builder: (BuildContext context, double value,
                                                Widget? child) {
                                              return MultipleColorCircle(
                                                colorOccurrences: {
                                                  pickerPurpleColor: 3,
                                                  pickerLightPinkColor: 1
                                                },
                                                height: size.height * 0.035,
                                                child: Text(
                                                  '0',
                                                  style: TextStyle(
                                                      fontSize: circleText,
                                                      fontWeight: circleTextWeight),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(top: size.height * 0.03),
                                          height: size.height * 0.03,
                                          child: Text(
                                            circleHeadText7,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: circleBottomText),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      /*Navigator.push(context,
                              MaterialPageRoute(builder:
                                  (context) =>  EditClientScreen(),
                              ));*/
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          //  margin: EdgeInsets.only(left: size.width * 0.05),
                                          child: TweenAnimationBuilder(
                                            duration: const Duration(seconds: 2),
                                            tween: Tween(begin: 0.0, end: 1.0),
                                            curve: Curves.easeOutCubic,
                                            builder: (BuildContext context, double value,
                                                Widget? child) {
                                              return MultipleColorCircle(
                                                colorOccurrences: {
                                                  pickerDarkRedColor: 3,
                                                  pickerLightOrangeColor: 1
                                                },
                                                height: size.height * 0.035,
                                                child: Text(
                                                  state.notProcessedCount.toString(),
                                                  style: TextStyle(
                                                      fontSize: circleText,
                                                      fontWeight: circleTextWeight),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: size.height * 0.03,
                                          margin: EdgeInsets.only(top: size.height * 0.03),
                                          child: Text(
                                            circleHeadText8,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: circleBottomText),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap:(){
                                      /* Navigator.push(context,
                              MaterialPageRoute(builder:
                                  (context) =>  EditClientScreen(),
                              ));*/
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          // margin: EdgeInsets.only(left: size.width * 0.09),
                                          child: TweenAnimationBuilder(
                                            duration: const Duration(seconds: 2),
                                            tween: Tween(begin: 0.0, end: 1.0),
                                            curve: Curves.easeOutCubic,
                                            builder: (BuildContext context, double value,
                                                Widget? child) {
                                              return MultipleColorCircle(
                                                colorOccurrences: {
                                                  pickerDarkPinkColor: 3,
                                                  pickerPinkColor: 1
                                                },
                                                height: size.height * 0.035,
                                                child: Text(
                                                  '25',
                                                  style: TextStyle(
                                                      fontSize: circleText,
                                                      fontWeight: circleTextWeight),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: size.height * 0.03,
                                          margin: EdgeInsets.only(top: size.height * 0.03),
                                          child: Text(
                                            circleHeadText9,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: circleBottomText),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Container(
                                  margin: EdgeInsets.only(
                                      left: size.width * 0.05,
                                      top: size.height * 0.05,
                                      bottom: size.height * 0.01),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'Assets/Images/icon3.png',
                                        height: 30,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(left: size.width * 0.01),
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: new BoxDecoration(
                                          color: pickerPrimaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text(
                                          state.orderViaDirectCount.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: size.width * 0.05,
                                      top: size.height * 0.05,
                                      bottom: size.height * 0.01),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'Assets/Images/icon4.png',
                                        height: 30,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(left: size.width * 0.01),
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: new BoxDecoration(
                                          color: pickerPrimaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text(
                                          state.orderViaAppCount.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: size.width * 0.05,
                                      top: size.height * 0.05,
                                      bottom: size.height * 0.01),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'Assets/Images/icon5.png',
                                        height: 30,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                            right: size.width * 0.05,
                                            left: size.width * 0.01),
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: new BoxDecoration(
                                          color: pickerPrimaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text(
                                          state.orderViaStaffCount.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: size.width * 0.05,
                                      top: size.height * 0.02,
                                      bottom: size.height * 0.05),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'Assets/Images/icon6.png',
                                        height: 30,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(left: size.width * 0.01),
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: new BoxDecoration(
                                          color: pickerPrimaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text(
                                          '8',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: size.width * 0.05,
                                      top: size.height * 0.02,
                                      bottom: size.height * 0.05),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'Assets/Images/icon7.png',
                                        height: 30,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(left: size.width * 0.01),
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: new BoxDecoration(
                                          color: pickerPrimaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text(
                                          '5',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: size.width * 0.05,
                                      right: size.width * 0.05,
                                      top: size.height * 0.02,
                                      bottom: size.height * 0.05),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'Assets/Images/icon8.png',
                                        height: 30,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(left: size.width * 0.01),
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: new BoxDecoration(
                                          color: pickerPrimaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text(
                                          '4',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        );
                      }
                      else {
                        print(state.toString());
                        return Column(
                          children: [
                            ShimmerRow(),
                            SizedBox(height: 12),
                            ShimmerRow(),
                            SizedBox(height: 12),
                            ShimmerRow(),
                          ],
                        );
                      }
                    },
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.03),
                  padding: EdgeInsets.all(smallTextPadding),
                  width: size.width * 0.75,
                  child:  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder:
                              (context) =>  MyClientScreen(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: pickerLightGreenColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(buttonBorderRadius),

                      ),
                      elevation: 15.0,
                    ),
                    child:  Text(
                      dashboardButton2Text,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){

                    Navigator.push(context,
                        MaterialPageRoute(builder:
                            (context) =>  MyOrderScreen(),
                        ));
                  },
                  child: Container(
                      margin: EdgeInsets.only(top: size.height * 0.05),
                      child: Center(
                        child: Text(
                          dashboardHeadText2,
                          style: TextStyle(
                            color: pickerPrimaryColor,
                            fontSize: dashboardHeaderText2,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: size.height * 0.03, bottom: size.height * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: size.height * 0.02),
                        child: Text(
                          'Select',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: smallText,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.bottomRight,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Radio(
                                      value: 'Last 7 days',
                                      groupValue: '1',
                                      onChanged: (x) {}),
                                  Radio(
                                      value: 'Today',
                                      groupValue: '2',
                                      onChanged: (x) {}),
                                ],
                              ),
                              Container(
                                margin:
                                EdgeInsets.only(right: size.width * 0.05),
                                child: Table(
                                  defaultColumnWidth: FixedColumnWidth(120.0),
                                  border: TableBorder.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  children: [
                                    TableRow(children: [
                                      Column(children: [
                                        Container(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text('Last 7 days',
                                              style: TextStyle(fontSize: 15.0)),
                                        )
                                      ]),
                                    ]),
                                    TableRow(children: [
                                      Column(children: [
                                        Container(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text('Today',
                                              style: TextStyle(fontSize: 15.0)),
                                        )
                                      ]),
                                    ]),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: size.width * 0.01,
                      vertical: size.height * 0.06),
                  child: SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    //title: ChartTitle(text: isCardView ? '' : ''),
                    //legend: Legend(isVisible: !isCardView),
                    primaryXAxis: CategoryAxis(
                        majorGridLines: const MajorGridLines(width: 0)),
                    primaryYAxis: NumericAxis(
                        minimum: 0,
                        maximum: 100,
                        axisLine: const AxisLine(width: 0),
                        majorGridLines: const MajorGridLines(width: 0),
                        majorTickLines: const MajorTickLines(size: 0)),
                    series: _getTracker(),
                    tooltipBehavior: _tooltipBehavior,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: size.height * 0.01,
                          right: size.width * 0.5,
                          bottom: size.height * 0.08),
                      padding: EdgeInsets.all(smallTextPadding),
                      width: size.width * 0.36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)
                        ),
                        color: Colors.grey.shade300,
                      ),
                      child: Text(
                        'Activity Log',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: pickerPrimaryColor,
                            fontSize: largeButtonTextSize,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Assets/Images/bg.png'),
                fit: BoxFit.fill),
          ),
          child: BottomDrawer(),
        ),
      ),
    );

  }
}
