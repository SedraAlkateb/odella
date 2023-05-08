import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'package:untitled/app/app.dart';
import 'package:untitled/app/constants.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/lang/codegen_loader.g.dart';
import 'package:untitled/presentation/resources/language_manager.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModule();
  Provider.debugCheckInvalidValueType=null;
  ByteData  data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());

  runApp(EasyLocalization(
    supportedLocales:const [
     ARABIC_LOCALE,
      ENGLISH_LOCALE
    ],
      assetLoader:const CodegenLoader(),
      fallbackLocale:const  Locale('en'),
      path: ASSET_PATH_LOCALISATION,
      child: Phoenix(child: MyApp())) );
}