import 'package:burmese_recipes/controllers/home_controller.dart';
import 'package:burmese_recipes/models/vos/recipes_vo.dart';
import 'package:burmese_recipes/resources/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  final RecipesVO recipe = Get.arguments[0];
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    controller.checkFavorite(recipe);
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
        actions: [
          IconButton(
            icon: Obx(() => controller.isFavorite.value
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border)),
            onPressed: () {
              controller.toggleFavorite(recipe);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: MARGIN_CARD_MEDIUM_2,
            vertical: MARGIN_MEDIUM,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText("Ingredients"),
              SizedBox(height: MARGIN_MEDIUM),
              SubTitleText(recipe.ingredients),
              SizedBox(height: MARGIN_MEDIUM_2),
              Divider(),
              SizedBox(height: MARGIN_MEDIUM_2),
              TitleText("How to cook?"),
              SizedBox(height: MARGIN_MEDIUM),
              SubTitleText(recipe.cookingInstructions),
              SizedBox(height: MARGIN_MEDIUM_2),
              Divider(),
              SizedBox(height: MARGIN_XLARGE),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  final String title;
  TitleText(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: TEXT_HEADING_X1,
      ),
    );
  }
}

class SubTitleText extends StatelessWidget {
  final String subTitle;
  SubTitleText(this.subTitle);

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style: TextStyle(
        color: Colors.white60,
      ),
    );
  }
}
