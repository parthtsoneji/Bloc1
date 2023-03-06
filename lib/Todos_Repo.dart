import 'dart:convert';
import 'package:bloc_2/Todos_Model.dart';
import 'package:http/http.dart' as http;
class Todos_Repo {
  String Url = 'https://jsonplaceholder.typicode.com/todos/';
  Future<List<Todos_Model>> getUsers() async {

    var response = await http.get(Uri.parse(Url));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => Todos_Model.fromJson(e)).toList();
    } else {
      throw Exception('Error in Todos');
    }
  }
}