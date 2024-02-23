import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController =
      TextEditingController(text: 'admin@gmail.com');
  final TextEditingController passwordController =
      TextEditingController(text: 'admin1234');
  final LoginController loginController = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller) {
              return Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Welcome to the application',
                      style: TextStyle(color: Colors.black, fontSize: 40),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Login',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.visibility),
                          onPressed: () {
                            // Toggle password visibility
                            loginController.obscureText();
                          },
                        ),
                      ),
                      obscureText: loginController.obscure,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : () {
                              controller.login(
                                emailController.text,
                                passwordController.text,
                              );
                            },
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : const Text('Login'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
