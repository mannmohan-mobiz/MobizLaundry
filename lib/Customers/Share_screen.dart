import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareScreen extends StatefulWidget {
  const ShareScreen({Key? key}) : super(key: key);

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.blue,size: 30),
            elevation: 0,
            backgroundColor: CupertinoColors.white,
            title: Center(child: Text("SHARE APP",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w500))),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.refresh_outlined,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Refer Your Friend And Get'),
                    SizedBox(width: 15,),
                    Text('AED 10',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),)
                  ],
                ),
                SizedBox(height: 30,),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  height: 150,
                  width: MediaQuery.of(context).size.width*0.6,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                      child: Image.asset('Assets/Images/Share.jpg',fit: BoxFit.fill,)),
                ),
                SizedBox(height: 30,),
                Text('Terms And Conditions'),
                SizedBox(height: 30,),
                ElevatedButton(onPressed: () {
                  Share.share('Check Out this new Laundry App');
                },
                  child: Text('Share Now',style: TextStyle(color: Colors.white),),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                ),
              ],
            ),
          ),
        ));
  }
}
