import 'package:app_of_legends/src/models/champion.dart';
import 'package:dio/dio.dart';

const String URL = "http://ddragon.leagueoflegends.com/";

class ChampionsProvider {
  static var customHeaders = {
    'content-type': 'application/json; charset=UTF-8',
    'Accept': '*/*',
    'Cache-Control': 'no-cache',
    'Connection': 'keep-alive',
    "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
    "Access-Control-Allow-Origin": '*',
  };
  final BaseOptions _baseOptions = BaseOptions(headers: customHeaders, baseUrl: URL);
  late final Dio _dio;

  ChampionsProvider(){
    _dio = Dio(_baseOptions);
  }

  Future<List<Champion>?> getChampions() async{
    final String version = await _getLastVersion();
    final Response<Map<String, dynamic>> res = await _dio.get("cdn/$version/data/es_ES/champion.json");
    if(res.data != null){
      final Map<String, dynamic> championsMap = res.data?["data"];
      final List<Champion> champs = championsMap.values.map((e) => Champion.fromJson(e)).toList();
      return champs;
    }else{
      return null;
    }
  }

  Future<String> _getLastVersion() async{
    final Response res = await _dio.get("api/versions.json");
    List<dynamic> versions = res.data;
    return versions.first;
  }

  Future<String> getImageURL(String id) async{
    final String version = await _getLastVersion();
    return "http://ddragon.leagueoflegends.com/cdn/$version/img/champion/$id.png";
  }

}