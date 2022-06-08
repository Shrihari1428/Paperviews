import 'package:paperviews/Views/QuestionPage/question_model.dart';
import 'package:http/http.dart' as http;

Future<List<QuestionModel>?> getQuestions(String company, String year, String subject) async {
  String apiURL = "http://10.0.2.2:3000/api/questions?company_name="+company+"&year="+year+"&subject="+subject;
  final response = await http.get(Uri.parse(apiURL));
  if (response.statusCode == 200) {
    final String responseData = response.body;
    return questionModelFromJson(responseData);
  } else {
    return null;
  }
}