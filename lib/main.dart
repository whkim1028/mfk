import 'package:br_stars/screen/brInfo.dart';
import 'package:br_stars/screen/record.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '브롤스타즈 전적 검색',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: '브롤스타즈 전적 검색'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int pageNum = 0;
  int currSelect = 0;

  Widget setPage(int i) {
    switch (i) {
      case 0:
        return Record();
        break;
      case 1:
        return BrInfo();
        break;
    }
  }

  MaterialAccentColor setAppBarColor(int i) {
    switch (i) {
      case 0:
        return Colors.blueAccent;
        break;
      case 1:
        return Colors.deepPurpleAccent;
        break;
    }
  }

  Text setTitle(int i) {
    switch (i) {
      case 0:
        return Text('Best K-Pop');
        break;
      case 1:
        return Text('브롤러 정보');
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: setTitle(pageNum),
        backgroundColor: setAppBarColor(pageNum),
//        leading:           IconButton(
//          icon: Icon(Icons.menu),
//          onPressed: () {
//            print('hello');
//          },
//        ),
      ),
      body: setPage(pageNum),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('All Time'),
              leading: currSelect == 0 ? Icon(Icons.star , color: Colors.redAccent,) :Icon(Icons.star) ,
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('2019 Best K-POP'),
              leading: currSelect == 2019 ? Icon(Icons.star , color: Colors.redAccent,) :Icon(Icons.star),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('2018 Best K-POP'),
              leading: currSelect == 2018 ? Icon(Icons.star , color: Colors.redAccent,) :Icon(Icons.star),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('2017 Best K-POP'),
              leading: currSelect == 2017 ? Icon(Icons.star , color: Colors.redAccent,) :Icon(Icons.star),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('2016 Best K-POP'),
              leading: currSelect == 2016 ? Icon(Icons.star , color: Colors.redAccent,) :Icon(Icons.star),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('2015 Best K-POP'),
              leading: currSelect == 2015 ? Icon(Icons.star , color: Colors.redAccent,) :Icon(Icons.star),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: setAppBarColor(pageNum),
        items: [
          TabItem(icon: Icons.list, title: ''),
          TabItem(icon: Icons.info_outline, title: ''),
        ],
        initialActiveIndex: 0, //optional, default as 0
        onTap: (int i) {
          setState(() {
            pageNum = i;
          });
        },
      ),
    );
  }
}
