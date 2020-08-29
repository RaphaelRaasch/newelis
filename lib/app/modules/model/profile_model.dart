class ProfileModel {
  int id;
  int user;
  int crp;

  ProfileModel({this.id, this.user, this.crp});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    crp = json['crp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['crp'] = this.crp;
    return data;
  }
}
