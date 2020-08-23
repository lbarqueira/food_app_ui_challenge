import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app_ui_challenge/presentation/constants/dimensions.dart';
import 'package:food_app_ui_challenge/presentation/constants/images.dart';
import 'package:food_app_ui_challenge/presentation/ui/home_page.dart';
import 'package:food_app_ui_challenge/presentation/widgets/header_widget.dart';
import 'package:food_app_ui_challenge/presentation/widgets/platform_aware_button.dart';
import 'package:food_app_ui_challenge/repositories/recipee_repository.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textDisplacement = size.height * 0.25;
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
    return Stack(
      fit: StackFit.expand,
      children:[
        Image.asset(
          kBackgroundImage,
          fit: BoxFit.fitHeight,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xB3000000),
                const Color(0x00000000),
              ],
            ),
          ),
        ),
        Positioned(
          left: kMarginScreen,
          top: textDisplacement,
          child: HeaderWidget(
            title: "Welcome\n",
            subtitle: "to cook book",
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(kMarginScreen),
              child: SafeArea(
                child: PlatformAwareButton(
                  text: "Start now",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          recipeeRepository: RecipeeRepository(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}


