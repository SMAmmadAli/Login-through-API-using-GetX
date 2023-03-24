import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:login_signup_api_with_getx/controller/login_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login through API using GetX"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: loginController.email.value,
              decoration: const InputDecoration(hintText: "Email"),
            ),
            TextFormField(
              controller: loginController.password.value,
              decoration: const InputDecoration(hintText: "password"),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                loginController.loginApi();
              },
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width * 0.8,
                color: Colors.grey,
                child: const Center(
                    child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
