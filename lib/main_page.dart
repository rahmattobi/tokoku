import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokoku/controllers/mainpage_c.dart';
import 'package:tokoku/pages/cart_page.dart';
import 'package:tokoku/pages/home_page.dart';
import 'package:tokoku/pages/produk_page.dart';
import 'package:tokoku/pages/profile_page.dart';
import 'package:tokoku/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final bottomC = Get.find<MainPageC>();
  final pages = [
    const HomePage(),
    ProductPage(),
    const CartPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Obx(
        () => IndexedStack(
          index: bottomC.tabIndex.value,
          children: pages,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Obx(
          () => DotNavigationBar(
            margin: const EdgeInsets.only(left: 10, right: 10),
            currentIndex: bottomC.tabIndex.value,
            dotIndicatorColor: Colors.white,
            unselectedItemColor: Colors.grey[400],
            // enableFloatingNavBar: false,
            onTap: (index) {
              bottomC.changeTabIndex(index);
            },
            items: [
              /// Home
              DotNavigationBarItem(
                icon: const Icon(Icons.home),
                selectedColor: primaryColor,
              ),

              /// Likes
              DotNavigationBarItem(
                icon: const Icon(Icons.add_business),
                selectedColor: primaryColor,
              ),

              DotNavigationBarItem(
                icon: const Icon(Icons.shopping_cart_outlined),
                selectedColor: primaryColor,
              ),

              /// Profile
              DotNavigationBarItem(
                icon: const Icon(Icons.person),
                selectedColor: primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
