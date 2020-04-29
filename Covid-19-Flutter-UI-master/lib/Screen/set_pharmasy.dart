import 'package:covid_19/constant.dart';
import 'package:covid_19/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../main.dart';
import '../widgets/counter.dart';
import 'deliver_info_screen.dart';


class SetPharmacyScreen extends StatefulWidget {

  final String cityname;
//  final String distname;
  const SetPharmacyScreen(this.cityname);

  @override
  _SetPharmacyScreenState createState() => _SetPharmacyScreenState();
}

class _SetPharmacyScreenState extends State<SetPharmacyScreen> {
  final controller = ScrollController();
  double offset = 0;

  String ctyName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    ctyName = widget.cityname;


    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(context,HomeScreen());
          },
        ),
        title: Text("Pharmacy Detail"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF3383CD),
                Color(0xFF11249F),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return HomeScreen();
              }));
            },),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_){
              return DelInfoScreen();
            }));
            },),
        ],
      ),

      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              image: "assets/icons/deliveryboy.svg",
              textTop: "Find in hear",
              textBottom: "Deliver it easy.",
              offset: offset,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 10, right: 20,bottom: 20),
              child: Text(
                "$ctyName : 5 Pharmacys Available",
                style: kTitleTextstyle,
              ),

            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              padding: EdgeInsets.symmetric( horizontal: 10),
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: ListTile(
                title: Text("Lanka Pharmacy"),
                leading: Icon(Icons.call,size: 30,color: Colors.green,),
                subtitle: Text("077-2654235"),
                trailing: Icon(Icons.menu),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              padding: EdgeInsets.symmetric( horizontal: 10),
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: ListTile(
                title: Text("Sirisada Pharmacy"),
                leading: Icon(Icons.call,size: 30,color: Colors.green,),
                subtitle: Text("071-2756927"),
                trailing: Icon(Icons.menu),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              padding: EdgeInsets.symmetric( horizontal: 10),
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: ListTile(
                title: Text("Central pharmacy"),
                leading: Icon(Icons.call,size: 30,color: Colors.green,),
                subtitle: Text("072-7257001"),
                trailing: Icon(Icons.menu),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              padding: EdgeInsets.symmetric( horizontal: 10),
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: ListTile(
                title: Text("Malitha Pharmacy"),
                leading: Icon(Icons.call,size: 30,color: Colors.green,),
                subtitle: Text("076-7296262"),
                trailing: Icon(Icons.menu),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              padding: EdgeInsets.symmetric( horizontal: 10),
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: ListTile(
                title: Text("Osara Pharmacy"),
                leading: Icon(Icons.call,size: 30,color: Colors.green,),
                subtitle: Text("071-98793340"),
                trailing: Icon(Icons.menu),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
