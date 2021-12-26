import 'package:app1/Network/indiannetwork.dart';
import 'package:flutter/material.dart';

import 'Categorynewsdetail.dart';

// ignore: must_be_immutable
class Categorynews extends StatefulWidget {
  String query;
  Categorynews({Key key, this.query}) : super(key: key);

  @override
  _CategorynewsState createState() => _CategorynewsState();
}

class _CategorynewsState extends State<Categorynews> {
  Future indianData;
 
  @override
  void initState() {
    super.initState();
    indianData = Indiannetwork().getIndiannews(category: widget.query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.yellow, width: 3)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 42,
              ),
              Text(
                "भारत की खबरे",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.yellow,
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width * (0.5),
                child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1597058712635-3182d1eacc1e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80")),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.query.toUpperCase(),
                style: TextStyle(
                    color: Colors.yellow,
                    letterSpacing: 3,
                    fontSize: 30,
                    fontFamily: "ConcertOne"),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: SizedBox(
                  child: FutureBuilder(
                      future: indianData,
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
                          List arr = snapshot.data.articles;
                          return ListView.builder(
                              itemBuilder: (BuildContext context, int index) {
                            return Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                    //height: 150,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                        builder: (BuildContext
                                                                context) =>
                                                            Categorynewsdetail(
                                                              arr: arr,
                                                              index: index,
                                                            )));
                                              },
                                              child:
                                                  Text.rich(TextSpan(children: [
                                                TextSpan(
                                                    text: arr[index].title,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "ConcertOne",
                                                        fontSize: 15)),
                                                TextSpan(
                                                    text: " know more...",
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.bold))
                                              ])),
                                            ),
                                          ),
                                        ])));
                          });
                        }
                      }),
                ),
              ),
            ],
          )
        ],
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
