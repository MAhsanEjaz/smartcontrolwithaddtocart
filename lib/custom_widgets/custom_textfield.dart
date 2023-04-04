import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomTextField extends StatefulWidget {
  String? text;
  IconData? iconData;
  TextEditingController? controller;
  Function()? onTap;

  CustomTextField({this.text, this.iconData, this.onTap,this.controller});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Neumorphic(
        style: NeumorphicStyle(
            depth: NeumorphicTheme.embossDepth(context),
            shadowLightColor: Colors.white,
            shadowDarkColorEmboss: Colors.black54,
            shadowLightColorEmboss: Colors.white,
            shadowDarkColor: Colors.black54,
            color: NeumorphicColors.background),
        child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
              suffixIcon: widget.iconData == null
                  ? null
                  : InkWell(
                      onTap: (widget.onTap),
                      child: Neumorphic(
                          child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(widget.iconData),
                      )),
                    ),
              border: InputBorder.none,
              hintText: widget.text,
              contentPadding: widget.iconData == null
                  ? EdgeInsets.only(left: 20)
                  : EdgeInsets.only(left: 20, top: 16)),
        ),
      ),
    );
  }
}
