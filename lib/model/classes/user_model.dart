class User {
  int? id;
  String? email;
  String? token;

  User({
    required this.id,
    required this.email,
    required this.token,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'api_Token': token,
    };
  }

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    token = json['api_Token'];
  }
}

class UserModel {
  late User user;
  late String token;

  UserModel({required this.user, required this.token});

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'token': token,
    };
  }

  UserModel.fromJson(Map<String, dynamic> map) {
    user = User.fromJson(map['user']);
    token = map['token'];
  }
}
