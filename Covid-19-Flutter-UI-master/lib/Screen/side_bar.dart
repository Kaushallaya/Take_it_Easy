import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../main.dart';
import 'get_pharmasy.dart';
import 'get_phi.dart';
import 'myinfo_screen.dart';

class SideBar extends StatefulWidget {

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: _animationDuration);
    isSidebarStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarStreamController.stream;
    isSidebarOpenedSink = isSidebarStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed(){
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if(isAnimationCompleted){
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
    }

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync){
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: Color(0xFF262AAA),
                  child: Scaffold(
                    backgroundColor:Color(0xFF262AAA) ,
                    body: Column(
                      children: <Widget>[
                        SizedBox(height: 80,),
                        ListTile(
                          title: Text("FIND EASY", style: TextStyle(
                              color: Colors.white,fontSize: 20,fontWeight: FontWeight.w800
                            ),
                          ),
                          subtitle: Text("search.call.order", style: TextStyle(
                            color: Color(0xFF1BB5FD),fontSize: 10,
                           ),
                          ),
                          leading: CircleAvatar(
                            child: Icon(
                              Icons.perm_identity, color: Colors.white,
                            ),
                            radius: 40,
                          ),
                        ),
                        Divider(
                          height: 64,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.3),
                          indent: 32,
                          endIndent: 32,
                        ),
                        Container(
                          width: screenWidth,
                          alignment: Alignment.center,
                            child: ListTile(
                              title:Text("Home",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 15),),
                              leading: Icon(Icons.home,color: Colors.cyan,size: 30,),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (_){
                                  return HomeScreen();
                                }));
                              },
                            ),
                        ),
                        Container(
                          width: screenWidth,
                          alignment: Alignment.center,
                          child: ListTile(
                            title:Text("Find Pharmacy",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 15),),
                            leading: Icon(Icons.local_hospital,color: Colors.cyan,size: 30,),
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (_){
                                return GetPharmacyScreen();
                              }));
                            },
                          ),
                        ),
                        Container(
                          width: screenWidth,
                          alignment: Alignment.center,
                          child: ListTile(
                            title:Text("Find PHI",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 15),),
                            leading: Icon(Icons.group,color: Colors.cyan,size: 30,),
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (_){
                                return GetPhiScreen();
                              }));
                            },
                          ),
                        ),
                        Divider(
                          height: 64,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.3),
                          indent: 32,
                          endIndent: 32,
                        ),
                        Container(
                          width: screenWidth,
                          alignment: Alignment.center,
                          child: ListTile(
                            title:Text("Setting",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 15),),
                            leading: Icon(Icons.settings,color: Colors.cyan,size: 30,),
                          ),
                        ),
                        Container(
                          width: screenWidth,
                          alignment: Alignment.center,
                          child: ListTile(
                            title:Text("About us",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 15),),
                            leading: Icon(Icons.perm_contact_calendar,color: Colors.cyan,size: 30,),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (_){
                                  return myInfoScreen();
                                }));
                              }
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: (){
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenueClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Color(0xFF262AAA) ,
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Color(0xFF1BB5FD),
                        size: 25,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class CustomMenueClipper extends CustomClipper <Path>{
  @override
  Path getClip(Size size) {
     Paint paint = Paint();
     paint.color = Colors.white;

     final width = size.width;
     final height = size.height;

     Path path = Path();
     path.moveTo(0, 0);
     path.quadraticBezierTo(0, 8, 10, 16);
     path.quadraticBezierTo(width-1, height/2-20, width, height/2);
     path.quadraticBezierTo(width+1, height/2+20, 10, height-16);
     path.quadraticBezierTo(0, height-8, 0, height);
     path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}