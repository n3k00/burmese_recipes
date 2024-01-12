import 'package:burmese_recipes/main_wrapper.dart';
import 'package:burmese_recipes/models/models/recipes_model_agent.dart';
import 'package:burmese_recipes/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MainWrapper(),
    );
  }
}
