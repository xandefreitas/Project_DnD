class Character {
  String name;
  List<String> classes;
  String race;
  String alignment;
  double experience;
  int level;
  int sex;
  Atributes atributes;
  List<String> skills;
  List<String> equipment;
  List<String> personalityTraits;
  List<String> ideals;
  List<String> bonds;
  List<String> flaws;
  Character({
    this.name,
    this.classes,
    this.race,
    this.alignment,
    this.experience,
    this.level,
    this.sex,
    this.atributes,
    this.skills,
    this.equipment,
    this.personalityTraits,
    this.ideals,
    this.bonds,
    this.flaws,
  });

  Character.fromJson(Map<String, dynamic> json) {
    alignment = json['alignment'];
    atributes = json['atributes'] != null ? new Atributes.fromJson(json['atributes']) : null;
    bonds = json['bonds'].cast<String>();
    classes = json['classes'].cast<String>();
    equipment = json['equipment'].cast<String>();
    experience = json['experience'];
    flaws = json['flaws'].cast<String>();
    ideals = json['ideals'].cast<String>();
    level = json['level'];
    name = json['name'];
    personalityTraits = json['personalityTraits'].cast<String>();
    race = json['race'];
    sex = json['sex'];
    skills = json['skills'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alignment'] = this.alignment;
    if (this.atributes != null) {
      data['atributes'] = this.atributes.toJson();
    }
    data['bonds'] = this.bonds;
    data['classes'] = this.classes;
    data['equipment'] = this.equipment;
    data['experience'] = this.experience;
    data['flaws'] = this.flaws;
    data['ideals'] = this.ideals;
    data['level'] = this.level;
    data['name'] = this.name;
    data['personalityTraits'] = this.personalityTraits;
    data['race'] = this.race;
    data['sex'] = this.sex;
    data['skills'] = this.skills;
    return data;
  }
}

class Atributes {
  int strenght;
  int dexterity;
  int constitution;
  int intelligence;
  int wisdom;
  int charm;
  Atributes({
    this.strenght,
    this.dexterity,
    this.constitution,
    this.intelligence,
    this.wisdom,
    this.charm,
  });

  Atributes.fromJson(Map<String, dynamic> json) {
    charm = json['charm'];
    constitution = json['constitution'];
    dexterity = json['dexterity'];
    intelligence = json['intelligence'];
    strenght = json['strenght'];
    wisdom = json['wisdom'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['charm'] = this.charm;
    data['constitution'] = this.constitution;
    data['dexterity'] = this.dexterity;
    data['intelligence'] = this.intelligence;
    data['strenght'] = this.strenght;
    data['wisdom'] = this.wisdom;
    return data;
  }
}
