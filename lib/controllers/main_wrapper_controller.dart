import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainWrapperController extends GetxController {
  late PageController pageController;
  RxInt currentPage = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  void animatedToTab(int page) {
    currentPage.value = page;
    pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    pageController.dispose();
  }

  void goToTab(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }
}
