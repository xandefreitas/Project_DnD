import 'package:project_dd/model/details.dart';

class ResponseA {
  int count;
  List<Proficiencies> results;

  ResponseA({
    this.count,
    this.results,
  });

  ResponseA.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['results'] != null) {
      results = <Proficiencies>[];
      json['results'].forEach((v) {
        results.add(new Proficiencies.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['count'] = this.count;
  //   if (this.results != null) {
  //     data['results'] = this.results.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}
