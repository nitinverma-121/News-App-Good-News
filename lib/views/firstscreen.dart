import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'newsdetail.dart';

// ignore: must_be_immutable
class Firstscreen extends StatefulWidget {
  String username;
  String emailid;

  Firstscreen({Key key, this.username, this.emailid}) : super(key: key);

  @override
  _FirstscreenState createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  String _name = 'NOT PROVIDED';
  String _age = 'NOT PROVIDED';
  String _section = 'NOT PROVIDED';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow, width: 3),
                  borderRadius: BorderRadius.circular(50)),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables, duplicate_ignore
                children: [
                  Text(
                    "GOOD NEWS IS COMING",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Text(
                    "सब अच्छा है",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    'assets/news.gif',
                    height: 200,
                    width: 400,
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                        ],
                      ),
                      Text(
                        "TELL US A LITTLE ABOUT YOU",
                        style: GoogleFonts.adventPro(
                            color: Colors.white, fontSize: 27),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                        child: Column(
                          children: [
                            TextFormField(
                              onFieldSubmitted: (value) {
                                setState(() {
                                  _name = value;
                                });
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  labelText: "Y O U R  N A M E ",
                                  prefixIcon: Icon(
                                    FontAwesomeIcons.user,
                                    color: Colors.white,
                                  ),
                                  labelStyle: GoogleFonts.abhayaLibre(
                                      color: Colors.white),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.yellow),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              onFieldSubmitted: (value) {
                                setState(() {
                                  _age = value;
                                });
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  labelText: "A G E ",
                                  prefixIcon: Icon(
                                    Icons.format_list_numbered,
                                    color: Colors.white,
                                  ),
                                  labelStyle: GoogleFonts.abhayaLibre(
                                      color: Colors.white),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.yellow),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              onFieldSubmitted: (value) {
                                setState(() {
                                  _section = value;
                                });
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  labelText:
                                      "F A V O U R A T E   N E W S   G E N R E  ",
                                  hintText:
                                      "entertainment, health, business etc",
                                  hintStyle:
                                      GoogleFonts.roboto(color: Colors.grey),
                                  prefixIcon: Icon(
                                    FontAwesomeIcons.magic,
                                    color: Colors.white,
                                  ),
                                  labelStyle: GoogleFonts.abhayaLibre(
                                      color: Colors.white),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.yellow),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          "Make sure to save the responses after typing each one",
                          style: GoogleFonts.adventPro(color: Colors.red)),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Newspage(
                                            age: _age,
                                            name: _name,
                                            section: _section,
                                            username: widget.username,
                                            emailid: widget.emailid,
                                          )));
                            },
                            child: Shimmer.fromColors(
                              baseColor: Colors.yellow,
                              highlightColor: Colors.purple,
                              child: Text(
                                "G E T  S T A R T E D  B Y  C L I C K I N G  H E R E",
                                style: GoogleFonts.adventPro(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
