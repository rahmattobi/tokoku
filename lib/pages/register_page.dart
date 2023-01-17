import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tokoku/theme.dart';

import '../controllers/auth_c.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isHidden = true;
  var authC = Get.find<AuthController>();
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
            key: authC.registKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Create your account',
                    style: titleColorTextstyle.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
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
                          child: TextField(
                            controller: authC.nameC,
                            style: titleColorTextstyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                            decoration: InputDecoration.collapsed(
                              hintText: 'Name',
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
                          'assets/ic_email.png',
                          width: 24,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: authC.emailC,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              return authC.validatedEmail(value!);
                            },
                            onSaved: (newValue) {
                              authC.emailC!.text = newValue!;
                            },
                            style: titleColorTextstyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                            decoration: InputDecoration.collapsed(
                              hintText: 'Email',
                              hintStyle: subTitleColorTextstyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
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
                          child: TextField(
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
                      if (authC.nameC!.text != '' &&
                          authC.emailC!.text != '' &&
                          authC.passC!.text != '') {
                        authC.checkRegister();
                        authC.register(
                          authC.nameC!.text,
                          authC.emailC!.text,
                          authC.passC!.text,
                        );
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
                        'SIGN UP',
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
              'Already have account?',
              style: subTitleColorTextstyle.copyWith(fontSize: 16),
            ),
            const SizedBox(
              width: 3,
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Text(
                'Login',
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
