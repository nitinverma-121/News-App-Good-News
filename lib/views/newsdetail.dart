import 'package:app1/Network/network.dart';
import 'package:app1/authentication/authform.dart';
import 'package:app1/newsappmodel.dart/newsmodel.dart';
import 'package:app1/views/firstscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Indianmenu.dart';
import 'moredetails.dart';

// ignore: must_be_immutable
class Newspage extends StatefulWidget {
  String name;
  String section;
  String age;
  String username;
  String emailid;

  Newspage(
      {Key key, this.age, this.section, this.name, this.emailid, this.username})
      : super(key: key);

  @override
  _NewspageState createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  String _topic = "omnicorn";
  TextEditingController _controller = new TextEditingController();

  Future<Newsappmodel> newsdata;
  String rating = '1';
  String reviews = '';
  @override
  void initState() {
    super.initState();

    newsdata = Network().getData(query: _topic);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.yellow, width: 3),
                      borderRadius: BorderRadius.circular(50)),
                ),
                Column(
                  children: [
                    //SizedBox(height: 90),
                    Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 5,
                          width: MediaQuery.of(context).size.width * (0.75),
                          child: Image(
                              colorBlendMode: BlendMode.hardLight,
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1605611740084-3fa19067fea9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80"),
                              fit: BoxFit.cover),
                        ),
                        Text(
                          "GOOD NEWS",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "newone",
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                        Container(
                          height: 5,
                          width: MediaQuery.of(context).size.width * (0.75),
                          child: Image(
                              colorBlendMode: BlendMode.hardLight,
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1605611740084-3fa19067fea9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80"),
                              fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "T H E  L E A S T  W E  C A N  H O P E ",
                            style: TextStyle(
                                color: Colors.grey, fontFamily: "Taviraj"),
                          ),
                        )
                      ],
                    ),

                    Opacity(
                      opacity: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Indiamenu()));
                            },
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(2),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "जाने भारत की टॉप हेडलाइंस",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                            fontSize: 17),
                                      ),
                                      Image(
                                          height: 17,
                                          width: 20,
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              "https://images.unsplash.com/photo-1597058712635-3182d1eacc1e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80"))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        FirebaseAuth.instance.signOut();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        Authform()));
                                      },
                                      child: Column(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.signOutAlt,
                                            color: Colors.white,
                                          ),
                                          Text('Sign Out',
                                              style: GoogleFonts.adventPro(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    InkWell(
                                      onTap: () {
                                        //SHOW My own information using alert dialog Box
                                        AlertDialog _myalertbox = AlertDialog(
                                          alignment: Alignment.center,
                                          content: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 300,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 150,
                                                  width: 200,
                                                  child: Image(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        'assets/user.png'),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.verified_user,
                                                      color: Colors.black,
                                                    ),
                                                    Text(
                                                      " ${widget.name} (verified) / ${widget.age}",
                                                      //: " ${widget.username} (verified) ",
                                                      style:
                                                          GoogleFonts.adventPro(
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.email,
                                                      color: Colors.black,
                                                    ),
                                                    Text(
                                                      " ${widget.emailid}",
                                                      style:
                                                          GoogleFonts.adventPro(
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                        FontAwesomeIcons.airbnb,
                                                        color: Colors.black),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          " Favourate News choice: ",
                                                          style: GoogleFonts
                                                              .adventPro(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                        Text(
                                                          widget.section == null
                                                              ? " NOT PROVIDED "
                                                              : " ${widget.section}"
                                                                  .toUpperCase(),
                                                          style: GoogleFonts
                                                              .adventPro(
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                      ],
                                                    ),
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
                                                    InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (BuildContext
                                                                          context) =>
                                                                      Firstscreen(
                                                                        emailid:
                                                                            widget.emailid,
                                                                        username:
                                                                            widget.username,
                                                                      )));
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(2),
                                                          color: Colors.black,
                                                          child: Text(
                                                            " F i l l  A g a i n ",
                                                            style: GoogleFonts
                                                                .roboto(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                        )),
                                                    InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(2),
                                                          color: Colors.black,
                                                          child: Text(
                                                            " B a c k ",
                                                            style: GoogleFonts
                                                                .roboto(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          backgroundColor: Colors.white,
                                        );

                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return _myalertbox;
                                            });
                                      },
                                      child: Column(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.user,
                                            color: Colors.white,
                                          ),
                                          Text(' Me',
                                              style: GoogleFonts.adventPro(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        FirebaseAuth.instance.signOut();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        Authform()));
                                      },
                                      child: InkWell(
                                        onTap: () {
                                          //RATE US PAGE SHOULD OPEN
                                          AlertDialog _mybox = AlertDialog(
                                            content: Container(
                                              height: 350,
                                              width: 100,
                                              child: Column(
                                                children: [
                                                  Image(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                      'assets/rate1.JPG',
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  SizedBox(height: 4),
                                                  TextFormField(
                                                    onFieldSubmitted: (value) {
                                                      setState(() {
                                                        this.reviews = value;
                                                      });
                                                    },
                                                    onSaved: (value) {
                                                      setState(() {
                                                        this.reviews = value;
                                                      });
                                                    },
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    decoration: InputDecoration(
                                                        labelText:
                                                            "Your valuable reviews ",
                                                        prefixIcon: Icon(
                                                          Icons.keyboard,
                                                          color: Colors.black,
                                                        ),
                                                        labelStyle: GoogleFonts
                                                            .abhayaLibre(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              new BorderSide(
                                                                  color: Colors
                                                                      .black),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              new BorderSide(
                                                                  color: Colors
                                                                      .white),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        )),
                                                  ),
                                                  TextFormField(
                                                    onFieldSubmitted: (value) {
                                                      setState(() {
                                                        this.rating = value;
                                                      });
                                                    },
                                                    onSaved: (value) {
                                                      setState(() {
                                                        this.rating = value;
                                                      });
                                                    },
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    decoration: InputDecoration(
                                                        labelText:
                                                            "Rate us from 1 to 10 ",
                                                        prefixIcon: Icon(
                                                          Icons
                                                              .format_list_numbered,
                                                          color: Colors.black,
                                                        ),
                                                        labelStyle: GoogleFonts
                                                            .abhayaLibre(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              new BorderSide(
                                                                  color: Colors
                                                                      .black),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              new BorderSide(
                                                                  color: Colors
                                                                      .white),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        )),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      FirebaseFirestore.instance
                                                          .collection("Reviews")
                                                          .add({
                                                        'Name of the user':
                                                            widget.name,
                                                        'Email-id':
                                                            widget.emailid,
                                                        'Reviews/Suggestions':
                                                            reviews,
                                                        'Rating out of 10':
                                                            rating,
                                                      });
                                                      Navigator.pop(context);
                                                      final snackBar = SnackBar(
                                                          content: Text(
                                                              "Review done. Thank You",
                                                              style: GoogleFonts
                                                                  .adventPro(
                                                                      color: Colors
                                                                          .black)),
                                                          backgroundColor:
                                                              Colors.red);
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              snackBar);
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: double.infinity,
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                        color: Colors.black,
                                                      ),
                                                      child: Text(
                                                          "R A T E  U S",
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  color: Colors
                                                                      .white)),
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: Colors.red,
                                                    thickness: 1.5,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      'May be later',
                                                      style:
                                                          GoogleFonts.adventPro(
                                                              color:
                                                                  Colors.blue),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  _mybox);
                                        },
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.rate_review,
                                              color: Colors.white,
                                            ),
                                            Text('Rate us',
                                                style: GoogleFonts.adventPro(
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width * (0.85),
                      height: 42,
                      child: TextField(
                        controller: _controller,
                        onSubmitted: (value) {
                          setState(() {
                            _topic = value;
                            newsdata = new Network().getData(query: _topic);
                          });
                        },
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.new_label,
                            color: Colors.white,
                          ),
                          contentPadding: EdgeInsets.all(10),
                          hintText: "e.g omnicorn, mumbai, and tesla",
                          label: Text(
                            "SEARCH ANY TOPIC YOU WANT NEWS ABOUT",
                            style: GoogleFonts.adventPro(color: Colors.white),
                          ),
                          hintStyle: GoogleFonts.roboto(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                )
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: 0.4,
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * (0.75),
                    child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80")),
                  ),
                ),
                Text(
                  _topic.toUpperCase(),
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 35,
                      fontFamily: "Taviraj"),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                    // border: Border.all(color: Colors.yellow, width: 3),
                    // borderRadius: BorderRadius.circular(50)
                    ),
                child: FutureBuilder(
                  future: newsdata,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: Colors.yellow,
                          ),
                          Text(
                            "L o a d i n g...",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      );
                    } else {
                      List<Articles> arr = snapshot.data.articles;
                      return ListView.separated(
                          itemCount: arr.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              thickness: 2,
                              color: Colors.yellow,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                //height: 150,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      arr[index].source.name,
                                      style: TextStyle(
                                          fontFamily: "Taviraj",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                    Container(
                                      height: 160,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black,
                                              width: 2,
                                              style: BorderStyle.solid)),
                                      child: Image(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(arr[index]
                                                      .urlToImage !=
                                                  null
                                              ? arr[index].urlToImage
                                              : "https://i.pinimg.com/originals/13/9a/19/139a190b930b8efdecfdd5445cae7754.png")),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          Details(
                                                            arr: arr,
                                                            index: index,
                                                          )));
                                        },
                                        child: Text.rich(TextSpan(children: [
                                          TextSpan(
                                              text: arr[index].title,
                                              style: TextStyle(
                                                  fontFamily: "ConcertOne",
                                                  fontSize: 15)),
                                          TextSpan(
                                              text: " know more...",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold))
                                        ])),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  },
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
