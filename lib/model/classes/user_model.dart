class User {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  DateTime? birthDate;
  int? height;
  int? weight;

  String? apiToken;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.birthDate,
    required this.height,
    required this.weight,
    required this.apiToken,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'birth_date': birthDate,
      'height': height,
      'api_Token': apiToken,
    };
  }

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    // birthDate = json['birth_date'];
    birthDate = DateTime.parse(json['birth_date'] ?? '1974-03-20 00:00:00.000');

    height = json['height'];
    weight = json['weight'];
    apiToken = json['api_Token'];
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
