class UserModel {
  final String username;
  final String lastname;
  final String password;
  final String email;
  final String imageUrl;
  final String phoneNumber;
  final String userId;

  UserModel({
    required this.password,
    required this.lastname,
    required this.username,
    required this.email,
    required this.imageUrl,
    required this.phoneNumber,
    required this.userId,
  });

  UserModel copyWith({
    String? username,
    String? lastname,
    String? password,
    String? email,
    String? imageUrl,
    String? phoneNumber,
    String? userId,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      lastname: lastname ?? this.lastname,
      password: password ?? this.password,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      phoneNumber: userId ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "lastname": lastname,
        "password": password,
        "email": email,
        "imageUrl": imageUrl,
        "phoneNumber": phoneNumber,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      password: json["password"] as String? ?? "",
      lastname: json["lastname"] as String? ?? "",
      username: json["username"] as String? ?? "",
      email: json["email"] as String? ?? "",
      imageUrl: json["imageUrl"] as String? ?? "",
      phoneNumber: json["phoneNumber"] as String? ?? "",
      userId: json["userId"] as String? ?? "",
    );
  }

  static UserModel intial() => UserModel(
        password: "",
        lastname: "",
        username: "",
        email: "",
        imageUrl: "",
        phoneNumber: "",
        userId: "",
      );
}
