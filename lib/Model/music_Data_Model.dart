class MusicDataModel {
  String? UniqueID;
  String? Artist;
  String? Title;
  String? FolgeNo;
  String? ThumbURL;
  MusicDataModel({
    required this.Artist,
    required this.FolgeNo,
    required this.ThumbURL,
    required this.Title,
    required this.UniqueID,
  });

  MusicDataModel.formJson(Map<String, dynamic> json) {
    ThumbURL = json['ThumbURL'];
    Title = json['Title'];
    FolgeNo = json['FolgeNo'];
    Artist = json['Artist'];
    UniqueID = json['UniqueID'];
  }
}
