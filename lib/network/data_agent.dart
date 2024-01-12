import 'dart:convert';

import 'package:burmese_recipes/models/vos/recipes_vo.dart';
import 'package:flutter/services.dart';

class DataAgent {
  Future<List<RecipesVO>> getRecipesList() async {
    final jsonData =
        await rootBundle.loadString("assets/data/burmese_recipes.json");
    List<dynamic> responseData = jsonDecode(jsonData);
    List<RecipesVO> recipesList =
        responseData.map((item) => RecipesVO.fromJson(item)).toList();
    return recipesList;
  }
}
