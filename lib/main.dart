import 'package:flutter/material.dart';

import 'views/newsdetail.dart';

void main() {
  runApp(MaterialApp(
    title: "GOOD NEWS",
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow, width: 3),
                  borderRadius: BorderRadius.circular(50)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables, duplicate_ignore
              children: [
                Image(
                  image: AssetImage("assets/news.JPG"),
                  height: 250,
                ),
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
                Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Newspage()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        " G E T  S T A R T E D ",
                        style: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
