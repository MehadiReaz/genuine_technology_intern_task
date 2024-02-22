class PageInfo {
  final int pageNo;
  final int pageSize;
  final int pageCount;
  final int totalRecordCount;

  PageInfo({
    required this.pageNo,
    required this.pageSize,
    required this.pageCount,
    required this.totalRecordCount,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) {
    return PageInfo(
      pageNo: json['PageNo'] ?? 0,
      pageSize: json['PageSize'] ?? 0,
      pageCount: json['PageCount'] ?? 0,
      totalRecordCount: json['TotalRecordCount'] ?? 0,
    );
  }
}
