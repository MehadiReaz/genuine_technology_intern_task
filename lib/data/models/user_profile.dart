class UserProfile {
  final String userName;
  final String? token;
  final int userId;
  final int comId;
  final String email;
  final String companyName;
  final String roleName;
  final String weightScaleBarcodeStartWith;
  final String empImagePath;
  final List<CompanyUser> companyUserList;
  final bool isSerialSales;
  final int decimalField;
  final String businessTypeName;
  final int defaultCurrencyId;

  UserProfile({
    required this.userName,
    required this.token,
    required this.userId,
    required this.comId,
    required this.email,
    required this.companyName,
    required this.roleName,
    required this.weightScaleBarcodeStartWith,
    required this.empImagePath,
    required this.companyUserList,
    required this.isSerialSales,
    required this.decimalField,
    required this.businessTypeName,
    required this.defaultCurrencyId,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      userName: json['UserName'],
      token: json['Token'],
      userId: json['UserId'],
      comId: json['ComId'],
      email: json['Email'],
      companyName: json['CompanyName'],
      roleName: json['RoleName'],
      weightScaleBarcodeStartWith: json['WeightScaleBarcodeStartWith'],
      empImagePath: json['EmpImagePath'],
      companyUserList: List<CompanyUser>.from(
        json['CompanyUserList'].map((x) => CompanyUser.fromJson(x)),
      ),
      isSerialSales: json['IsSerialSales'],
      decimalField: json['DecimalField'],
      businessTypeName: json['BusinessTypeName'],
      defaultCurrencyId: json['DefaultCurrencyId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'UserName': userName,
      'Token': token,
      'UserId': userId,
      'ComId': comId,
      'Email': email,
      'CompanyName': companyName,
      'RoleName': roleName,
      'WeightScaleBarcodeStartWith': weightScaleBarcodeStartWith,
      'EmpImagePath': empImagePath,
      'CompanyUserList':
          List<dynamic>.from(companyUserList.map((x) => x.toJson())),
      'IsSerialSales': isSerialSales,
      'DecimalField': decimalField,
      'BusinessTypeName': businessTypeName,
      'DefaultCurrencyId': defaultCurrencyId,
    };
  }
}

class CompanyUser {
  final String text;
  final String value;
  final int defaultCurrencyId;

  CompanyUser({
    required this.text,
    required this.value,
    required this.defaultCurrencyId,
  });

  factory CompanyUser.fromJson(Map<String, dynamic> json) {
    return CompanyUser(
      text: json['Text'],
      value: json['Value'],
      defaultCurrencyId: json['DefaultCurrencyId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Text': text,
      'Value': value,
      'DefaultCurrencyId': defaultCurrencyId,
    };
  }
}
