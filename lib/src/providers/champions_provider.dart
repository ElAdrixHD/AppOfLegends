import 'dart:convert';

import 'package:app_of_legends/src/models/full_champion_info.dart';
import 'package:http/http.dart' as http;
import 'package:app_of_legends/src/models/champions.dart';

class ChampionsProvider {
  Future<Champions> getChampions(String lastVersion) async{
    final res = await http.get("https://ddragon.leagueoflegends.com/cdn/$lastVersion/data/es_ES/champion.json",headers: {"Content-type": "application/json", "charset":"utf-8"});
    if(res.body != null){
      final champions = championsFromJson(utf8.decode(res.bodyBytes));
      if(champions != null){
        return champions;
      }
      return null;
    }
    throw Exception("res.body es null");
  }

  Future<String> getLastVersion() async{
    final res = await http.get("https://ddragon.leagueoflegends.com/api/versions.json",headers: {"Content-type": "application/json", "charset":"utf-8"});
    if(res.body != null){
      final versions = versionFromJson(utf8.decode(res.bodyBytes));
      return versions.first;
    }
    throw Exception("No hay versiones");
  }

  Future<FullInfoChampion> getFullInfo(String lastVersion, String id) async{
    final res = await http.get("http://ddragon.leagueoflegends.com/cdn/$lastVersion/data/es_ES/champion/$id.json",headers: {"Content-type": "application/json", "charset":"utf-8"});
    if(res.body != null){
      final champions = fullInfoChampionFromJson(utf8.decode(res.bodyBytes), id);
      if(champions != null){
        return champions;
      }
      return null;
    }
    throw Exception("res.body es null");
  }
}