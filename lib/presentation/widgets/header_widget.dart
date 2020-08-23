import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;

  const HeaderWidget({
    this.title,
    this.subtitle,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: Theme.of(context).textTheme.headline1.copyWith(
                  fontWeight: FontWeight.w300,
                  color: color,
                ),
          ),
          TextSpan(
            text: subtitle,
            style: Theme.of(context).textTheme.headline1.copyWith(
                  color: color,
                ),
          ),
        ],
      ),
    );
  }
}
