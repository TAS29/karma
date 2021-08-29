import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'karma_drive.dart';
import 'models/provider_model.dart';

String? finalEmail;

String? finalPass;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool showPassword = false;
  GlobalKey<FormState> fKey = GlobalKey<FormState>();
  ProviderModel? providerModel;

  @override
  Widget build(BuildContext context) {
    if (providerModel == null) {
      providerModel = ProviderModel().initialize(context);
    }
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .20,
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                  color: HexColor("#FF8500"),
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 100.0)),
                ),
                child: Center(
                  child: Text(
                    'login'.toUpperCase(),
                    style:
                        GoogleFonts.openSans(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .10,
              ),
              Form(
                key: fKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 50, left: 25, right: 25, bottom: 5),
                      child: TextFormField(
                        controller: username,
                        validator: (a) {
                          if (a!.isEmpty) {
                            return 'Required';
                          } else {
                            return null;
                          }
                        },
                        enabled: true,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(2.0),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 50, left: 25, right: 25, bottom: 15),
                      child: TextFormField(
                        controller: password,
                        validator: (a) {
                          if (a!.isEmpty) {
                            return 'Required';
                          } else {
                            return null;
                          }
                        },
                        enabled: true,
                        obscureText: showPassword,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() => showPassword = !showPassword);
                            },
                          ),
                          labelText: 'Password',
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(2.0),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forgot Password',
                            style: GoogleFonts.openSans(
                                color: HexColor("#FF8500"),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .15,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 5, right: 5),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          minimumSize: Size(150, 50),
                          backgroundColor: Colors.green,
                          elevation: 0.0,
                        ),
                        child: Text(
                          'Login',
                          style: GoogleFonts.openSans(
                              color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () async {
                          if (!fKey.currentState!.validate()) {
                            return;
                          }
                          if (await providerModel!.userAPI!.login(
                              username: username.text,
                              password: password.text)) {
                            print('successful login');
                            if (true) {
                              final SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.setString(
                                  'email', username.text);
                              sharedPreferences.setString(
                                  'pass', password.text);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => KarmaDrive(),
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Incorrect Id or Password'),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not a member yet? ',
                          style: GoogleFonts.openSans(),
                        ),
                        Text(
                          'Click Here',
                          style:
                              GoogleFonts.openSans(color: HexColor("#FF8500")),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}
