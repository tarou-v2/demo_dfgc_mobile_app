import 'dart:convert';
import 'package:http/http.dart' as http;

class TokenDataService {
  Future<Map<String, dynamic>> fetchTokenData(
      String network, String tokenAddress) async {
    final String apiUrl =
        'https://api.geckoterminal.com/api/v2/networks/$network/tokens/$tokenAddress/pools?page=1';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load token data');
    }
  }
}
