import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:karma/API/user_api.dart';
import 'package:karma/karma_drive.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

Map userData = {};

@override
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: HexColor("#FF8500"),
    ));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserAPI>(create: (_) => UserAPI()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
        home: SplashScreen(),
        title: 'Karma',
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  getData() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    bool? isLogin = s.getBool('isLogin') ?? false;
    if (isLogin) {
      userData = s.getString('userDetails') == null
          ? {}
          : jsonDecode(s.getString('userDetails') ?? '');
      Navigator.push(context, MaterialPageRoute(builder: (_) => KarmaDrive()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Container(
      color: Colors.amber,
      child: null,
    );
  }
}
