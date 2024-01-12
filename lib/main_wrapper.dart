import 'package:burmese_recipes/controllers/main_wrapper_controller.dart';
import 'package:burmese_recipes/views/pages/favorite_page.dart';
import 'package:burmese_recipes/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MainWrapper extends StatelessWidget {
  final MainWrapperController controller = Get.put(MainWrapperController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          physics: BouncingScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: controller.animatedToTab,
          children: [
            HomePage(),
            FavoritePage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        notchMargin: 10,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buttonAppBarItem(
                  icon: Icons.home,
                  page: 0,
                  label: "Home",
                ),
                _buttonAppBarItem(
                  icon: Icons.bookmark_outline,
                  page: 1,
                  label: "Favorite",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ZoomTapAnimation _buttonAppBarItem(
      {required icon, required page, required label}) {
    return ZoomTapAnimation(
      onTap: () => controller.goToTab(page),
      child: Column(
        children: [
          Icon(
            icon,
            color: controller.currentPage.value == page
                ? Colors.green
                : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              fontWeight:
                  controller.currentPage.value == page ? FontWeight.w600 : null,
            ),
          ),
        ],
      ),
    );
  }
}
