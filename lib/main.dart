import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:odella_master/app/app.dart';
import 'package:odella_master/app/di.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initAppModule();



  Provider.debugCheckInvalidValueType=null;
  ByteData  data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());

  runApp(MyApp() );
}


// import 'package:flutter/material.dart';
// import 'package:odella_master/presentation/program/view/homePage.dart';
//
// import 'package:odella_master/presentation/program/view_model/program_viewmodel.dart';
//
// import 'package:provider/provider.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<ProgramViewModel>(create: (_)=>
//             ProgramViewModel()
//         ),
//
//       ],
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: MyHomePage(),
//       ),
//
//     );
//
//
//   }
// }
