class Students {
  int? id;
  String? referenceNumber;
  String? firstName;
  String? natureService;
  String? amount;
  String? gender;
  String? date;
  String? cash;

  Students(
      {this.id,
        this.referenceNumber,
        this.firstName,
        this.natureService,
        this.amount,
        this.gender,
        this.date,
        this.cash});

  Students.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    referenceNumber = json['referenceNumber'];
    firstName = json['first_name'];
    natureService = json['natureService'];
    amount = json['amount'];
    gender = json['gender'];
    date = json['date'];
    cash = json['cash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['referenceNumber'] = this.referenceNumber;
    data['first_name'] = this.firstName;
    data['natureService'] = this.natureService;
    data['amount'] = this.amount;
    data['gender'] = this.gender;
    data['date'] = this.date;
    data['cash'] = this.cash;
    return data;
  }
}
