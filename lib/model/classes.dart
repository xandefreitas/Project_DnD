class Classes {
  String index;
  String name;
  String url;

  Classes({
    this.index,
    this.name,
    this.url,
  });

  Classes.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    name = json['name'];
    url = json['url'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['index'] = this.index;
  //   data['name'] = this.name;
  //   data['url'] = this.url;
  //   return data;
  // }
}
