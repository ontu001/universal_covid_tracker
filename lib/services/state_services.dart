import 'dart:convert';
import 'package:universal_covid_tracker/services/utils/app_url.dart';
import '../models/wrold_result.dart';
import 'package:http/http.dart' as http;

class StateServices {
  Future<Wroldresult> fetchWroldWideData() async {
    final response = await http.get(Uri.parse(AppUrl.worldwidResult));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return Wroldresult.fromJson(data);
    } else {
      throw Exception('Error');
    }



  }
}
