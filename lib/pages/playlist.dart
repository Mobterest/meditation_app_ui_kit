import 'package:flutter/material.dart';
import '../widgets/appBar.dart';
import '../global/dimensions.dart';
import '../global/config.dart';
import '../global/constants.dart';
import '../global/styles.dart';
import '../widgets/listTile.dart';
import 'home.dart';
import '../global/colors.dart';
import 'player.dart';

class Playlist extends StatefulWidget {
  final String name;

  Playlist(this.name);
  @override
  _PlaylistState createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
        break;
      case 1:
        break;
    }
  }

  List<Color> _colors = [DBLUE, MBLUE];
  List<double> _stops = [0.1, 0.7];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_PALETTE,
      appBar: getAppBar(),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: ListView(shrinkWrap: true, children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              height: MediaQuery.of(context).size.height * 0.18,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Flex(
                crossAxisAlignment: CrossAxisAlignment.start,
                direction: Axis.vertical,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(widget.name + ' Sounds', style: STYLE_SOUND_TEXT),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Sometimes the most productive thing you can do is rest',
                      style: STYLE_SOUND_DESC),
                  SizedBox(height: 5),
                  RaisedButton.icon(
                      color: LBLUE,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Player('Train Your Mind', 'By Lebron James')),
                        );
                      },
                      icon: Icon(Icons.play_arrow),
                      label: Text(SOUND_BTN)),
                  SizedBox(height: 5),
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: containerBorder,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: _colors,
                    stops: _stops,
                  ))),
          Tile('Train Your Mind', 'By Lebron James', '20min'),
          Tile('How to Meditate', 'By Jeff Warren', '15min'),
          Tile('Sienna The Sleepy Sloth', 'By David Williams', '39min'),
          Tile('The Velveteen Rabbit', 'By Anna Acton', '40min'),
          Tile('Myth of the Baby Dragon', 'By Kelly Rowland', '40min'),
          Tile('Firefly Forest Lullaby', 'By Tom Middleton', '20min'),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('')),
          BottomNavigationBarItem(
              icon: Icon(Icons.queue_music), title: Text('')),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: DBLUE,
        onTap: _onItemTapped,
      ),
    );
  }
}
