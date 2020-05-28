import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Missions {
  String companyId;
  String img;
  String difficulty;
  int microtasksNos;
  String name;
  List<String> tags;
  String details;
  String taskNO;
  String answer;
  String detailsMicro;
  String nameMicro;
  int progress;
  String question;
  List<String> resources;
  var docUrl;
  Missions({
    @required this.companyId,
    @required this.img,
    @required this.difficulty,
    @required this.microtasksNos,
    @required this.name,
    @required this.tags,
    @required this.details,
    @required this.taskNO,
    @required this.answer,
    @required this.detailsMicro,
    @required this.docUrl,
    @required this.nameMicro,
    @required this.progress,
    @required this.question,
    @required this.resources,
  });
  Future<void> createMission(Missions missions) async {
    var url =
        'https://firestore.googleapis.com/v1/projects/widhya-a1d0a/databases/(default)/documents/missions';
    // print(missions.tags);
    var response = await http.post(url,
        body: json.encode({
          "fields": {
            //'fn': {"stringValue": "Jason"},
            'companyId': {"stringValue": missions.companyId},
            'coverImg': {"stringValue": missions.img},
            'difficulty': {"stringValue": missions.difficulty},
            'microtasksNos': {"integerValue": missions.microtasksNos},
            'name': {"stringValue": missions.name},
            'tags': {
              "arrayValue": {
                "values": {
                  'stringValue':'gg', 
                },
              }
            },
          },
        }));
    //final response = await http.get(url);
    print(response.body);
    missions.docUrl = json.decode(response.body)['documents'] as List<dynamic>;
  }

  Future<void> addDetails(String details) async {
    var url = 'https://firestore.googleapis.com/v1/';
    url = url + docUrl[0]['name'] + '/details';
    await http.post(url,
        body: json.encode({
          "name": 'details',
          "fields": {
            'details': details,
          },
        }));
  }

  Future<void> addMirotask(
      String taskNO,
      String answer,
      String detailsMicro,
      String nameMicro,
      int progress,
      String question,
      List<String> resources) async {
    var url = 'https://firestore.googleapis.com/v1/';
    url = url + docUrl[0]['name'] + '/microtasks';
    await http.post(url,
        body: json.encode({
          "name": 'microtask-$taskNO',
          "fields": {
            'answer': answer,
            'details': detailsMicro,
            'name': nameMicro,
            'progress': progress.toString(),
            'question': question,
            'resources': resources,
          },
        }));
  }
}
