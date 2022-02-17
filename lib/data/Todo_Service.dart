import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class TodoService {
  final http.Client httpClient;
  TodoService({
    required this.httpClient,
  });

  static Future<Response> getTodos() async {
    Response response;
    try {
      final url = Uri.parse("https://jsonplaceholder.typicode.com/todos");
      response = await http.get(url);
      return response;
    } catch (error, stacktrace) {
      //print("Exception occured: $error stackTrace: $stacktrace");
      throw Exception('error getting quote');
    }
  }
}
