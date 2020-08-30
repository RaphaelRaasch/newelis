class UserModel {
  String token;
  int userId;
  String username;
  String firstName;
  String lastName;
  String email;
  bool staff;

  UserModel(
      {this.token,
      this.userId,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.staff});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['user_id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    staff = json['staff'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['staff'] = this.staff;
    return data;
  }
}
