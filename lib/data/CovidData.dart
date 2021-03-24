import 'package:flutter/foundation.dart';
import 'package:tracker/api/covid/CovidApi.dart';
import 'package:tracker/models/CovidGlobe.dart';

class CovidData extends ChangeNotifier {
  Future<List<Countries>> getGlobe() async {
    List<Countries> globe;
    CovidGlobe covidGlobe;
    covidGlobe = await CovidApi().getCovidGlobe();
    globe = covidGlobe.countries;
    return globe;
  }
}
