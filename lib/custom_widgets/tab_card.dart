import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TabCard extends StatefulWidget {
  IconData? iconData;
  bool Color;

  Function()? onTap;

  TabCard({this.iconData, required this.Color, this.onTap});

  @override
  _TabCardState createState() => _TabCardState();
}

class _TabCardState extends State<TabCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (widget.onTap),
      child: Neumorphic(
        style: NeumorphicStyle(
            depth: NeumorphicTheme.embossDepth(context),
            shadowLightColor: widget.Color ? Colors.white : Colors.transparent,
            shadowDarkColorEmboss:
                widget.Color ? Colors.black54 : Colors.transparent,
            shadowLightColorEmboss:
                widget.Color ? Colors.white : Colors.transparent,
            shadowDarkColor: widget.Color ? Colors.black54 : Colors.transparent,
            color: NeumorphicColors.background),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Icon(
            widget.iconData,
            color: widget.Color ? Colors.pinkAccent : Colors.black,
          ),
        ),
      ),
    );
  }
}
