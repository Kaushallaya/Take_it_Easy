import 'package:flutter/material.dart';

import '../main.dart';
import 'side_bar.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        HomeScreen(),
        SideBar(),
      ],
    );
  }
}