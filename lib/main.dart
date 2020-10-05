import 'package:flutter/material.dart';
import 'Presentation/navigation_icons.dart';

var user_name = "James William";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waller',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          elevation: 0, // This removes the shadow from all App Bars.
        ),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 25),
          child: CircleAvatar(
            child: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            backgroundColor: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Icon(Icons.settings),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello',
                  ),
                  Text('$user_name',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            left: 25,
            top: 0,
          ),
          Positioned(
            top: 80,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 30, left: 50),
                      child: Icon(
                        Icons.add,
                        color: Colors.grey[400],
                        size: 30,
                      ),
                    ),
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            width: 200,
                            height: 250,
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.2),
                              borderRadius: BorderRadius.circular(28),
                              color: Color(0xFFF32D49),
                            ),
                            child: Text("VISA"),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.4,
            maxChildSize: 0.8,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.5,
                      blurRadius: 25,
                      offset: Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                ),
                // color: Colors.white,
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 15),
                      child: Center(
                        child: Icon(
                          Navigation.up_open,
                          size: 20,
                        ),
                      ),
                    ),
                    ListView.builder(
                      physics: ScrollPhysics(),
                      controller: scrollController,
                      itemCount: 8,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Icon(
                                  Icons.access_alarm,
                                  size: 50,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Tinder"),
                                  Text("22 Nov, 2019, 10:10"),
                                ],
                              ),
                              Text("\$45"),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
