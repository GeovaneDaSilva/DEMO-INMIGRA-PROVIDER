import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../global/environment.dart';
import '../../models/user/user_response.dart';


class AuthenticationRepository {
  final url = Environment.apiUrl+ Path.auth;
  
  Future<dynamic> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}),
      );
        


        if( response.statusCode == 200) {

          final  account  = jsonDecode(response.body);
        
          final User user =  User.fromJson(account);



          return user;


        }
        
        
         

     

    
      
    } catch (e) {
      return e;
    }
  }
}
