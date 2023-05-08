
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:odella_master/generated/l10n.dart';

import 'package:provider/provider.dart';
import 'package:odella_master/app/di.dart';
import 'package:odella_master/presentation/base_home/view_model/base_home_view_model.dart';
import 'package:odella_master/presentation/map_position/view_model/map_position_view_model.dart';
import 'package:odella_master/presentation/page/drawer/view/drawer_viewmodel.dart';
import 'package:odella_master/presentation/page/page_view_model.dart';
import 'package:odella_master/presentation/login/view_model/login_viewmodel.dart';

import 'package:odella_master/presentation/resources/routes_manager.dart';
import 'package:odella_master/presentation/resources/them_manager.dart';
import 'package:odella_master/presentation/signup/view_model/signup_view_model.dart';
import 'package:odella_master/presentation/page/home/view_model/home_view_model.dart';
import 'package:odella_master/presentation/page/profile/view_model/profile_view_model.dart';
import 'package:odella_master/presentation/subscription/view_model/subscription_view_model.dart';


class MyApp extends StatefulWidget {
  //name constructor
  MyApp._internal();

  static final MyApp _instance=

  MyApp._internal();

  factory MyApp()=> _instance;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>instance<SignUpViewModel>()),
          ChangeNotifierProvider(create: (_)=> MapPositionViewModel()),
          ChangeNotifierProvider(create: (_)=> instance<LoginViewModel>()),
          ChangeNotifierProvider(create: (_)=> instance<HomeViewModel>()),
          ChangeNotifierProvider(create: (_)=>NavbarProvider()),
          ChangeNotifierProvider(create: (_)=>instance<ProfileViewModel>()),
          ChangeNotifierProvider(create: (_)=>instance<SubscriptionViewModel>()),
          ChangeNotifierProvider(create: (_)=>instance<DrawerViewModel>()),
          ChangeNotifierProvider(create: (_)=>instance<BaseHomeViewModel>()),
          // ChangeNotifierProvider(create: (_)=>instance<ProgramViewModel>(),),


        ],
        child: MaterialApp(
          debugShowCheckedModeBanner:false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.splashRoute,
          theme: getApplicationTheme(

          ),
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
      ),

    );


  }
}
