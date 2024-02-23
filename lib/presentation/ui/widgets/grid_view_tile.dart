import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/customer.dart';
import '../screens/customer_details_screen.dart';

class GridViewTile extends StatelessWidget {
  final Customer customer;

  const GridViewTile({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => CustomerDetailsScreen(customer: customer));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 12),
            ),
            BoxShadow(
              color: Colors.grey.shade100,
              offset: const Offset(-12, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCustomerImage(context),
            buildCustomerDetails(),
          ],
        ),
      ),
    );
  }

  Widget buildCustomerImage(BuildContext context) {
    return customer.imagePath != null
        ? Center(
            child: Image.network(
              'https://www.pqstec.com/InvoiceApps/${customer.imagePath}',
              height: 110,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.image,
                    size: 110,
                  ),
                );
              },
            ),
          )
        : const Center(
            child: Icon(
              Icons.image,
              size: 110,
            ),
          );
  }

  Widget buildCustomerDetails() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            customer.name,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Phone: ${customer.phone ?? 'No Phone Available'}',
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
