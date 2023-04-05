class CustomerModel {
  List<Customers>? data;
  int? statusCode;
  String? message;

  CustomerModel({this.data, this.statusCode, this.message});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Customers>[];
      json['data'].forEach((v) {
        data!.add(new Customers.fromJson(v));
      });
    }
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}

class Customers {
  String? saleRepName;
  int? orderCount;
  int? id;
  String? firstName;
  String? lastName;
  String? salonName;
  String? state;
  String? city;
  String? address;
  String? email;
  String? location;
  String? phone;
  String? customerImagePath;
  String? customerImage;
  double? accountBalance;
  int? saleRepId;

  Customers(
      {this.saleRepName,
        this.orderCount,
        this.id,
        this.firstName,
        this.lastName,
        this.salonName,
        this.state,
        this.city,
        this.address,
        this.email,
        this.location,
        this.phone,
        this.customerImagePath,
        this.customerImage,
        this.accountBalance,
        this.saleRepId});

  Customers.fromJson(Map<String, dynamic> json) {
    saleRepName = json['saleRepName'];
    orderCount = json['orderCount'];
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    salonName = json['salon_Name'];
    state = json['state'];
    city = json['city'];
    address = json['address'];
    email = json['email'];
    location = json['location'];
    phone = json['phone'];
    customerImagePath = json['customerImagePath'];
    customerImage = json['customerImage'];
    accountBalance = json['accountBalance'];
    saleRepId = json['saleRepId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['saleRepName'] = this.saleRepName;
    data['orderCount'] = this.orderCount;
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['salon_Name'] = this.salonName;
    data['state'] = this.state;
    data['city'] = this.city;
    data['address'] = this.address;
    data['email'] = this.email;
    data['location'] = this.location;
    data['phone'] = this.phone;
    data['customerImagePath'] = this.customerImagePath;
    data['customerImage'] = this.customerImage;
    data['accountBalance'] = this.accountBalance;
    data['saleRepId'] = this.saleRepId;
    return data;
  }
}
