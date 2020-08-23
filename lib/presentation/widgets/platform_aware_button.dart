import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app_ui_challenge/presentation/constants/dimensions.dart';

// configured to Chrome web - the original specifies Platform.isAndroid
// and Platform.isIOS
// TODO: How to select platform web?

class PlatformAwareButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  PlatformAwareButton({this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    final Widget textWidget = Text(
      text,
      style: Theme.of(context).textTheme.button,
    );
    //if (Platform.isIOS) {
    //  CupertinoButton(
    //    padding: EdgeInsets.all(
    //      kButtonInsidePadding,
    //    ),
    //    child: textWidget,
    //    onPressed: onPressed,
    // Since we are using a Material App, it does not
    // get the correct theme
    //    color: Theme.of(context).primaryColor,
    //  );

    return RaisedButton(
      padding: EdgeInsets.all(
        kButtonInsidePadding,
      ),
      child: textWidget,
      onPressed: onPressed,
    );
  }
}