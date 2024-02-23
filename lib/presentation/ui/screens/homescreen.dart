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
          IconButton(
            icon: Obx(() => customerController.isGridView.value
                ? Icon(Icons.list)
                : Icon(Icons.grid_on)),
            onPressed: () {
              // Toggle between ListView and GridView
              customerController.toggleViewMode();
            },
          ),
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
        child: Obx(() => customerController.isGridView.value
            ? PagedGridView<int, Customer>(
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
                            customer.imagePath != null
                                ? Center(
                                    child: Image.network(
                                      'https://www.pqstec.com/InvoiceApps/${customer.imagePath}',
                                      height: 130,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        // This widget will be displayed when the image fails to load
                                        return const Center(
                                          child: Icon(
                                            Icons.image,
                                            size: 130,
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : const Center(
                                    child: Icon(
                                      Icons.image,
                                      size: 130,
                                    ),
                                  ),
                            Text(
                              customer.name,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
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
              )
            : PagedListView<int, Customer>(
                pagingController: customerController.pagingController,
                builderDelegate: PagedChildBuilderDelegate<Customer>(
                  itemBuilder: (context, customer, index) {
                    return ListTile(
                      onTap: () {
                        Get.to(() => CustomerDetailsScreen(customer: customer));
                      },
                      leading: customer.imagePath != null
                          ? Image.network(
                              'https://www.pqstec.com/InvoiceApps/${customer.imagePath}',
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                // This widget will be displayed when the image fails to load
                                return const Icon(
                                  Icons.image,
                                  size: 50,
                                );
                              },
                            )
                          : const Icon(
                              Icons.image,
                              size: 50,
                            ),
                      title: Text(customer.name),
                      subtitle: Text('Phone: ${customer.phone ?? 'N/A'}'),
                    );
                  },
                ),
              )),
      ),
    );
  }
}
