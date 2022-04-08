import 'package:tabs_first/pages/third_page.dart';

class GamesDataModel {
  String? ThumbURL;
  String? Title;
  String? Platform;
  String? ShortName;

  GamesDataModel({
    required this.ThumbURL,
    required this.Platform,
    required this.Title,
    required this.ShortName,
  });
  GamesDataModel.formJson(Map<String, dynamic> json) {
    ThumbURL = json['ThumbURL'];
    Title = json['Title'];
    Platform = json['Platform'];
    ShortName = json['ShortName'];
  }
}
