import 'package:covid_19/constant.dart';
import 'package:covid_19/widgets/my_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../main.dart';

class myInfoScreen extends StatefulWidget {
  @override
  _myInfoScreenState createState() => _myInfoScreenState();
}

class _myInfoScreenState extends State<myInfoScreen> {
  final controller = ScrollController();
  double offset = 0;

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
          icon: Icon(Icons.home),
          onPressed: (){
            Navigator.pop(context,HomeScreen());
          },
        ),
        title: Text("Get to know"),
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
      ),

      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              image: "assets/icons/Drcorona.svg",
              textTop: "Get to know",
              textBottom: "About Covid-19.",
              offset: offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "About me",
                    style: kTitleTextstyle,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Image.asset("assets/images/me.jpg",height:150.0 ,width: 120.0,alignment: Alignment.topLeft,),
                      ),
                      Container(
                        width: 150,
                        child: Text("I'm Bagya Kaushalya, under graduate student of BSc. Computer Sience in Trincomalee campus, Eastern univercity Sri Lanka."),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Text("Please Let me know your feedback about this product"),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5,),
                          child: Image.asset("assets/images/fb.png",height:20.0 ,width: 20.0,alignment: Alignment.topLeft,),
                        ),
                        Container(
                          width: 210,
                          child: Text("Facebook.com/Bagya Kaushallaya"
                          ,style: TextStyle(fontSize: 12,color: Colors.indigo),),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Image.asset("assets/images/lkn.png",height:20.0 ,width: 20.0,alignment: Alignment.topLeft,),
                        ),
                        Container(
                          width: 210,
                          child: Text("Linkedin.com/Bagya_Kaushallaya"
                            ,style: TextStyle(fontSize: 12,color: Colors.indigo),),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Image.asset("assets/images/gmail.png",height:20.0 ,width: 20.0,alignment: Alignment.topLeft,),
                        ),
                        Container(
                          width: 210,
                          child: Text("bagyaka.bc@gmail.com"
                            ,style: TextStyle(fontSize: 12,color: Colors.indigo),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
