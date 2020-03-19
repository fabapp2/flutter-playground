import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget buttonSelection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, "CALL"),
          _buildButtonColumn(color, Icons.near_me, "NEAR ME"),
          _buildButtonColumn(color, Icons.share, "SHARE")
        ],
      ),
    );


    return MaterialApp(
      title: 'Welcome to Flutter',
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
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter layout demo")
        ),
        body: Column(
          children:[
            titleSection,
            buttonSelection,
          ]
        )
      )

    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
                label,
                style: TextStyle(
                  fontSize:   12,
                  fontWeight: FontWeight.w400,
                  color: color,
                )
            ),
          ),
        ]
    );
  }
}




Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                "Fabians home address",
                style: TextStyle(fontWeight: FontWeight.bold)
              ),
            ),
            Text(
              "Frankfurt am Main, Nordend",
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      Icon(
        Icons.star,
        color: Colors.red[500],
      ),
      Text("41")
    ]
  )
);


