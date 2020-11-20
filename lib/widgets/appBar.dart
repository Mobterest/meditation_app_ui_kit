import 'package:flutter/material.dart';
import '../global/config.dart';
import '../global/colors.dart';
import '../global/dimensions.dart';
import '../global/constants.dart';
import '../global/styles.dart';

getAppBar() {
  return AppBar(
    backgroundColor: WHITE_PALETTE,
    leading: IconButton(
        icon: Icon(
          Icons.clear_all,
          color: DBLUE,
        ),
        onPressed: null),
    title: Image.asset(
      APP_ICON,
      width: APP_ICON_DIM,
      height: APP_ICON_DIM,
    ),
    centerTitle: true,
    actions: <Widget>[
      Padding(
          padding: DIM_APP_PAD,
          child: CircleAvatar(
            backgroundColor: DBLUE,
            child: Text(
              INITIALS,
              style: STYLE_INITIALS,
            ),
          ))
    ],
    bottomOpacity: 0.0,
    elevation: 0.0,
  );
}
