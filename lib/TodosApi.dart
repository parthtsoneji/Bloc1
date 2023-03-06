import 'dart:convert';
import 'package:bloc_2/TodosModel.dart';
import 'package:http/http.dart' as http;


class TodosApi {
  String Url = 'https://jsonplaceholder.typicode.com/todos/';
  Future<List<TodosModel>> getUsers() async {

    var response = await http.get(Uri.parse(Url));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => TodosModel.fromJson(e)).toList();
    } else {
      throw Exception('Error in Todos');
    }
  }
}