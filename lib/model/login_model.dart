class LoginModel {
  String? userRole;
  String? refreshToken;
  String? token;
  String? userName;
  String? userId;

  LoginModel(
      {this.userRole,
        this.refreshToken,
        this.token,
        this.userName,
        this.userId});

  LoginModel.fromJson(Map<String, dynamic> json) {
    userRole = json['userRole'];
    refreshToken = json['refreshToken'];
    token = json['token'];
    userName = json['userName'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userRole'] = this.userRole;
    data['refreshToken'] = this.refreshToken;
    data['token'] = this.token;
    data['userName'] = this.userName;
    data['userId'] = this.userId;
    return data;
  }
}
