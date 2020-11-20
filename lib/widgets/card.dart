import 'package:flutter/material.dart';
import '../global/styles.dart';
import '../global/colors.dart';
import '../global/config.dart';
import '../global/dimensions.dart';
import '../pages/player.dart';

class CardPlayList extends StatefulWidget {
  final String title;
  final String desc;

  CardPlayList(this.title, this.desc);

  @override
  _CardPlayListState createState() => _CardPlayListState();
}

class _CardPlayListState extends State<CardPlayList> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: EdgeInsets.only(left: 10),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Flex(
                crossAxisAlignment: CrossAxisAlignment.start,
                direction: Axis.vertical,
                children: <Widget>[
                  Text(widget.title, style: STYLE_FEATURE_TEXT),
                  Text(widget.desc, style: STYLE_FEATURE_DESC),
                  SizedBox(height: 10),
                  RaisedButton.icon(
                      color: DBLUE,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Player(widget.title, widget.desc)),
                        );
                      },
                      icon: Icon(
                        Icons.play_arrow,
                        color: LBLUE,
                      ),
                      label: Text(
                        'Play now',
                        style: TextStyle(color: WHITE_PALETTE),
                      ))
                ],
              )),
          Image.asset(
            FEATURE,
            width: 100,
            height: 100,
          )
        ],
      ),
      decoration: BoxDecoration(borderRadius: containerBorder),
    ));
  }
}
