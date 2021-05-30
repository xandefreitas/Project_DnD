class Classes {
  int count;
  List<Results> results;

  Classes({this.count, this.results});

  Classes.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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
