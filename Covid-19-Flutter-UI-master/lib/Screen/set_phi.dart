import 'package:covid_19/constant.dart';
import 'package:covid_19/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../main.dart';
import '../widgets/counter.dart';


class SetPhiScreen extends StatefulWidget {

  final String cityname;
  const SetPhiScreen(this.cityname);

  @override
  _SetPhiScreenState createState() => _SetPhiScreenState();
}

class _SetPhiScreenState extends State<SetPhiScreen> {
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
        title: Text("PHI Officer Detail"),
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
              image: "assets/icons/phi.svg",
              textTop: "Find in hear",
              textBottom: "Cantact him.",
              offset: offset,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 10, right: 20,bottom: 20),
              child: Text(
                "Gampaha : PHI officer",
                style: kTitleTextstyle,
              ),

            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              padding: EdgeInsets.symmetric( horizontal: 10,vertical: 20),
              height:150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: ListTile(
                title: Text("E A Keerthipala"),
                leading: Icon(Icons.person,size: 60,),
                subtitle: Text("Gampaha MOH OFFICE \n 071-8075206 \n Member No: 1452"),

              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Center(
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 50.0,
                  color: Colors.indigo,
                  child: Text('Call now',
                    style: TextStyle(
                      fontSize: 20.0,color: Colors.white,
                    ),),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)
                  ),
                  onPressed: (){},
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
