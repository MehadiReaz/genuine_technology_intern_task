import 'package:flutter/material.dart';
import '../../../../data/models/user_profile.dart';
import '../../controllers/auth_controller.dart';

class ProfileScreen extends StatelessWidget {
  final UserProfile userProfile = AuthController.userProfile!;

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: userProfile.empImagePath.isNotEmpty
                  ? NetworkImage(
                      'https://www.pqstec.com/InvoiceApps/${userProfile.empImagePath}')
                  : null,
              child: userProfile.empImagePath.isEmpty
                  ? const Icon(
                      Icons.image,
                      size: 60,
                    )
                  : null,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
              controller: TextEditingController(text: userProfile.userName),
              readOnly: true,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              controller: TextEditingController(text: userProfile.email),
              readOnly: true,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Company Name',
              ),
              controller: TextEditingController(text: userProfile.companyName),
              readOnly: true,
            ),
            // Add other fields as needed
          ],
        ),
      ),
    );
  }
}
