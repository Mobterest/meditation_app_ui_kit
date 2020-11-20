import 'package:flutter/material.dart';
import '../global/colors.dart';
import '../global/constants.dart';
import '../global/styles.dart';
import '../pages/playlist.dart';

class IconItem extends StatefulWidget {
  final String name;

  IconItem(this.name);
  @override
  _IconItemState createState() => _IconItemState();
}

class _IconItemState extends State<IconItem> {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Container(
          child: IconButton(
            icon: Icon(
              Icons.adjust,
              color: LBLUE,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Playlist(widget.name)),
              );
            },
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: DBLUE),
        ),
        SizedBox(height: 10),
        Text(widget.name, style: STYLE_MENUITEM)
      ],
    );
  }
}
