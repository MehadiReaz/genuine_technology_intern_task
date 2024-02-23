import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../data/models/customer.dart';
import '../controllers/auth_controller.dart';
import '../controllers/customer_controller.dart';
import '../widgets/grid_view_tile.dart';
import '../widgets/list_view_tile.dart';

class HomeScreen extends StatelessWidget {
  final customerController = Get.put(CustomerController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() => customerController.isGridView.value
            ? buildPagedGridView()
            : buildPagedListView()),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text(
        'Customer List',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        buildToggleViewButton(),
        buildPopupMenuButton(),
      ],
    );
  }

  Widget buildToggleViewButton() {
    return IconButton(
      icon: Obx(() => customerController.isGridView.value
          ? const Icon(Icons.list, color: Colors.black)
          : const Icon(Icons.grid_on, color: Colors.black)),
      onPressed: () {
        customerController.toggleViewMode();
      },
    );
  }

  PopupMenuButton<String> buildPopupMenuButton() {
    return PopupMenuButton<String>(
      iconColor: Colors.black,
      onSelected: (value) {
        handlePopupMenuSelection(value);
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
    );
  }

  Widget buildPagedGridView() {
    return PagedGridView<int, Customer>(
      pagingController: customerController.pagingController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      builderDelegate: PagedChildBuilderDelegate<Customer>(
        itemBuilder: (context, customer, index) {
          return GridViewTile(customer: customer);
        },
      ),
    );
  }

  Widget buildPagedListView() {
    return PagedListView<int, Customer>(
      pagingController: customerController.pagingController,
      builderDelegate: PagedChildBuilderDelegate<Customer>(
        itemBuilder: (context, customer, index) {
          return ListViewTile(customer: customer);
        },
      ),
    );
  }

  void handlePopupMenuSelection(String value) {
    if (value == 'Profile') {
      Get.toNamed('/profile');
    } else if (value == 'Logout') {
      AuthController.clear();
      Get.offAllNamed('/login');
    } else if (value == 'Exit') {
      SystemNavigator.pop();
    }
  }
}
