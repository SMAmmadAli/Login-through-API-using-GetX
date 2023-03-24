import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class LoginController extends GetxController {
  final email = TextEditingController().obs;
  final password = TextEditingController().obs;

  RxBool loading = false.obs;

  loginApi() async {
    loading.value = true;
    try {
      final response =
          await post(Uri.parse('https://reqres.in/api/login'), body: {
        "email": email.value.text,
        "password": password.value.text,
      });
      var data = jsonDecode(response.body);
      print(data);
      print(response.statusCode);

      if (response.statusCode == 200) {
        loading.value = false;
        Get.snackbar("Login Successfull", "congratulation");
      } else {
        loading.value = false;
        Get.snackbar("Login Failed", 'Sorry!');
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar("Exception", e.toString());
    }
  }
}
