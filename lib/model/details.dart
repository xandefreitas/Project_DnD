class Details {
  String index;
  String name;
  int hitDie;
  List<ProficiencyChoices> proficiencyChoices;
  List<Proficiencies> proficiencies;
  List<SavingThrows> savingThrows;
  String startingEquipment;
  String classLevels;
  List<Subclasses> subclasses;
  Spellcasting spellcasting;
  String spells;
  String url;

  Details({
    this.index,
    this.name,
    this.hitDie,
    this.proficiencyChoices,
    this.proficiencies,
    this.savingThrows,
    this.startingEquipment,
    this.classLevels,
    this.subclasses,
    this.spellcasting,
    this.spells,
    this.url,
  });

  Details.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    name = json['name'];
    hitDie = json['hit_die'];
    if (json['proficiency_choices'] != null) {
      proficiencyChoices = <ProficiencyChoices>[];
      json['proficiency_choices'].forEach((v) {
        proficiencyChoices.add(new ProficiencyChoices.fromJson(v));
      });
    }
    if (json['proficiencies'] != null) {
      proficiencies = <Proficiencies>[];
      json['proficiencies'].forEach((v) {
        proficiencies.add(new Proficiencies.fromJson(v));
      });
    }
    if (json['saving_throws'] != null) {
      savingThrows = <SavingThrows>[];
      json['saving_throws'].forEach((v) {
        savingThrows.add(new SavingThrows.fromJson(v));
      });
    }
    startingEquipment = json['starting_equipment'];
    classLevels = json['class_levels'];
    if (json['subclasses'] != null) {
      subclasses = <Subclasses>[];
      json['subclasses'].forEach((v) {
        subclasses.add(new Subclasses.fromJson(v));
      });
    }
    spellcasting = json['spellcasting'] != null
        ? new Spellcasting.fromJson(json['spellcasting'])
        : null;
    spells = json['spells'];
    url = json['url'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['index'] = this.index;
  //   data['name'] = this.name;
  //   data['hit_die'] = this.hitDie;
  //   if (this.proficiencyChoices != null) {
  //     data['proficiency_choices'] =
  //         this.proficiencyChoices.map((v) => v.toJson()).toList();
  //   }
  //   if (this.proficiencies != null) {
  //     data['proficiencies'] =
  //         this.proficiencies.map((v) => v.toJson()).toList();
  //   }
  //   if (this.savingThrows != null) {
  //     data['saving_throws'] = this.savingThrows.map((v) => v.toJson()).toList();
  //   }
  //   data['starting_equipment'] = this.startingEquipment;
  //   data['class_levels'] = this.classLevels;
  //   if (this.subclasses != null) {
  //     data['subclasses'] = this.subclasses.map((v) => v.toJson()).toList();
  //   }
  //   data['url'] = this.url;
  //   return data;
  // }
}

class Proficiencies {
  String index;
  String name;
  String url;

  Proficiencies({
    this.index,
    this.name,
    this.url,
  });

  Proficiencies.fromJson(Map<String, dynamic> json) {
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

class SavingThrows {
  String index;
  String name;
  String url;

  SavingThrows({
    this.index,
    this.name,
    this.url,
  });

  SavingThrows.fromJson(Map<String, dynamic> json) {
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

class Subclasses {
  String index;
  String name;
  String url;

  Subclasses({
    this.index,
    this.name,
    this.url,
  });

  Subclasses.fromJson(Map<String, dynamic> json) {
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

class ProficiencyChoices {
  int choose;
  String type;
  List<From> from;

  ProficiencyChoices({
    this.choose,
    this.type,
    this.from,
  });

  ProficiencyChoices.fromJson(Map<String, dynamic> json) {
    choose = json['choose'];
    type = json['type'];
    if (json['from'] != null) {
      from = <From>[];
      json['from'].forEach((v) {
        from.add(new From.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['choose'] = this.choose;
  //   data['type'] = this.type;
  //   if (this.from != null) {
  //     data['from'] = this.from.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class Spellcasting {
  List<Info> info;
  int level;
  From spellcastingAbility;

  Spellcasting({this.info, this.level, this.spellcastingAbility});

  Spellcasting.fromJson(Map<String, dynamic> json) {
    if (json['info'] != null) {
      info = <Info>[];
      json['info'].forEach((v) {
        info.add(new Info.fromJson(v));
      });
    }
    level = json['level'];
    spellcastingAbility = json['spellcasting_ability'] != null
        ? new From.fromJson(json['spellcasting_ability'])
        : null;
  }
}

class From {
  String index;
  String name;
  String url;

  From({
    this.index,
    this.name,
    this.url,
  });

  From.fromJson(Map<String, dynamic> json) {
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

class Info {
  List<String> desc;
  String name;

  Info({this.desc, this.name});

  Info.fromJson(Map<String, dynamic> json) {
    desc = json['desc'].cast<String>();
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desc'] = this.desc;
    data['name'] = this.name;
    return data;
  }
}
