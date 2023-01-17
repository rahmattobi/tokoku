import 'package:get/get.dart';
import 'package:tokoku/bindings/auth_b.dart';
import 'package:tokoku/bindings/product_b.dart';
import 'package:tokoku/bindings/riwayat_b.dart';
import 'package:tokoku/pages/edit_produk.dart';
import 'package:tokoku/pages/riwayat_page.dart';
import '../bindings/cart_b.dart';
import 'package:tokoku/main_page.dart';
import 'package:tokoku/pages/login_page.dart';
import 'package:tokoku/pages/register_page.dart';
import '../bindings/mainpage_b.dart';
import '../pages/cart_page.dart';
import '../pages/home_page.dart';
import '../pages/produk_page.dart';
import '../pages/profile_page.dart';
import '../routes/route_name.dart';

class RoutePage {
  static final page = [
    GetPage(
      name: RouteNames.mainPage,
      page: () => const MainPage(),
      bindings: [
        ProductB(),
        MainPageB(),
        CartB(),
        AuthB(),
        RiwayatB(),
      ],
    ),
    GetPage(name: RouteNames.homePage, page: () => const HomePage(), bindings: [
      ProductB(),
      MainPageB(),
      CartB(),
      AuthB(),
      RiwayatB(),
    ]),
    GetPage(name: RouteNames.productPage, page: () => ProductPage(), bindings: [
      ProductB(),
      MainPageB(),
      CartB(),
      AuthB(),
      RiwayatB(),
    ]),
    GetPage(name: RouteNames.cartPage, page: () => const CartPage(), bindings: [
      ProductB(),
      MainPageB(),
      CartB(),
      AuthB(),
      RiwayatB(),
    ]),
    GetPage(
        name: RouteNames.editProductPage,
        page: () => const EditProduct(),
        bindings: [
          ProductB(),
          MainPageB(),
          CartB(),
          AuthB(),
          RiwayatB(),
        ]),
    GetPage(
        name: RouteNames.loginPage,
        page: () => const LoginPage(),
        bindings: [
          ProductB(),
          MainPageB(),
          CartB(),
          AuthB(),
          RiwayatB(),
        ]),
    GetPage(
        name: RouteNames.profilePage,
        page: () => const ProfilePage(),
        bindings: [
          ProductB(),
          MainPageB(),
          CartB(),
          AuthB(),
          RiwayatB(),
        ]),
    GetPage(
        name: RouteNames.registerPage,
        page: () => const RegisterPage(),
        bindings: [
          ProductB(),
          MainPageB(),
          CartB(),
          AuthB(),
          RiwayatB(),
        ]),
    GetPage(
        name: RouteNames.riwayatPage,
        page: () => const RiwayatPage(),
        bindings: [
          ProductB(),
          MainPageB(),
          CartB(),
          AuthB(),
          RiwayatB(),
        ]),
  ];
}
