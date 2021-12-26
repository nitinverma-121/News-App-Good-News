import 'package:app1/Network/network.dart';
import 'package:app1/newsappmodel.dart/newsmodel.dart';
import 'package:flutter/material.dart';

import 'Indianmenu.dart';
import 'moredetails.dart';

class Newspage extends StatefulWidget {
  const Newspage({Key key}) : super(key: key);

  @override
  _NewspageState createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  String _topic = "omnicorn";
  TextEditingController _controller = new TextEditingController();

  Future<Newsappmodel> newsdata;

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
                      child: Expanded(
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
                              child: Container(
                                padding: EdgeInsets.all(2),
                                alignment: Alignment.center,
                                // width: MediaQuery.of(context).size.width *
                                //     (0.42),
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
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
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
                        cursorColor: Colors.yellow,
                        cursorHeight: 30,
                        textCapitalization: TextCapitalization.words,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.new_label,
                              color: Colors.yellow,
                            ),
                            hintText: "For example, OMNICORN ",
                            label: Text(
                              "SEARCH ANY TOPIC YOU WANT NEWS ABOUT",
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11),
                            ),
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontFamily: "Taviraj"),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                )
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: 0.7,
                  child: Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width * (0.75),
                    child: Image(
                        fit: BoxFit.fill,
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
                    border: Border.all(color: Colors.yellow, width: 3),
                    borderRadius: BorderRadius.circular(50)),
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
