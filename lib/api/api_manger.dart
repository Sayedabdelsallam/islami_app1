import 'dart:convert';
import 'package:islami_app/models/radio_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:islami_app/models/reciters_response_model.dart';
class ApiManger {


  static Future<RadioResponseModel> getRadioData() async
  {
    try {
        Uri uri = Uri.parse("https://mp3quran.net/api/v3/radios/");
        var response = await  http.get(uri);
        var jsonResponse = json.decode(response.body);
        return RadioResponseModel.fromJson(jsonResponse);
    } catch (e){
         rethrow;
    }
  }

  static Future<RecitersResponseModel> getRecitersData() async
  {
    try {
      Uri uri = Uri.parse("https://mp3quran.net/api/v3/reciters");
      var response = await  http.get(uri);
      var jsonResponse = json.decode(response.body);
      return RecitersResponseModel.fromJson(jsonResponse);
    } catch (e){
      rethrow;
    }
  }



}