import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:onegaleon/src/config/constants.dart';
import 'package:onegaleon/src/models/mov.response.model.dart';


class ApiMovimientos {

  Future<MovStoreResponse> store(Map<String,dynamic> body, String token)async{
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
      MovStoreResponse result = MovStoreResponse.fromJson(json);
      return result;
    } catch (e) {
      print(e.toString());
      Map<String,dynamic> error = {"success": false, "results": {}};
      return MovStoreResponse.fromJson(error);
    }
  }

}