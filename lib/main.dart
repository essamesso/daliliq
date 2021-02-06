import 'package:dalilaq/src/provider/cart_provider.dart';
import 'package:dalilaq/src/provider/counter_provider.dart';
import 'package:dalilaq/src/provider/favoret_provider.dart';
import 'package:dalilaq/src/provider/select_color_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:dalilaq/ConstantVarables.dart';
import 'package:dalilaq/src/screens/splash_screen.dart';
import 'package:dalilaq/src/servicess/PushNotificationService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // PushNotificationService().initialise();
  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [Locale('en'), Locale('ar')],
    path: "assets/langs",
    startLocale: Locale('en'),
    //  fallbackLocale: Locale('ar'),
    saveLocale: true,
    // useOnlyLangCode: true,
    // optional assetLoader default used is RootBundleAssetLoader which uses flutter's assetloader
    // assetLoader: RootBundleAssetLoader()
    // assetLoader: NetworkAssetLoader()
    // assetLoader: TestsAssetLoader()
    // assetLoader: FileAssetLoader()
    // assetLoader: StringAssetLoader()
    // preloaderColor: Colors.red,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ConstantVarable.lang = EasyLocalization.of(context).locale.toString();
    print("lang is ${ConstantVarable.lang}");
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CounterProvider(),
        ),
        ChangeNotifierProvider(create: (_) => ColorSelectProvider()),
        ChangeNotifierProvider(create: (_) => FavoretProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider())
      ],
      child: MaterialApp(
        title: 'DaLilaQ',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          EasyLocalization.of(context).delegate
        ],
        supportedLocales: EasyLocalization.of(context).supportedLocales,
        locale: EasyLocalization.of(context).locale,
        theme: ThemeData(
          textTheme: TextTheme(
            button: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Color(0xFFE03D3D),
                fontFamily: 'Tajawal'),
            headline1: TextStyle(
                fontSize: 18.0,
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.bold,
                fontFamily: 'Tajawal'),
            headline2: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Color(0xFF515C6F),
                fontFamily: 'Tajawal'),
            headline3: TextStyle(
                fontSize: 14.0,
                color: Color(0xFFFFFFFF),
                fontFamily: 'Tajawal'),
            headline4: TextStyle(
                fontSize: 14.0,
                color: Color(0xFFE03D3D),
                fontFamily: 'Tajawal'),
            headline5: TextStyle(
                fontSize: 14.0,
                color: Color(0xFF515C6F),
                fontFamily: 'Tajawal'),
            headline6: TextStyle(
                fontSize: 12.0,
                color: Color(0xFFFFFFFF),
                fontFamily: 'Tajawal'),
            bodyText1: TextStyle(
                fontSize: 12.0,
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w600,
                fontFamily: 'Tajawal'),
            bodyText2: TextStyle(
                fontSize: 14.0,
                color: Color(0xFF707070),
                fontWeight: FontWeight.w500,
                fontFamily: 'Tajawal'),
            caption: TextStyle(
                fontSize: 16.0,
                color: Color(0xFFE03D3D),
                fontWeight: FontWeight.bold,
                fontFamily: 'Tajawal'),
          ),

          primarySwatch: Colors.black,
          accentColor: Color(0xFFFFFFFF),
          focusColor: Color(0xFF8C98A8),
          hintColor: Color(0xFF44444f),
          backgroundColor: Color(0xFFE03D3D),
          scaffoldBackgroundColor: Colors.white,
          // canvasColor: Colors.white.withOpacity(0.0),

          fontFamily: 'Tajawal',
        ),
        home:
            //  BlocProvider<ProductCounterBloc>(
            //     create: (context) => ProductCounterBloc(), child:
            SplashScreen()
        // )
        ,
      ),
    );
  }
}
