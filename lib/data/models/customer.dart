class Customer {
  final int id;
  final String name;
  final String? email;
  final String? primaryAddress;
  final String? secondaryAddress;
  final String? notes;
  final String? phone;
  final String custType;
  final String? parentCustomer;
  final String? imagePath;
  final double totalDue;
  final String lastSalesDate;
  final String lastInvoiceNo;
  final String lastSoldProduct;
  final double totalSalesValue;
  final double totalSalesReturnValue;
  final double totalAmountBack;
  final double totalCollection;
  final String lastTransactionDate;
  final String clientCompanyName;

  Customer({
    required this.id,
    required this.name,
    this.email,
    this.primaryAddress,
    this.secondaryAddress,
    this.notes,
    this.phone,
    required this.custType,
    this.parentCustomer,
    this.imagePath,
    required this.totalDue,
    required this.lastSalesDate,
    required this.lastInvoiceNo,
    required this.lastSoldProduct,
    required this.totalSalesValue,
    required this.totalSalesReturnValue,
    required this.totalAmountBack,
    required this.totalCollection,
    required this.lastTransactionDate,
    required this.clientCompanyName,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['Id'] ?? 0,
      name: json['Name'] ?? '',
      email: json['Email'],
      primaryAddress: json['PrimaryAddress'],
      secondaryAddress: json['SecoundaryAddress'],
      notes: json['Notes'],
      phone: json['Phone'],
      custType: json['CustType'] ?? '',
      parentCustomer: json['ParentCustomer'],
      imagePath: json['ImagePath'],
      totalDue: json['TotalDue'] ?? 0.0,
      lastSalesDate: json['LastSalesDate'] ?? '',
      lastInvoiceNo: json['LastInvoiceNo'] ?? '',
      lastSoldProduct: json['LastSoldProduct'] ?? '',
      totalSalesValue: json['TotalSalesValue'] ?? 0.0,
      totalSalesReturnValue: json['TotalSalesReturnValue'] ?? 0.0,
      totalAmountBack: json['TotalAmountBack'] ?? 0.0,
      totalCollection: json['TotalCollection'] ?? 0.0,
      lastTransactionDate: json['LastTransactionDate'] ?? '',
      clientCompanyName: json['ClinetCompanyName'] ?? '',
    );
  }
}
