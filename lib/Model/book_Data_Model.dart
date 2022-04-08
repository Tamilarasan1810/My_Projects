import 'package:flutter/rendering.dart';

class BookDataModel {
  String? uniqueID;
  String? Type;
  String? ThumbURL;
  String? Title;
  BookDataModel({
    required this.ThumbURL,
    required this.Title,
    required this.Type,
    required this.uniqueID,
  });

  BookDataModel.formJson(Map<String, dynamic> json) {
    ThumbURL = json['ThumbURL'];
    Title = json['Title'];
    Type = json['Type'];
    uniqueID = json['uniqueID'];
  }
}
