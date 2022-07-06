import 'dart:convert';
import 'dart:io';

class SuperHero {
  String name, secretIdentity;
  int age;
  List powers;

  SuperHero.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        secretIdentity = json["secretIdentity"],
        age = json["age"],
        powers = [];

  toString() => "SuperHero($name, $secretIdentity, $age)";
}

void main() {
  var file = File("data/hero.json");
  var text = file.readAsStringSync();
  var json = jsonDecode(text);

  List<SuperHero> superHeros = [];

  for (var jsonMember in json["members"]) {
    superHeros.add(SuperHero.fromJson(jsonMember));
  }

  for (var superHero in superHeros) {
    print(superHero);
  }
}
