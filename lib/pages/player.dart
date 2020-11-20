import 'package:flutter/material.dart';
import '../widgets/appBar.dart';
import '../global/config.dart';
import '../global/constants.dart';
import '../global/styles.dart';
import '../global/colors.dart';
import 'home.dart';
import 'playlist.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class Player extends StatefulWidget {
  final String title;
  final String by;

  Player(this.title, this.by);
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Playlist('Relax')),
        );
        break;
    }
  }

  bool playing = false;
  IconData playBtn = Icons.play_arrow;

  //let us create our music player
  AudioPlayer _player;
  AudioCache _cache;

  Duration position = new Duration();
  Duration musicLength = new Duration();

  //we will create a custom slider
  Widget slider() {
    return Slider.adaptive(
        activeColor: DBLUE,
        inactiveColor: LBLUE,
        value: position.inSeconds.toDouble(),
        max: musicLength.inSeconds.toDouble(),
        onChanged: (value) {
          seekToSec(value.toInt());
        });
  }

  //the seek Function allows us to go to a certain position of the music.
  void seekToSec(int sec) {
    Duration newPosition = new Duration(seconds: sec);
    _player.seek(newPosition);
  }

  //now let's initialize our player
  //just type init and enter- wow!
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player = AudioPlayer();
    _cache = AudioCache(fixedPlayer: _player);

    //let's handle the autoplayer time

    //displays the music length
    _player.durationHandler = (d) {
      setState(() {
        musicLength = d;
      });
    };

    //the function will allow us to move the cursor on the slider while playing
    _player.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };
  
    _cache.load(
        "fastandfurious.mp3"); //load the song to make the song fast. You do not need the full path because Audiocache automatically picks the cache
    //from the assets folder.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_PALETTE,
      appBar: getAppBar(),
      body: Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(BG_CONTAINER), fit: BoxFit.fill),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.title,
                      style: STYLE_PLAYER_TEXT,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(widget.by, style: STYLE_PLAYER_DESC)
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                              "${position.inMinutes}: ${position.inSeconds.remainder(60)}"),
                          slider(),
                          Text(
                              "${musicLength.inMinutes}: ${musicLength.inSeconds.remainder(60)}"),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.skip_previous),
                          onPressed: () {},
                          iconSize: 45.0,
                          color: MBLUE,
                        ),
                        IconButton(
                          icon: Icon(playBtn),
                          onPressed: () {
                            if (!playing) {
                              //now let's play the song
                              _cache.play("fastandfurious.mp3");
                              setState(() {
                                playBtn = Icons.pause;
                                playing = true;
                              });
                            } else {
                              _player.pause();
                              setState(() {
                                playBtn = Icons.play_arrow;
                                playing = false;
                              });
                            }
                          },
                          iconSize: 62.0,
                          color: DBLUE,
                        ),
                        IconButton(
                          icon: Icon(Icons.skip_next),
                          onPressed: () {},
                          iconSize: 45.0,
                          color: MBLUE,
                        )
                      ],
                    )
                  ],
                ),
                //Add the audio player here. Testing it separately first.
              ),
            ],
          ))),
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
