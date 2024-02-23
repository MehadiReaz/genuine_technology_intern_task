import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../data/models/customer.dart';
import '../screens/customer_details_screen.dart';

class GridViewTile extends StatelessWidget {
  final Customer customer;

  const GridViewTile({
    super.key,
    required this.customer,
  });

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
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 6),
            ),
            BoxShadow(
              color: Colors.grey.shade100,
              offset: const Offset(-6, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
              child: buildCustomerImage(context),
            ),
            const Spacer(),
            SizedBox(
              height: 8.h,
              child: buildCustomerDetails(),
            ),
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
              fit: BoxFit.fitHeight,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Icon(
                    Icons.image,
                    size: 10.h,
                  ),
                );
              },
            ),
          )
        : Center(
            child: Icon(
              Icons.image,
              size: 10.h,
            ),
          );
  }

  Widget buildCustomerDetails() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            customer.name,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16.0.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Phone: ${customer.phone ?? 'No Phone Available'}',
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
