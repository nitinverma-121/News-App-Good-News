import 'package:app1/newsappmodel.dart/newsmodel.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Details extends StatelessWidget {
  int index;
  List<Articles> arr;

  Details({Key key, this.arr, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    (arr[index].source.name) == null
                        ? "UNkNOWN"
                        : "${arr[index].source.name}",
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
                          image: NetworkImage(arr[index].urlToImage != null
                              ? arr[index].urlToImage
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
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Text(
                    (arr[index].author) == null
                        ? "UNKNOWN AUTHOR"
                        : "${arr[index].author}",
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
                    this.arr[this.index].title,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    this.arr[this.index].description,
                    style:
                        TextStyle(color: Colors.white, fontFamily: "Taviraj"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    this.arr[this.index].content,
                    style:
                        TextStyle(color: Colors.white, fontFamily: "Taviraj"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    "Published at ${this.arr[this.index].publishedAt}",
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
