import 'package:covid_19/constant.dart';
import 'package:covid_19/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../main.dart';
import '../widgets/counter.dart';
import 'set_pharmasy.dart';
import 'set_phi.dart';


class GetPharmacyScreen extends StatefulWidget {
  @override
  _GetPharmacyScreenState createState() => _GetPharmacyScreenState();
}

class _GetPharmacyScreenState extends State<GetPharmacyScreen> {
  final controller = ScrollController();
  double offset = 0;
  String DisValue = "Select Distric";
  String CtyValue = "Select City";

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
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu ),
          onPressed: (){
            Navigator.pop(context,HomeScreen());
          },
        ),
        title: Text("Find Pharmacy"),
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
           Navigator.pop(context,HomeScreen());
           },),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: (){
              Navigator.pop(context,HomeScreen());
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
                  "Find Nearest Pharmacy",
                  style: kTitleTextstyle,
                ),

            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              width: double.infinity ,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                  SizedBox(width: 20),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      value: DisValue,
                      icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                      hint: Text('Select Distric'),
                      items: [
                        'Select Distric',
                        'Gampaha',
                        'Colombo',
                        'Kaluthara',
                        'Kandy'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value){
                        setState(() {
                          DisValue=value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              width: double.infinity ,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                  SizedBox(width: 20),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                      value: CtyValue,
                      items: [
                        'Select City',
                        'Gampaha',
                        'Nittambuwa',
                        'Kataana',
                        'Mirigama'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          CtyValue=value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Center(
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 50.0,
                  color: Colors.indigo,
                  child: Text('submit',
                  style: TextStyle(
                    fontSize: 20.0,color: Colors.white,
                  ),),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)
                  ),

                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_){
                      return SetPharmacyScreen("$CtyValue");
                    }));
                  },
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
