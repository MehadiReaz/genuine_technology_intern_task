import 'customer.dart';
import 'page_info.dart';

class CustomerListResponse {
  final int success;
  final bool error;
  final List<Customer> customerList;
  final PageInfo pageInfo;

  CustomerListResponse({
    required this.success,
    required this.error,
    required this.customerList,
    required this.pageInfo,
  });

  factory CustomerListResponse.fromJson(Map<String, dynamic> json) {
    return CustomerListResponse(
      success: json['Success'] ?? 0,
      error: json['error'] ?? false,
      customerList: List<Customer>.from(
        (json['CustomerList'] as List).map(
          (customer) => Customer.fromJson(customer),
        ),
      ),
      pageInfo: PageInfo.fromJson(json['PageInfo']),
    );
  }
}
