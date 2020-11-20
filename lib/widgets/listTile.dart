import 'package:flutter/material.dart';
import '../global/constants.dart';
import '../global/styles.dart';
import '../global/colors.dart';
import '../pages/player.dart';

class Tile extends StatefulWidget {
  final String title;
  final String desc;
  final String duration;

  Tile(this.title, this.desc, this.duration);
  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Player(widget.title, widget.desc)),
                        );
      },
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: LBLUE,
          borderRadius: BorderRadius.circular(10)),
      ),
      title: Text(widget.title,
          style: TextStyle(
              fontSize: 16, color: DBLUE, fontWeight: FontWeight.w600)),
      subtitle: Text(widget.desc, style: TextStyle(fontSize: 12, color: MBLUE)),
      trailing: Text(widget.duration, style: STYLE_SOUND_DURATION),
    );
  }
}
