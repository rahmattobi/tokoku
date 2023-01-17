import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokoku/routes/route_name.dart';
import 'package:tokoku/routes/route_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.loginPage,
      getPages: RoutePage.page,
    );
  }
}
