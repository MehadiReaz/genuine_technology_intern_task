import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_it_task/presentation/ui/screens/customer_details_screen.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../data/models/customer.dart';
import '../controllers/auth_controller.dart';
import '../controllers/customer_controller.dart';

class HomeScreen extends StatelessWidget {
  final customerController = Get.put(CustomerController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Customer List'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Profile') {
                Get.toNamed('/profile');
              } else if (value == 'Logout') {
                AuthController.clear();
                Get.offAllNamed('/login');
              } else if (value == 'Exit') {
                SystemNavigator.pop();
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'Profile',
                child: Text('Profile'),
              ),
              const PopupMenuItem<String>(
                value: 'Logout',
                child: Text('Logout'),
              ),
              const PopupMenuItem<String>(
                value: 'Exit',
                child: Text('Exit'),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PagedGridView<int, Customer>(
          pagingController: customerController.pagingController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          builderDelegate: PagedChildBuilderDelegate<Customer>(
            itemBuilder: (context, customer, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => CustomerDetailsScreen(customer: customer));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 5,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      ),
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(-5, 0),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (customer.imagePath != null)
                        Image.network(
                          'https://www.pqstec.com/InvoiceApps/${customer.imagePath}',
                          height: 130,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                      else
                        const Center(
                          child: Icon(
                            Icons.image,
                            size: 130,
                          ),
                        ),
                      Text(
                        customer.name,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Phone: ${customer.phone ?? 'No Phone Available'}',
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
