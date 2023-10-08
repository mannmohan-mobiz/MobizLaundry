import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue,size: 30),
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        title: Center(child: Text("EDIT PROFILE",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w500))),
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
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: InkWell(onTap: () {

                    },
                      child: Container(
                        width: 110,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blue)),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Tag GPS'),
                            SizedBox(width: 10,),
                            Icon(CupertinoIcons.map)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 15),
                              child: Text('Name',style: TextStyle(fontSize: 16),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 15),
                              child: Text('Mob No',style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 15),
                              child: Text('Whatsapp No',style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 15),
                              child: Text('Emarate',style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 15),
                              child: Text('Building Address',style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 15),
                              child: Text('Area',style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 15),
                              child: Text('Locality',style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 30),
                              child: Text('Email Id',style: TextStyle(fontSize: 16)),
                            ),
                          ],
                        ),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 15),
                              child: Text(':',style: TextStyle(fontSize: 16),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 15),
                              child: Text(':',style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 15),
                              child: Text(':',style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 15),
                              child: Text(':',style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 15),
                              child: Text(':',style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 15),
                              child: Text(':',style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 15),
                              child: Text(':',style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 30),
                              child: Text(':',style: TextStyle(fontSize: 16)),
                            ),
                          ],
                        ),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 15),
                              child: Text('Aswin',style: TextStyle(fontSize: 16),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 15),
                              child: Text('xxxxxxxxxx',style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 15),
                              child: Text('xxxxxxxxxx',style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 15),
                              child: Text('xxxxxxxxxxx',style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 15),
                              child: Text('xxxxxxxx',style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 15),
                              child: Text('Al Nadha',style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 15),
                              child: Text('Doha street',style: TextStyle(fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 30),
                              child: Text('rjaswin@outlook.com',style: TextStyle(fontSize: 16)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: InkWell(onTap: () {

                },
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                    color: Colors.blue[700],
                    ),
                    child: Center(
                      child: Text('SAVE',style: TextStyle(color: Colors.white,
                      fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
