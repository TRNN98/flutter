class NewsModel {
  NewsModel({
    this.question,
    this.note,
    this.nphoto,
    this.ndata,
    this.date,
    this.title,
    this.question2,
  });

  NewsModel.fromJson(dynamic json) {
    question = json['question'];
    note = json['note'];
    nphoto = json['nphoto'];
    ndata = json['ndata'];
    date = json['date'];
    title = json['title_news'];
    question2 = json['question2'];
  }
  String? question;
  String? note;
  String? nphoto;
  String? ndata;
  String? date;
  String? title;
  String? question2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['question'] = question;
    map['note'] = note;
    map['nphoto'] = nphoto;
    map['ndata'] = ndata;
    map['date'] = date;
    map['title_news'] = title;
    map['question2'] = question2;
    return map;
  }
}
