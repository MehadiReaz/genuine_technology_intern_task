import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/user_profile.dart';
import '../../controllers/auth_controller.dart';

class ProfileScreen extends StatelessWidget {
  final UserProfile? userProfile = AuthController.userProfile;

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Profile',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: userProfile != null
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: userProfile!.empImagePath.isNotEmpty
                          ? NetworkImage(
                              'https://www.pqstec.com/InvoiceApps/${userProfile?.empImagePath}')
                          : null,
                      child: userProfile!.empImagePath.isEmpty
                          ? const Icon(
                              Icons.image,
                              size: 60,
                            )
                          : null,
                    ),
                    const SizedBox(height: 20),
                    textField('User Name', userProfile?.userName),
                    textField('Email', userProfile?.email),
                    textField('Company Name', userProfile?.companyName),
                    textField('Role Name', userProfile?.roleName),
                  ],
                ),
              )
            : Center(
                child: ElevatedButton(
                    onPressed: () {
                      AuthController.clear();
                      Get.offAllNamed('/login');
                    },
                    child: const Text(
                        ' Something went wrong please login again ')),
              ));
  }

  Padding textField(String labelText, controllerText) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
        ),
        controller: TextEditingController(text: controllerText),
        readOnly: true,
      ),
    );
  }
}
