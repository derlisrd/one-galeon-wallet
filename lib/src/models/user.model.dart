

import 'dart:convert';

class UserModel{
  String? username;
  String email;
  String token;
  int id;
  UserModel({ this.username, required this.email, required this.id, required this.token});

  Map<String,dynamic> toMap(){
    return {
      "id": id,
      "email": email,
      "token": token,
      "username": username
    };
  }

  factory UserModel.fromMap(Map<String,dynamic> map){
    return UserModel(
      email: map['email'] ?? '', 
      id: map['id'] ?? 0, 
      token: map['token'] ?? ''
    );
  }

  String toJson()=> json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}