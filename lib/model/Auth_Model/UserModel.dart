class UserModel {
  String? email;
  String? password;
  String? date;
  UserModel({this.email, this.password, this.date});
  factory UserModel.fromMap(map){
    return UserModel(
        email:map['email'],
        password:map['password'],
      date:map['date'],
    );

  }
  Map<String,dynamic> toMap() => {'email':email,'password':password,"date":date};

}