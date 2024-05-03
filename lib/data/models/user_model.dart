class UserModel {
  final String username;
  final String lastname;
  final String password;
  final String email;
  final String imageUrl;
  final String phoneNumber;
  final String userId;
  final String fcm;
  final String authUid;

  UserModel({
    required this.password,
    required this.lastname,
    required this.username,
    required this.email,
    required this.imageUrl,
    required this.phoneNumber,
    required this.userId,
    required this.fcm,
    required this.authUid,
  });

  UserModel copyWith({
    String? username,
    String? lastname,
    String? password,
    String? email,
    String? imageUrl,
    String? phoneNumber,
    String? userId,
    String? fcm,
    String? authUid,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      lastname: lastname ?? this.lastname,
      password: password ?? this.password,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      phoneNumber: userId ?? this.phoneNumber,
      fcm: fcm ?? this.fcm,
      authUid: authUid ?? this.authUid,
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
        "authUid": authUid,
      };

  Map<String, dynamic> toJsonForUpdate() => {

    "username": username,
    "lastname": lastname,
    "password": password,
    "email": email,
    "imageUrl": imageUrl,
    "phoneNumber": phoneNumber,
    "authUid": authUid,
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
      fcm: json["fcm"] as String? ?? "",
      authUid: json["authUid"] as String? ?? "",
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
        fcm: "",
      authUid:""
      );
}
