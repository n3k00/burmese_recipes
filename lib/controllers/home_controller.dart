import 'dart:async';

import 'package:burmese_recipes/models/models/recipes_model_agent.dart';
import 'package:burmese_recipes/models/vos/recipes_vo.dart';
import 'package:burmese_recipes/views/pages/detail_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  RxBool isSearch = false.obs;
  RxString searchString = ''.obs;

  /// Detail Page
  var box = GetStorage("recipes");
  RxBool isFavorite = false.obs;
  var favList = <RecipesVO>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchFavoriteList();
  }

  void changeSearch() {
    isSearch.value = !isSearch.value;
    searchString.value = '';
  }

  void toSearch(String search) {
    print(search);
    searchString.value = search;
  }

  void toDetail(RecipesVO recipe) {
    Get.to(() => DetailPage(), arguments: [recipe]);
  }

  /// Detail Page
  void checkFavorite(RecipesVO recipe) async {
    List<RecipesVO> favoritesList = await box.read("favorite");
    isFavorite.value = favoritesList.contains(recipe) ?? false;
  }

  void toggleFavorite(RecipesVO recipe) {
    List<RecipesVO> favoritesList = box.read("favorite") ?? [];
    if (favoritesList.contains(recipe)) {
      favoritesList.remove(recipe);
    } else {
      favoritesList.add(recipe);
    }
    box.write("favorite", favoritesList);
    isFavorite.value = favoritesList.contains(recipe);
    fetchFavoriteList();
  }

  void fetchFavoriteList() {
    RecipesModelAgent().getFavoriteList().then((list) {
      favList.assignAll(list);
    });
  }
}
