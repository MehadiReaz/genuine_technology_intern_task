import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../data/models/user_profile.dart';
import 'auth_controller.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  final formKey = GlobalKey<FormState>();

  void login(String email, String password) async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      try {
        final response = await Dio().get(
          'https://www.pqstec.com/InvoiceApps/Values/LogIn',
          queryParameters: {
            'UserName': email,
            'Password': password,
            'ComId': '1',
          },
        );

        if (response.statusCode == 200) {
          final userProfile = UserProfile.fromJson(response.data);
          AuthController.setAccessToken(userProfile.token!);
          await AuthController.setProfile(userProfile); // Set the user profile

          Get.offAndToNamed('/customerlist');
          Get.snackbar('Success', 'Logged in successfully');
        } else {
          Get.snackbar('Error', 'Failed to log in');
        }
      } catch (e) {
        Get.snackbar('Error', 'An error occurred');
      } finally {
        isLoading.value = false;
      }
    }
  }
}
