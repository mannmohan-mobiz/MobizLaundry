import 'package:flutter/material.dart';

import '../../Models/PickerModel/search.dart';
import '../src/colors.dart';
import '../util/row_item.dart';


class CustomSearchDelegate extends SearchDelegate {


  CustomSearchDelegate();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
          color: Colors.black,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return
      //Container();

      IconButton(
        icon: const Icon(Icons.arrow_back,color: Colors.black,),
        onPressed: () {
         // close(context);
        },
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    //throw UnimplementedError();
    return Center(child: Text(query));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
    // final List<CustomerData>? mylist = query.isEmpty ? cubit.searchResult()
    //     :
    // (cubit.searchResult() ?? []).where((p) => p.name!.toUpperCase().contains(query.toUpperCase())).toList();
    // debugPrint(' #### ${mylist.toString()}');
    // return (mylist ?? []).isEmpty ? const Center(child: AppText(text: "No items found",fontSize: 20)): ListView.builder(
    //     itemCount: mylist?.length,
    //     itemBuilder: (context, index) {
    //       final String listitem = '${mylist![index].name}';
    //       return ListTile(
    //         onTap: () => open(context, ProductDetailsPage(mylist[index].id!)),
    //         title: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(listitem),
    //             const Divider(),
    //           ],
    //         ),
    //       );
    //     });
    //



    // final List<CustomerData>? mylist = query.isEmpty ? cubit.searchResult()
    //     :
    // (cubit.searchResult() ?? []).where((p) => p.name!.toUpperCase().contains(query.toUpperCase())).toList();
    // debugPrint(' #### ${mylist.toString()}');
    // return (mylist ?? []).isEmpty ? const Center(child: Text("No items found",)):
    // ListView.builder(
    //   shrinkWrap: true,
    //   itemCount: 3,
    //   physics: const BouncingScrollPhysics(),
    //   scrollDirection: Axis.vertical,
    //   itemBuilder: (itemBuilder, index) =>
    //       Container(
    //         padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
    //         margin: const EdgeInsets.symmetric(vertical: 18),
    //         decoration: BoxDecoration(
    //             color: pickerWhiteColor,
    //             borderRadius:  BorderRadius.circular(12),
    //             border: Border.all(color: pickerWhiteColor),
    //             boxShadow: const [BoxShadow(color: Colors.grey,blurRadius: 7,offset: Offset(0,4))]
    //         ),
    //         child:  Column(
    //           children: [
    //             const RowItem( label: 'Customer name:',value: 'Jason Roy',),
    //             const RowItem( label: 'Customer type:',value: 'Home',),
    //             const RowItem(label: 'Building Name/No:',value: '',),
    //             const RowItem(label: 'Floor No:',value: '',),
    //             const RowItem(label: 'House No:',value: '',),
    //             const RowItem(label: 'Mobile No:',value: '',),
    //             ElevatedButton(
    //               style: ElevatedButton.styleFrom(
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(9),
    //                 ),
    //                 side: const BorderSide(color: pickerGoldColor, width: 2.0),
    //               ),
    //               onPressed: (){
    //                 // Navigator.push(context, MaterialPageRoute(builder: (context) => const AddExpensePage()));
    //               },
    //               child: const Text('CREATE NEW ORDER',style: TextStyle(color: pickerBlackColor,fontWeight: FontWeight.w500,fontSize: 15),),),
    //
    //
    //           ],
    //         ),
    //       ),
    // );
  }
}
