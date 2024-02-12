import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:onegaleon/src/config/constants.dart';


class ApiMovimientos {

  void store(Map<String,dynamic> body, String token)async{
    try {

      http.Response res = await http.post(
        Uri.parse('${Constants.apiUrl}/movements'),
        body: jsonEncode(body),
        headers:{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-api-key': Constants.xApiKey,
          'Authorization': 'Bearer $token'
        },
      );
      //print(res.body);
      Map<String,dynamic> json = jsonDecode(res.body);
      print(json); 
      
    } catch (e) {
      //Map<String,dynamic> error = {"success": false, "message": e.toString()};
      print(e.toString());
      //return loginResponseError;
    }
  }

}