




class LoginResponseModel{
  bool success;
  String? message;
  ResultsLoginUserModel results;

  LoginResponseModel({required this.success, this.message, required this.results});

  Map<String,dynamic> toMap(){
    return {
      "success": success,
      "results": results,
      "message": message
    };
  }

 //*  ACA DEBES CAMBIAR EL MODELO *//
  factory LoginResponseModel.fromMap(Map<String, dynamic> json) {
    var result = json['results'];
    return LoginResponseModel(
        success: json['success'] ?? false,
        results: ResultsLoginUserModel(
          email: result?['email'] ?? '', 
          token: result?['token'] ?? '', 
          id: result?['id'] ?? 0, 
          username: result?['username'] ?? ''),
        message: json['message'] ?? ''
    );
  }

}


class ResultsLoginUserModel{
  String? username;
  String email;
  String token;
  int id;

  ResultsLoginUserModel({ this.username, required this.email, required this.id, required this.token});

  factory ResultsLoginUserModel.fromJson(Map<String, dynamic> json) {
    return ResultsLoginUserModel(
        username: json['username'] ?? '',
        email : json['email'] ?? '',
        token: json['token'] ?? '',
        id: json['id'] ?? 0
      );
  }
}

