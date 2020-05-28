import 'package:flutter/material.dart';
import 'dart:core';
import 'package:form_mission/Model/mission.dart';

class FormScreen extends StatelessWidget {
  var mission = Missions(
    companyId: '',
    img: '',
    difficulty: '',
    microtasksNos: 0,
    name: '',
    tags: ['gg','gg'],
    details: '',
    taskNO: '',
    answer: '',
    detailsMicro: '',
    docUrl: '',
    nameMicro: '',
    progress: 0,
    question: '',
    resources: [],
  );
  Future<void> _save(BuildContext context) async {
    await mission.createMission(mission);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 500,
        height: 500,
        padding: const EdgeInsets.all(15),
        child: Form(
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "CompanyID"),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  mission = Missions(
                      companyId: value,
                      img: mission.img,
                      difficulty: mission.difficulty,
                      microtasksNos: mission.microtasksNos,
                      name: mission.name,
                      tags: mission.tags,
                      details: mission.details,
                      taskNO: mission.taskNO,
                      answer: mission.answer,
                      detailsMicro: mission.detailsMicro,
                      docUrl: mission.docUrl,
                      nameMicro: mission.nameMicro,
                      progress: mission.progress,
                      question: mission.question,
                      resources: mission.resources);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "CoverImage"),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  mission = Missions(
                      companyId: mission.companyId,
                      img: value,
                      difficulty: mission.difficulty,
                      microtasksNos: mission.microtasksNos,
                      name: mission.name,
                      tags: mission.tags,
                      details: mission.details,
                      taskNO: mission.taskNO,
                      answer: mission.answer,
                      detailsMicro: mission.detailsMicro,
                      docUrl: mission.docUrl,
                      nameMicro: mission.nameMicro,
                      progress: mission.progress,
                      question: mission.question,
                      resources: mission.resources);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "difficulty"),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  mission = Missions(
                      companyId: mission.companyId,
                      img: mission.img,
                      difficulty: value,
                      microtasksNos: mission.microtasksNos,
                      name: mission.name,
                      tags: mission.tags,
                      details: mission.details,
                      taskNO: mission.taskNO,
                      answer: mission.answer,
                      detailsMicro: mission.detailsMicro,
                      docUrl: mission.docUrl,
                      nameMicro: mission.nameMicro,
                      progress: mission.progress,
                      question: mission.question,
                      resources: mission.resources);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "No of Microtasks"),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  mission = Missions(
                      companyId: mission.companyId,
                      img: mission.img,
                      difficulty: mission.difficulty,
                      microtasksNos: int.parse(value),
                      name: mission.name,
                      tags: mission.tags,
                      details: mission.details,
                      taskNO: mission.taskNO,
                      answer: mission.answer,
                      detailsMicro: mission.detailsMicro,
                      docUrl: mission.docUrl,
                      nameMicro: mission.nameMicro,
                      progress: mission.progress,
                      question: mission.question,
                      resources: mission.resources);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Name"),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  mission = Missions(
                      companyId: mission.companyId,
                      img: mission.img,
                      difficulty: mission.difficulty,
                      microtasksNos: mission.microtasksNos,
                      name: value,
                      tags: mission.tags,
                      details: mission.details,
                      taskNO: mission.taskNO,
                      answer: mission.answer,
                      detailsMicro: mission.detailsMicro,
                      docUrl: mission.docUrl,
                      nameMicro: mission.nameMicro,
                      progress: mission.progress,
                      question: mission.question,
                      resources: mission.resources);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "tags"),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  var lt = new List<String>();
                  final _delimiter = ',';
                  final _values = value.split(_delimiter);
                  //print(_values);
                  _values.forEach((item) {
                    lt.add(item);
                  });
                  mission = Missions(
                      companyId: mission.companyId,
                      img: mission.img,
                      difficulty: mission.difficulty,
                      microtasksNos: mission.microtasksNos,
                      name: mission.name,
                      tags: lt,
                      details: mission.details,
                      taskNO: mission.taskNO,
                      answer: mission.answer,
                      detailsMicro: mission.detailsMicro,
                      docUrl: mission.docUrl,
                      nameMicro: mission.nameMicro,
                      progress: mission.progress,
                      question: mission.question,
                      resources: mission.resources);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Details Of Mission"),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                onSaved: (value) {
                  mission = Missions(
                      companyId: mission.companyId,
                      img: mission.img,
                      difficulty: mission.difficulty,
                      microtasksNos: mission.microtasksNos,
                      name: mission.name,
                      tags: mission.tags,
                      details: value,
                      taskNO: mission.taskNO,
                      answer: mission.answer,
                      detailsMicro: mission.detailsMicro,
                      docUrl: mission.docUrl,
                      nameMicro: mission.nameMicro,
                      progress: mission.progress,
                      question: mission.question,
                      resources: mission.resources);
                },
              ),
              RaisedButton(
                onPressed: () => _save(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
