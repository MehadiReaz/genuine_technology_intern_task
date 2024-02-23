import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/customer.dart';
import '../screens/customer_details_screen.dart';

class ListViewTile extends StatelessWidget {
  final Customer customer;

  const ListViewTile({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Add elevation for a shadow effect
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        onTap: () {
          Get.to(() => CustomerDetailsScreen(customer: customer));
        },
        leading: buildCustomerImage(),
        title: Text(
          customer.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Phone: ${customer.phone ?? 'N/A'}',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget buildCustomerImage() {
    return customer.imagePath != null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://www.pqstec.com/InvoiceApps/${customer.imagePath}',
              height: 50,
              width: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.image,
                  size: 50,
                );
              },
            ),
          )
        : Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.image,
              size: 50,
            ),
          );
  }
}
