import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/customer.dart';

class CustomerDetailsScreen extends StatelessWidget {
  final Customer customer;

  const CustomerDetailsScreen({super.key, required this.customer});

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
        title: Text(
          customer.name,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: customer.imagePath != null
                    ? Image.network(
                        'https://www.pqstec.com/InvoiceApps/${customer.imagePath}',
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return const CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.grey,
                            child: Icon(
                              Icons.image,
                              size: 60,
                              color: Colors.white,
                            ),
                          );
                        },
                      ).image
                    : null,
                child: customer.imagePath == null
                    ? const Icon(
                        Icons.image,
                        size: 60,
                      )
                    : null,
              ),
              const SizedBox(height: 20),
              textField('Name', customer.name),
              textField('Email', customer.email),
              textField('Phone', customer.phone),
              textField('Type', customer.custType),
              textField('Last Invoice No', customer.lastInvoiceNo),
              textField('Last Sales Date', customer.lastSalesDate),
              textField('Last Sold Product', customer.lastSoldProduct),
              textField('Last Transaction Date', customer.lastTransactionDate),
              textField('Primary Address', customer.primaryAddress),
              textField('Secondary Address', customer.secondaryAddress),
              textField('Total Amount Back',
                  '${customer.totalAmountBack.toDouble()}'),
              textField(
                  'Total Collection', '${customer.totalCollection.toDouble()}'),
              textField('Total Due', '${customer.totalDue.toDouble()}'),
            ],
          ),
        ),
      ]),
    );
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
