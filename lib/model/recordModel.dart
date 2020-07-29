class RecordModel {
  final String title;
  final String kind;
  final String id;
  final String thumbnail;

  RecordModel({this.title, this.kind, this.id, this.thumbnail});

  factory RecordModel.fromJson(Map<String, dynamic> json){
    return RecordModel(
        title: json['title'],
        kind     : json['id'],
        id    : json['kind'],
        thumbnail    : json['thumbnail']['default']['url']);
  }

}

