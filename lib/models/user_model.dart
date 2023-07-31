class UserModel {
  String? name;
  String? email;

  UserModel({
    this.name,
    this.email,
  });
  UserModel.fromJason(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
}
