import 'package:paperviews/Views/AuthPage/authModel.dart';
import 'package:http/http.dart' as http;

Future<int> authorize(String username, String password) async {
  String apiURL = "http://10.0.2.2:3000/api/auth?username="+username+"&password="+password;
  final response = await http.get(Uri.parse(apiURL));
  if (response.statusCode == 200) {
    final String responseData = response.body;
    List<AuthModel> auth = authModelFromJson(responseData);
    if(auth.isEmpty){
      return 0;
    }else{
      return 1;
    }
  } else {
    return 0;
  }
}

Future<int> register(String username, String password) async {
  String apiURL = "http://10.0.2.2:3000/api/register";
  final response = await http.post(Uri.parse(apiURL),body: {"username": username, "password": password});
  if (response.statusCode == 200) {
    return 1;
  } else {
    return 0;
  }
}