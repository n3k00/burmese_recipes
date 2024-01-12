import 'package:burmese_recipes/controllers/home_controller.dart';
import 'package:burmese_recipes/models/models/recipes_model_agent.dart';
import 'package:burmese_recipes/models/vos/recipes_vo.dart';
import 'package:burmese_recipes/resources/dimens.dart';
import 'package:burmese_recipes/views/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: MARGIN_MEDIUM_2,
      ),
      child: Column(
        children: [
          buildHeader(),
          SizedBox(height: MARGIN_MEDIUM_2),
          Obx(() {
            if (controller.favList.isNotEmpty) {
              return Expanded(
                child: ListView.separated(
                  itemCount: controller.favList.length,
                  itemBuilder: (context, index) {
                    RecipesVO recipe = controller.favList[index];
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
                ),
              );
            } else {
              return Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Center(
                  child: Text("သိမ်းထားသောဟင်းချက်နည်းများ မရှိပါ။"),
                ),
              );
            }
          }),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: Text(
        "သိမ်းထားသောဟင်းချက်နည်းများ",
        style: TextStyle(fontSize: TEXT_REGULAR_3X),
      ),
    );
  }
}
