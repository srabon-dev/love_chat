class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uid;

  UserModel({this.name, this.email, this.phone, this.uid});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['Email'];
    phone = json['Phone'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['Email'] = email;
    data['Phone'] = phone;
    data['uid'] = uid;
    return data;
  }
}