class Atributes {
  String index;
  String name;
  String fullName;
  List<String> description;
  List<Skills> skills;
  String url;

  Atributes({
    this.index,
    this.name,
    this.fullName,
    this.description,
    this.skills,
    this.url,
  });

  Atributes.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    name = json['name'];
    fullName = json['full_name'];
    description = json['desc'].cast<String>();
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills.add(new Skills.fromJson(v));
      });
    }
    url = json['url'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['index'] = this.index;
  //   data['name'] = this.name;
  //   data['full_name'] = this.fullName;
  //   data['desc'] = this.desc;
  //   if (this.skills != null) {
  //     data['skills'] = this.skills.map((v) => v.toJson()).toList();
  //   }
  //   data['url'] = this.url;
  //   return data;
  // }
}

class Skills {
  String name;
  String index;
  String url;

  Skills({this.name, this.index, this.url});

  Skills.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    index = json['index'];
    url = json['url'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
  //   data['index'] = this.index;
  //   data['url'] = this.url;
  //   return data;
  // }
}
