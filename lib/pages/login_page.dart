import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tokoku/controllers/auth_c.dart';
import 'package:tokoku/routes/route_name.dart';
import 'package:tokoku/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidden = true;

  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return SizedBox(
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Lottie.asset(
              'assets/logo.json',
              height: 180,
            ),
            Text(
              'Tokoku',
              style: primTextstyle.copyWith(
                fontSize: 25,
                fontWeight: bold,
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Welcome Back',
                  style: titleColorTextstyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Tokoku merupakan sebuah aplikasi pengelola barang dan penjualan di sebuah toko harian',
                  style: subTitleColorTextstyle,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/ic_user.png',
                          width: 24,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: authC.emailC,
                            style: titleColorTextstyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              return authC.validatedEmail(value!);
                            },
                            onSaved: (newValue) {
                              authC.emailC!.text = newValue!;
                            },
                            decoration: InputDecoration.collapsed(
                              hintText: 'Email',
                              hintStyle: subTitleColorTextstyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/ic_pass.png',
                          width: 24,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: authC.passC,
                            obscureText: _isHidden,
                            enableSuggestions: false,
                            autocorrect: false,
                            style: titleColorTextstyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Password',
                              border: InputBorder.none,
                              hintStyle: subTitleColorTextstyle.copyWith(
                                fontSize: 16,
                              ),
                              suffix: InkWell(
                                onTap: _togglePasswordView,
                                child: Icon(
                                  _isHidden
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (authC.emailC!.text != '' && authC.passC!.text != '') {
                        authC.login(authC.emailC!.text, authC.passC!.text);
                      } else {
                        Get.snackbar(
                          "Error",
                          "Semua Data Harus Terisi",
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    },
                    child: Center(
                      child: Text(
                        'SIGN IN',
                        style: subTitleColorTextstyle.copyWith(
                          fontWeight: bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(
          bottom: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don’t have an account?',
              style: subTitleColorTextstyle.copyWith(fontSize: 16),
            ),
            const SizedBox(
              width: 3,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteNames.registerPage);
              },
              child: Text(
                ' SIGN UP',
                style: primTextstyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          header(),
          Expanded(
            child: content(),
          ),
          footer(),
        ],
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
