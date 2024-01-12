import 'package:burmese_recipes/controllers/home_controller.dart';
import 'package:burmese_recipes/models/models/recipes_model_agent.dart';
import 'package:burmese_recipes/models/vos/recipes_vo.dart';
import 'package:burmese_recipes/resources/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: MARGIN_MEDIUM_2,
      ),
      child: Column(
        children: [
          Obx(() => controller.isSearch.value ? buildSearch() : buildHeader()),
          SizedBox(height: MARGIN_MEDIUM_2),
          Expanded(
            child: Obx(() {
              return FutureBuilder<List<RecipesVO>>(
                future: controller.isSearch.value
                    ? RecipesModelAgent()
                        .searchRecipesList(controller.searchString.value)
                    : RecipesModelAgent().getRecipesList(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<RecipesVO>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        RecipesVO recipe = snapshot.data![index];
                        return GestureDetector(
                          onTap: () {
                            controller.toDetail(recipe);
                          },
                          child: ListTile(
                            title: Text(
                              recipe.name,
                              style: TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                            trailing: Icon(Icons.chevron_right),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget buildSearch() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: TextField(
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: MARGIN_CARD_MEDIUM_2),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              hintText: 'Search Recipes...',
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.white70, width: 1.5),
              ),
            ),
            onChanged: controller.toSearch,
          )),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: controller.changeSearch,
          ),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "မြန်မာဟင်းချက်နည်းများ",
            style: TextStyle(fontSize: TEXT_REGULAR_3X),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: controller.changeSearch,
          ),
        ],
      ),
    );
  }
}
