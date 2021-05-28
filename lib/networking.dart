import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final url = Uri.https('605a2f18b11aba001745dbdd.mockapi.io', 'api/v1/cards');

  Future<dynamic> getCardsData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
