import 'package:app1/newsappmodel.dart/newsmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

// ignore: must_be_immutable
class Details extends StatefulWidget {
  int index;
  List<Articles> arr;

  Details({Key key, this.arr, this.index}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  String response1 = '';

  String response2 = '';

  bool isfake = false;

  var firedata = FirebaseFirestore.instance.collection('Fake News');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            //name pf the author
                            //title
                            //news organisation
                            //time
                            //why do u think it is fake

                            String author = widget.arr[widget.index].author;
                            String newsorg =
                                widget.arr[widget.index].source.name;
                            String time = widget.arr[widget.index].publishedAt;
                            String title = widget.arr[widget.index].title;

                            AlertDialog _mydialogbox = AlertDialog(
                              backgroundColor: Colors.blueGrey,
                              title:
                                  Center(child: Text("A few questions before")),
                              content: Container(
                                width: 60,
                                height: 300,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "1) Why do you think this news is Fake?*",
                                      style: GoogleFonts.adventPro(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      child: TextField(
                                        keyboardType: TextInputType.text,
                                        onChanged: (value) {
                                          setState(() {
                                            response1 = value;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          hintText:
                                              "I think this report is fake beacuse.....",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.yellow)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "2). Do you have the proof of the same?",
                                      style: GoogleFonts.adventPro(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Expanded(
                                      child: TextField(
                                        keyboardType: TextInputType.text,
                                        onChanged: (value) {
                                          setState(() {
                                            response2 = value;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Yes or No",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.yellow)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              color: Colors.blueGrey[300],
                                              child: Text(
                                                " B a c k",
                                                style: GoogleFonts.roboto(
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ),
                                            )),
                                        InkWell(
                                            //name pf the author
                                            //title
                                            //news organisation
                                            //time
                                            //why do u think it is fake

                                            onTap: () {
                                              String emailid = FirebaseAuth
                                                  .instance.currentUser.email;

                                              firedata.add({
                                                'News Organisation': newsorg,
                                                'Name of the author': author,
                                                'Time of Publishing the news':
                                                    time,
                                                'News Details': title,
                                                'Reason': response1,
                                                'Proof available?': response2,
                                                'Person details who Reported': {
                                                  'Email-Id ': emailid,
                                                }
                                              });
                                              Navigator.pop(context);
                                              final snack = SnackBar(
                                                  backgroundColor: Colors.red,
                                                  content: Text(
                                                    "Successfully reported fake. Thanks for reporting",
                                                    style:
                                                        GoogleFonts.adventPro(),
                                                  ));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snack);
                                              setState(() {
                                                isfake = true;
                                              });
                                            },
                                            child: Container(
                                              color: Colors.red[300],
                                              child: Text(
                                                " R e p o r t ",
                                                style: GoogleFonts.roboto(
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );

                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    _mydialogbox);

                            //firedata.add({});
                          },
                          child: Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "  REPORT FAKE ",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 100,
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.yellow,
                    ),
                    Container(
                      child: Text(
                        (widget.arr[widget.index].source.name) == null
                            ? "UNkNOWN"
                            : "${widget.arr[widget.index].source.name}",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "ConcertOne",
                            //fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                    ),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(widget
                                          .arr[widget.index].urlToImage !=
                                      null
                                  ? widget.arr[widget.index].urlToImage
                                  : "https://i.pinimg.com/originals/13/9a/19/139a190b930b8efdecfdd5445cae7754.png"),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.image_rounded,
                          size: 35,
                          color: Colors.white,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              " F E A T U R E D ",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Text(
                        (widget.arr[widget.index].author) == null
                            ? "UNKNOWN AUTHOR"
                            : "${widget.arr[widget.index].author}",
                        style: TextStyle(
                            color: Colors.orange,
                            fontFamily: "ConcertOne",
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        this.widget.arr[this.widget.index].title,
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        this.widget.arr[this.widget.index].description,
                        style: TextStyle(
                            color: Colors.white, fontFamily: "Taviraj"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        this.widget.arr[this.widget.index].content,
                        style: TextStyle(
                            color: Colors.white, fontFamily: "Taviraj"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        "Published at ${this.widget.arr[this.widget.index].publishedAt}",
                        style: TextStyle(
                            color: Colors.white,
                            wordSpacing: 3,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontFamily: "newone",
                            fontSize: 20),
                      ),
                    )
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow, width: 7),
                    borderRadius: BorderRadius.circular(50))),
            if (isfake == true)
              Container(
                alignment: Alignment.center,
                child: Transform.rotate(
                  angle: math.pi / 4,
                  child: Text("F A K E",
                      style:
                          GoogleFonts.anton(color: Colors.red, fontSize: 130)),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        child: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 30,
        ),
        mini: true,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
