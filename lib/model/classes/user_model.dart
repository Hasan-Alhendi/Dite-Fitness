class User {
  int? id;
  String? email;
  String? first_name;
  String? last_name;
  String? gender;
  DateTime? birth_date;
  int? height;

  String? api_Token;

  User({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.gender,
    required this.birth_date,
    required this.height,
    required this.api_Token,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': first_name,
      'last_name': last_name,
      'gender': gender,
      'birth_date': birth_date,
      'height': height,
      'api_Token': api_Token,
    };
  }

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    gender = json['gender'];
    //birth_date = json['birth_date'];
    birth_date = DateTime.parse(json['birth_date'].toString());
    ;
    height = json['height'];
    api_Token = json['api_Token'];
  }
  int get getId {
    return id!;
  }

/* class UserModel {
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
 */
}
