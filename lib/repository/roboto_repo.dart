import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/roboto.dart';

class RobotoRepo {
  final String _baseUrl = "https://jsonplaceholder.typicode.com/users";

  Future<List<Roboto>> getRobots() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List<Roboto> robots = (json.decode(response.body) as List)
          .map((robot) => Roboto.fromJson(robot))
          .toList();

      return robots;
    } else {
      throw Exception("Failed to load robots");
    }
  }
}
