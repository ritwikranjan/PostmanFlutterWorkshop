import 'dart:convert';

import 'package:http/http.dart' as http;

getContinentData(String continent) async {
  http.Response data = await http.get(
    Uri.parse('https://corona.lmao.ninja/v2/continents/$continent'),
  );

  print(data.body);

  return jsonDecode(data.body);
}
