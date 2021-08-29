import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:karma/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _lights = false;
  TextEditingController name = TextEditingController();
  TextEditingController num = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#FF8500"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: HexColor("#FE9E36"),
                      child: Center(
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Profile',
                      style: GoogleFonts.openSans(
                          color: Colors.white, fontSize: 18),
                    ),
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: HexColor("#FE9E36"),
                      child: Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Text(
                              'Name',
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 150,
                            ),
                            Text(
                              'Phone Number',
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 45,
                              width: 170,
                              child: TextFormField(
                                validator: (a) {
                                  if (a!.isEmpty) {
                                    return 'Required';
                                  } else {
                                    return null;
                                  }
                                },
                                enabled: true,
                                decoration: InputDecoration(
                                  labelText: userData['name'],
                                  border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: BorderSide.none),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Container(
                              height: 45,
                              width: 170,
                              child: TextFormField(
                                validator: (a) {
                                  if (a!.isEmpty) {
                                    return 'Required';
                                  } else {
                                    return null;
                                  }
                                },
                                enabled: true,
                                decoration: InputDecoration(
                                  labelText: userData['mobile'],
                                  border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: BorderSide.none),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Location',
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 150,
                            ),
                            Text(
                              'Interest',
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 45,
                              width: 170,
                              child: TextFormField(
                                validator: (a) {
                                  if (a!.isEmpty) {
                                    return 'Required';
                                  } else {
                                    return null;
                                  }
                                },
                                enabled: true,
                                decoration: InputDecoration(
                                  labelText: userData['location'],
                                  border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: BorderSide.none),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Container(
                              height: 45,
                              width: 170,
                              child: TextFormField(
                                validator: (a) {
                                  if (a!.isEmpty) {
                                    return 'Required';
                                  } else {
                                    return null;
                                  }
                                },
                                enabled: true,
                                decoration: InputDecoration(
                                  labelText: userData['interest'],
                                  border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: BorderSide.none),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Notifications',
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                            Spacer(),
                            CupertinoSwitch(
                                activeColor: HexColor("#FF8500"),
                                value: !_lights,
                                onChanged: (bool value) {
                                  setState(() {
                                    _lights = !value;
                                  });
                                })
                          ],
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              minimumSize: Size(150, 10),
                              backgroundColor: Colors.red,
                              elevation: 0.0,
                            ),
                            child: Text(
                              'Log Out'.toUpperCase(),
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () async {
                              SharedPreferences s =
                                  await SharedPreferences.getInstance();
                              s.setBool('isLogin', false);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => LoginPage()),
                                  (route) => false);
                            }),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -60,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'),
                    ),
                  ),
                ],
                clipBehavior: Clip.none,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
