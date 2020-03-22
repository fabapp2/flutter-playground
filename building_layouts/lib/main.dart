import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:share/share.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    Color color = Theme
        .of(context)
        .primaryColor;

    Widget buttonSelection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // _buildButtonColumn(color, Icons.call, "CALL"),
          FavoriteWidget(),
          _buildButtonColumn(color, Icons.near_me, "NEAR ME"),
          // _buildButtonColumn(color, Icons.share, "SHARE")
          ShareWidget()
        ],
      ),
    );


    Widget textSection = Container(
        padding: const EdgeInsets.all(32),
        child: Text("""The Nordend is popular for its bohemian mix of restaurants, cafés and bars. In the 1960s and 1970s, the Nordend was one of the centers of the student riots in Germany, along with Hamburg and Berlin. The former German foreign minister's Joschka Fischer political career started here as a student leader for the Green Party. In the 2006 local elections, Fischer's Green Party became the biggest party in the local district assembly, called "Ortsbeirat".
      Up until today, the Nordend has a vibrant mix of artists, working-class people, students, drop-outs, gays and lesbians, and - as of recently - bankers and consultants. The students of the seventies still live here, but they are now best-agers with a high disposable income, which they spend in local wine stores and organic grocery stores. 😂""",
            softWrap: true)
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
            body: ListView(
                children: [
                  Image.asset(
                      "images/Nordend.jpg",
                      width: 400,
                      height: 300,
                      fit: BoxFit.cover
                  ),
                  titleSection,
                  textSection,
                  buttonSelection,
                ]
            )
        )

    );
  }



  Column _buildButtonColumn(Color color, IconData icon, String label) {
    developer.log('building the button ${label}', name: 'my.app.category');
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
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: color,
                )
            ),
          ),
        ]
    );
  }
}


class ShareWidget extends StatefulWidget {
  @override
  _ShareWidgetState createState() => _ShareWidgetState();
}

class _ShareWidgetState extends State<ShareWidget> {
  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: Icon(
                Icons.share,
                color: Colors.red),
            onPressed: _showShare,
            )
          ),
      ],
    );
  }

  void _showShare() {
    final RenderBox box = context.findRenderObject();
    Share.share("Share to",
        sharePositionOrigin:
        box.localToGlobal(Offset.zero) &
        box.size);
  }
}


class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;
  int _favoriteCount = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(0),
            child: IconButton(
              icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
              color: Colors.red[500],
              onPressed: _toggleFavorite,
            )
        ),
        SizedBox(
            width: 18,
            child: Container(
              child: Text("$_favoriteCount"),
            )
        )
      ],
    );
  }

  _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount--;
        _isFavorited = false;
      } else {
        _favoriteCount++;
        _isFavorited = true;
      }
    });
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


