import 'package:app1/views/catergorynews.dart';
import 'package:flutter/material.dart';

class Indiamenu extends StatelessWidget {
  const Indiamenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow, width: 3),
                borderRadius: BorderRadius.circular(50)),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "भारत की खबरे",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.yellow,
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
                SizedBox(height: 10),
                Text(
                  "C H O O S E  Y O U R  F A V O U R I T E  N E W S  C A T E G O R Y",
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Categorynews(
                                          query: "entertainment",
                                        )));
                          },
                          child: menutype("ENTERTAINMENT",
                              "https://images.unsplash.com/photo-1499364615650-ec38552f4f34?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1072&q=80"),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Categorynews(
                                            query: "sports",
                                          )));
                            },
                            child: menutype("SPORTS",
                                "https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Categorynews(
                                            query: "general",
                                          )));
                            },
                            child: menutype("GENERAL",
                                "https://images.unsplash.com/photo-1493612276216-ee3925520721?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80")),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Categorynews(
                                            query: "business",
                                          )));
                            },
                            child: menutype("BUSINESS",
                                "https://images.unsplash.com/photo-1460925895917-afdab827c52f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1115&q=80")),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Categorynews(
                                            query: "health",
                                          )));
                            },
                            child: menutype("HEALTH",
                                "https://images.unsplash.com/photo-1530497610245-94d3c16cda28?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80")),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Categorynews(
                                            query: "technology",
                                          )));
                            },
                            child: menutype("TECHNOLOGY",
                                "https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"))
                      ],
                    )
                  ],
                )
              ],
            ),
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

Widget menutype(String t, String imglink) {
  return Opacity(
    opacity: 1,
    child: CircleAvatar(
      radius: 70,
      backgroundImage: NetworkImage(imglink),
      child: Container(
        height: 22,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Text(
          t,
          style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: "ConcertOne"),
        ),
      ),
    ),
  );
}
