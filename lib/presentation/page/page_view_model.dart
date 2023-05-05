import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:untitled/presentation/page/home/view/home_view.dart';
import 'package:untitled/presentation/page/position/view/position_view.dart';
import 'package:untitled/presentation/page/profile/view/profile_view.dart';

class NavbarProvider  with ChangeNotifier {
  List<NavbarDTO> items = [
    NavbarDTO(label: 'Home',widget: HomeView(),iconData: Icons.home,appBar: getHomeAppBar()),
    NavbarDTO(label: 'Profile',widget: ProfileView(),iconData: Icons.account_box_rounded,appBar:getAppBar()),
    NavbarDTO(label: 'Program',widget: PositionView(),iconData: Icons.location_on),
  ];
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

}

class NavbarDTO{
  Widget? widget;
  AppBar? appBar;
  String? label;
  IconData? iconData;

  NavbarDTO({this.widget, this.label, this.iconData,this.appBar});

}