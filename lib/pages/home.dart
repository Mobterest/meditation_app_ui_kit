import 'package:flutter/material.dart';
import '../global/constants.dart';
import '../global/styles.dart';
import '../widgets/iconItem.dart';
import '../widgets/appBar.dart';
import '../global/colors.dart';
import '../widgets/card.dart';
import 'playlist.dart';
import '../global/config.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = HOME_INDEX;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case HOME_INDEX:
        break;
      case PLAYLIST_INDEX:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Playlist('Relax')),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_PALETTE,
      appBar: getAppBar(),
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Flex(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  direction: Axis.vertical,
                  children: <Widget>[
                    Text(WELCOME, style: STYLE_WELCOME),
                    Text(INTRO, style: STYLE_INTRO),
                  ],
                )),
            SizedBox(height: 20),
            Flex(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              direction: Axis.horizontal,
              children: <Widget>[
                IconItem('Calm'),
                IconItem('Relax'),
                IconItem('Rest'),
                IconItem('Zen')
              ],
            ),
            SizedBox(height: 20),
            CardPlayList(
                'Meditation 101', "Train your mind for mental fitness"),
            CardPlayList(
                'Meditation', 'Love and relationships, dating and mating'),
            CardPlayList(
                'Sleep stories', "The story of the Wind in the Willows"),
            CardPlayList('Creativity', 'Harness creativity and accept change'),
            CardPlayList(
                'Meditation 101', "Train your mind for mental fitness"),
            CardPlayList(
                'Meditation', 'Love and relationships, dating and mating'),
          ],
        ),
      )),
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
