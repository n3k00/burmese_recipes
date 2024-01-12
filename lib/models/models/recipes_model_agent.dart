import 'package:burmese_recipes/models/vos/recipes_vo.dart';
import 'package:burmese_recipes/network/data_agent.dart';
import 'package:get_storage/get_storage.dart';

class RecipesModelAgent {
  DataAgent dataAgent = DataAgent();
  var box = GetStorage("recipes");
  Future<List<RecipesVO>> getRecipesList() {
    return dataAgent.getRecipesList();
  }

  Future<List<RecipesVO>> searchRecipesList(String search) {
    return dataAgent.getRecipesList().then((list) {
      List<RecipesVO> filterList =
          list.where((recipe) => recipe.name.contains(search)).toList();
      return filterList;
    });
  }

  Future<List<RecipesVO>> getFavoriteList() {
    List<RecipesVO> favoriteList = box.read("favorite") ?? [];
    return Future.value(favoriteList);
  }
}
