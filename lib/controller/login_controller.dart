import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class LoginController extends GetxController {
  final email = TextEditingController().obs;
  final password = TextEditingController().obs;

  loginApi() async {
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
        Get.snackbar("Login Successfull", data['error']);
      } else {
        Get.snackbar("Login Failed", data['error']);
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    }
  }
}
