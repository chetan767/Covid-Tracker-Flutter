import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tracker/models/CovidGlobe.dart';

String urlGlobe = 'https://coronavirus-19-api.herokuapp.com/countries';
String url = 'https://corona-api.com/countries?include=timeline';

class CovidApi {
  Future<CovidGlobe> getCovidGlobe() async {
    CovidGlobe result;
    try {
      final response = await http.get(Uri.parse(urlGlobe));
      if (response.statusCode == 200) {
        var jsonRes = response.body;
        jsonRes = jsonRes.replaceFirst('[', '{\"countries\":[');
        jsonRes += '}';
        result = CovidGlobe.fromJson(json.decode(jsonRes));
      }
    } catch (e) {
      return null;
    }
    return result;
  }
}
