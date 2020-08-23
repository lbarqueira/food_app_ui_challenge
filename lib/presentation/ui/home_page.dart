import 'package:flutter/material.dart';
import 'package:food_app_ui_challenge/models/recipee.dart';
import 'package:food_app_ui_challenge/presentation/constants/dimensions.dart';
import 'package:food_app_ui_challenge/presentation/ui/detail_page.dart';
import 'package:food_app_ui_challenge/presentation/widgets/header_widget.dart';
import 'package:food_app_ui_challenge/presentation/widgets/user_icon.dart';
import 'package:food_app_ui_challenge/repositories/recipee_repository.dart';

class HomePage extends StatefulWidget {
  final RecipeeRepository recipeeRepository;

  HomePage({this.recipeeRepository});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          UserIcon(), // should receive a color compatible with background
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: kMarginScreen,
              right: kMarginScreen,
              top: kMarginText,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(
                  title: "Good ",
                  subtitle: "${_getGreeting()}!",
                  color: Colors.black,
                ),
                const SizedBox(
                  height: kMarginText,
                ),
                ChipSearchBar(),
                const SizedBox(
                  height: kMarginItems,
                ),
                RecipeGrid(
                  children: widget.recipeeRepository
                      .getSpecialRecipees()
                      .map(
                        (recipe) => RecipeImage(
                          recipe: recipe,
                          onClicked: (recipe, context) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RecipeDetailpage(recipe: recipe),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(
                  height: kMarginItems,
                ),
              ],
            ),
          ),
          Recommendations(
            children: widget.recipeeRepository
                .getRecommendations()
                .map(
                  (recipe) => RecipeImage(
                    recipe: recipe,
                    onClicked: (recipe, context) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailpage(recipe: recipe),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  String _getGreeting() {
    var time = DateTime.now();
    if (time.hour > 3 && time.hour < 12) {
      return "morning";
    } else if (time.hour < 18) {
      return "evening";
    } else {
      return "night";
    }
  }
}

class ChipSearchBar extends StatefulWidget {
  @override
  _ChipSearchBarState createState() => _ChipSearchBarState();
}

class _ChipSearchBarState extends State<ChipSearchBar> {
  final List<CookChip> _selectedWidgets = [];
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: [
        TextFormField(
          textInputAction: TextInputAction.done,
          controller: _textController,
          focusNode: _focusNode,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.search),
          ),
          onFieldSubmitted: (value) {
            _selectedWidgets.add(
              CookChip(
                text: value,
                onDeleted: () => setState(
                  () {
                    removeChipWithValue(value);
                  },
                ),
              ),
            );
            _textController.clear();
            setState(() {});
            _focusNode.requestFocus();
          },
        ),
        ..._selectedWidgets,
      ],
    );
  }

  void removeChipWithValue(String value) {
    for (var cookchip in _selectedWidgets) {
      if (cookchip.text == value) {
        _selectedWidgets.remove(cookchip);
        break;
      }
    }
  }
}

class CookChip extends StatelessWidget {
  final String text;
  final Function onDeleted;

  CookChip({this.text, this.onDeleted});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(text),
      deleteIcon: Icon(
        Icons.clear,
        size: kIconSize,
      ),
      onDeleted: onDeleted,
    );
  }
}

class RecipeGrid extends StatelessWidget {
  final List<Widget> children;

  RecipeGrid({this.children});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        final size = constraint.biggest;
        final smallBoxSize = (size.width - 2 * kMarginSmall) / 3;
        final bigBoxSize = smallBoxSize * 2 + kMarginSmall;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      width: smallBoxSize,
                      height: smallBoxSize,
                      child: children[0],
                    ),
                    const SizedBox(
                      height: kMarginSmall,
                    ),
                    SizedBox(
                      width: smallBoxSize,
                      height: smallBoxSize,
                      child: children[1],
                    ),
                  ],
                ),
                const SizedBox(
                  width: kMarginSmall,
                ),
                SizedBox(
                  width: bigBoxSize,
                  height: bigBoxSize,
                  child: children[2],
                ),
              ],
            ),
            const SizedBox(
              height: kMarginSmall,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: smallBoxSize,
                  height: smallBoxSize,
                  child: children[3],
                ),
                const SizedBox(
                  width: kMarginSmall,
                ),
                SizedBox(
                  width: smallBoxSize,
                  height: smallBoxSize,
                  child: children[4],
                ),
                const SizedBox(
                  width: kMarginSmall,
                ),
                SizedBox(
                  width: smallBoxSize,
                  height: smallBoxSize,
                  child: children[5],
                ),
              ],
            )
          ],
        );
      },
    );
  }
}

class Recommendations extends StatelessWidget {
  final List<Widget> children;

  Recommendations({this.children});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme.headline2.copyWith(
          fontWeight: FontWeight.w300,
        );
    final itemSize = MediaQuery.of(context).size.width / 3;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: kMarginScreen,
            bottom: kMarginSmall,
          ),
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              style: theme,
              children: <TextSpan>[
                TextSpan(text: "Your special\n"),
                TextSpan(
                  text: "recommendations",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: itemSize,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: kMarginScreen),
              ...children
                  .map(
                    (recipe) => Container(
                      child: recipe,
                      margin: EdgeInsets.only(right: kMarginSmall),
                    ),
                  )
                  .toList()
            ],
          ),
        ),
      ],
    );
  }
}

// recipe_image.dart

const radius = 16.0;

class RecipeImage extends StatelessWidget {
  final Recipe recipe;
  final Function(Recipe, BuildContext) onClicked;

  RecipeImage({this.recipe, this.onClicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked != null ? () => onClicked(recipe, context) : null,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        child: Image.asset(
          recipe.assetName,
        ),
      ),
    );
  }
}
