class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uid;
  String? imageUrl;

  UserModel({this.name, this.email, this.phone, this.uid,this.imageUrl});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['Email'];
    phone = json['Phone'];
    uid = json['uid'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['Email'] = email;
    data['Phone'] = phone;
    data['uid'] = uid;
    data['imageUrl'] = imageUrl;
    return data;
  }
}