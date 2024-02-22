import 'package:flutter/material.dart';
import '../../../data/models/customer.dart';

class CustomerDetailsScreen extends StatelessWidget {
  final Customer customer;

  const CustomerDetailsScreen({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: customer.imagePath != null
                  ? NetworkImage(
                      'https://www.pqstec.com/InvoiceApps/${customer.imagePath}')
                  : null,
              child: customer.imagePath == null
                  ? const Icon(
                      Icons.image,
                      size: 60,
                    )
                  : null,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              controller: TextEditingController(text: customer.name),
              readOnly: true,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              controller: TextEditingController(text: customer.email),
              readOnly: true,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Phone',
              ),
              controller: TextEditingController(text: customer.phone),
              readOnly: true,
            ),
            // Add other fields as needed
          ],
        ),
      ),
    );
  }
}
