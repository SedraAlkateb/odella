// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:odella_master/app/app_preferences.dart';
import 'package:odella_master/app/di.dart';
import 'package:odella_master/presentation/page/drawer/view/drawer_viewmodel.dart';
import 'package:odella_master/presentation/page/home/view_model/home_view_model.dart';
import 'package:odella_master/presentation/page/page_view_model.dart';
import 'package:odella_master/presentation/page/profile/view_model/profile_view_model.dart';
import 'package:odella_master/presentation/resources/color_manager.dart';
import 'package:odella_master/presentation/resources/routes_manager.dart';

class NavBar extends StatelessWidget {
   NavBar({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final AppPreferences _appPreferences =instance<AppPreferences>();
if(Provider.of<DrawerViewModel>(context).isSuccess()){
  _appPreferences.signOut().then((value) {
      Provider.of<DrawerViewModel>(context,listen: false).dispose();
      Navigator.pushReplacementNamed(context,Routes.afterSplashRoute);
    }
    );
}
    return Drawer(

      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("User name"),
            accountEmail: Text("email@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: Provider.of<ProfileViewModel>(context).getIm() != null
              //  profile1.getDownload()
                  ?Container(
                    width: 160.0,
                    height: 160.0,
                    decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image:
                            FileImage(
                                Provider.of<ProfileViewModel>(context).getIm()?? File("")
                            )
                        )
                    ),


                  )
                  : Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add,
                          size: 50, color: Color(0xFFFFFFFF)))
              //:profile1.getLocalPath()!=null?

            ),

            decoration: BoxDecoration(
                color: ColorManager.sidBar,
            ),
          ),
          ListTile(
            title: Text(
              "home",
              style: TextStyle(color: ColorManager.sidBarIcon),
            ),
            leading: Icon(
              Icons.home,
              color: ColorManager.sidBarIcon,
            ),

            onTap: () {
              Navigator.of(context).pushNamed(Routes.homeScreen);
            },
          ),
          Divider(
            color: ColorManager.sidBarIcon,
            height: 15,
          ),
          ListTile(
            title: Text("profile"),
            leading: Icon(Icons.person,color: ColorManager.sidBarIcon,),

            onTap: () {
              Navigator.of(context).pushNamed('Categories');
            },
          ),
          Divider(
            color: ColorManager.sidBar,
            height: 15,
          ),
          ListTile(
            title: Text("program"),
            leading: Icon(Icons.calendar_today,color: ColorManager.sidBarIcon,
            ),

            onTap: () {
              print("on tap");
            },
          ),
          Divider(
            color: ColorManager.sidBar,
            height: 15,
          ),
          ListTile(
            title: Text("bus site"),
            leading: Icon(Icons.location_on_outlined, color: ColorManager.sidBarIcon,
            ),

            onTap: () {
              print("on tap");
            },
          ),
          Divider(
            color: ColorManager.sidBar,
            height: 15,
          ),
          ListTile(
            title: Text("complaints"),
            leading: Icon(Icons.call,
              color: ColorManager.sidBarIcon,

            ),

            onTap: () {
              Navigator.of(context).pushNamed('Login');
            },
          ),
          Divider(
            color: ColorManager.sidBar,
            height: 15,
          ),
          ListTile(
            title: Text("sign out"),
            leading: Icon(Icons.logout,
              color: ColorManager.sidBarIcon,

            ),

            onTap: () async{
              await Provider.of<DrawerViewModel>(context,listen: false).logout();

              }

          ),
        ],
      ),
    );

  }
}
