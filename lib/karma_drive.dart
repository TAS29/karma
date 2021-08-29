import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:karma/login_page.dart';
import 'package:karma/profile.dart';

class KarmaDrive extends StatefulWidget {
  KarmaDrive({Key? key}) : super(key: key);

  @override
  _KarmaDriveState createState() => _KarmaDriveState();
}

class _KarmaDriveState extends State<KarmaDrive> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor("#FF8500"),
          body: Column(
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
                      'Karma Drives',
                      style: GoogleFonts.openSans(
                          color: Colors.white, fontSize: 18),
                    ),
                    Spacer(),
                    Container(
                      width: 125,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      child: Center(
                        child: Text(
                          'My Drives'.toUpperCase(),
                          style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
                    decoration: new InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(6),
                  filled: true,
                  focusColor: Colors.white,
                  labelText: "Search here...",
                  labelStyle: GoogleFonts.openSans(color: Colors.grey),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                )),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)),
                    child: ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(vertical: 45),
                        itemCount: 5,
                        itemBuilder: (context, i) {
                          return i != 0
                              ? Center(
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Container(
                                          height: 350,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .9,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Image.asset(
                                              'asset/a4b8b9b5-1666-4c27-8705-79b04fbcd08b.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Container(
                                          height: 350,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .9,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 20),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      '9,523',
                                                      style:
                                                          GoogleFonts.openSans(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      'Joined'.toUpperCase(),
                                                      style:
                                                          GoogleFonts.openSans(
                                                              color:
                                                                  Colors.white,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 100,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'category'.toUpperCase(),
                                                      style:
                                                          GoogleFonts.openSans(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Spiritual empowerment'
                                                          .toUpperCase(),
                                                      style:
                                                          GoogleFonts.openSans(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.query_builder,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      '  05:00 AM | 07 dec 2019'
                                                          .toUpperCase(),
                                                      style:
                                                          GoogleFonts.openSans(
                                                        color: Colors.white,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          20))),
                                                          minimumSize:
                                                              Size(150, 10),
                                                          backgroundColor:
                                                              Colors.lightGreen,
                                                          elevation: 0.0,
                                                        ),
                                                        child: Text(
                                                          'joined'
                                                              .toUpperCase(),
                                                          style: GoogleFonts
                                                              .openSans(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        onPressed: () {}),
                                                    TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          20))),
                                                          minimumSize:
                                                              Size(150, 10),
                                                          backgroundColor:
                                                              Colors.white,
                                                          elevation: 0.0,
                                                        ),
                                                        child: Text(
                                                          'do karma'
                                                              .toUpperCase(),
                                                          style: GoogleFonts
                                                              .openSans(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        onPressed: () {}),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          backgroundColor: Colors.lightGreen,
                                          elevation: 0.0,
                                        ),
                                        child: Text(
                                          'my profile'.toUpperCase(),
                                          style: GoogleFonts.openSans(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      ProfilePage()));
                                        }),
                                  ],
                                );
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
