import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CashCard extends StatefulWidget {
  bool color;
  String? text;
  Function()? onTap;

  CashCard({this.text, required this.color, this.onTap});

  @override
  _CashCardState createState() => _CashCardState();
}

class _CashCardState extends State<CashCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (widget.onTap),
      child: Neumorphic(
        style: NeumorphicStyle(
            depth: widget.color ? NeumorphicTheme.embossDepth(context) : null,
            shadowLightColor: widget.color ? Colors.white : Colors.black45,
            shadowDarkColorEmboss:
                widget.color ? Colors.black54 : Colors.black26,
            shadowLightColorEmboss:
                widget.color ? Colors.white : Colors.black26,
            shadowDarkColor: widget.color ? Colors.black54 : Colors.black54,
            color: NeumorphicColors.background),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            widget.text!,
            style: TextStyle(
                color: widget.color ? Colors.pinkAccent : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}
