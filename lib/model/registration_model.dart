class Registration {
  bool? success;
  Data? data;
  String? msg;

  Registration({this.success, this.data, this.msg});

  Registration.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['msg'] = this.msg;
    return data;
  }
}

class Data {
  int? id;
  Null? firstName;
  Null? middleName;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? phone;
  String? phoneCode;
  int? verify;
  Null? otp;
  Null? dob;
  Null? civilStatus;
  Null? gender;
  Null? age;
  Null? barangay;
  Null? city;
  Null? image;
  int? status;
  int? creditBalance;
  Null? doctorId;
  Null? deviceToken;
  String? language;
  Null? channelName;
  Null? agoraToken;
  String? createdAt;
  String? updatedAt;
  String? token;
  int? isFilled;
  String? fullImage;

  Data(
      {this.id,
        this.firstName,
        this.middleName,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.phone,
        this.phoneCode,
        this.verify,
        this.otp,
        this.dob,
        this.civilStatus,
        this.gender,
        this.age,
        this.barangay,
        this.city,
        this.image,
        this.status,
        this.creditBalance,
        this.doctorId,
        this.deviceToken,
        this.language,
        this.channelName,
        this.agoraToken,
        this.createdAt,
        this.updatedAt,
        this.token,
        this.isFilled,
        this.fullImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    phoneCode = json['phone_code'];
    verify = json['verify'];
    otp = json['otp'];
    dob = json['dob'];
    civilStatus = json['civil_status'];
    gender = json['gender'];
    age = json['age'];
    barangay = json['barangay'];
    city = json['city'];
    image = json['image'];
    status = json['status'];
    creditBalance = json['credit_balance'];
    doctorId = json['doctor_id'];
    deviceToken = json['device_token'];
    language = json['language'];
    channelName = json['channel_name'];
    agoraToken = json['agora_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
    isFilled = json['is_filled'];
    fullImage = json['fullImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone'] = this.phone;
    data['phone_code'] = this.phoneCode;
    data['verify'] = this.verify;
    data['otp'] = this.otp;
    data['dob'] = this.dob;
    data['civil_status'] = this.civilStatus;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['barangay'] = this.barangay;
    data['city'] = this.city;
    data['image'] = this.image;
    data['status'] = this.status;
    data['credit_balance'] = this.creditBalance;
    data['doctor_id'] = this.doctorId;
    data['device_token'] = this.deviceToken;
    data['language'] = this.language;
    data['channel_name'] = this.channelName;
    data['agora_token'] = this.agoraToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['token'] = this.token;
    data['is_filled'] = this.isFilled;
    data['fullImage'] = this.fullImage;
    return data;
  }
}
