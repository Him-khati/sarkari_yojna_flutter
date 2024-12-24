// To parse this JSON data, do
//
//     final getYojnaResponse = getYojnaResponseFromJson(jsonString);

import 'dart:convert';

import '../../models/yojna.dart';

GetYojnaResponse getYojnaResponseFromJson(String str) => GetYojnaResponse.fromJson(json.decode(str));

String getYojnaResponseToJson(GetYojnaResponse data) => json.encode(data.toJson());

class GetYojnaResponse {
  bool status;
  YojnaListWrapper yojna;

  GetYojnaResponse({
    required this.status,
    required this.yojna,
  });

  factory GetYojnaResponse.fromJson(Map<String, dynamic> json) => GetYojnaResponse(
    status: json["status"],
    yojna: YojnaListWrapper.fromJson(json["yojna"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "yojna": yojna.toJson(),
  };
}

class YojnaListWrapper {
  int total;
  List<Yojna> documents;

  YojnaListWrapper({
    required this.total,
    required this.documents,
  });

  factory YojnaListWrapper.fromJson(Map<String, dynamic> json) => YojnaListWrapper(
    total: json["total"],
    documents: List<Yojna>.from(json["documents"].map((x) => Yojna.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "documents": List<dynamic>.from(documents.map((x) => x.toJson())),
  };
}


