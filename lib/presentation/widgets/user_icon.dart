import 'package:flutter/material.dart';
import 'package:food_app_ui_challenge/presentation/constants/images.dart';

class UserIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      child: Stack(
        children:[
          Padding(
            padding: const EdgeInsets.only(
              top: 14.0,
              right: 14.0,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              child: Image.asset(
                kUserAvatarImage,
              ),
            ),
          ),
          Positioned(
            right: 0.1,
            top: 0.1,
            child: Container(
              decoration: BoxDecoration(

                shape: BoxShape.circle,
                color: Theme.of(context).accentColor,
              ),
              width: 12.0,
              height: 12.0,
            ),
          )
        ],
      ),
    );
  }
}