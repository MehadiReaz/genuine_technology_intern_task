import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../data/models/customer.dart';
import '../../../data/models/customer_list_response.dart';
import 'auth_controller.dart';

class CustomerController extends GetxController {
  late PagingController<int, Customer> pagingController;

  @override
  void onInit() {
    super.onInit();
    pagingController = PagingController(firstPageKey: 1);
    pagingController.addPageRequestListener((pageKey) {
      fetchData(pageKey);
    });
    fetchData(1); // Initial data fetch
  }

  Future<void> fetchData(int pageKey) async {
    try {
      final response = await Dio().get(
        'https://www.pqstec.com/InvoiceApps/Values/GetCustomerList',
        queryParameters: {
          'searchquery': '',
          'pageNo': pageKey,
          'pageSize': 20,
          'SortyBy': 'Balance',
        },
        options: Options(
          headers: {
            'Authorization': AuthController.accessToken!,
          },
        ),
      );

      final customerListResponse = CustomerListResponse.fromJson(response.data);

      final isLastPage = customerListResponse.customerList.length < 20;
      if (isLastPage) {
        pagingController.appendLastPage(customerListResponse.customerList);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(
            customerListResponse.customerList, nextPageKey);
      }
    } catch (e) {
      pagingController.error = e;
    }
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }
}
