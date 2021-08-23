class Results {
  String index;
  String name;
  String url;

  Results({this.index, this.name, this.url});

  Results.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
