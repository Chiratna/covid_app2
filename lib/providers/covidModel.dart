import 'dart:convert';

CovidIndia covidIndiaFromJson(String str) =>
    CovidIndia.fromJson(json.decode(str));

class CovidIndia {
  CovidIndia({
    this.statewise,
  });
  List<Statewise> statewise;

  factory CovidIndia.fromJson(Map<String, dynamic> json) => CovidIndia(
        statewise: List<Statewise>.from(
            json["statewise"].map((x) => Statewise.fromJson(x))),
      );
}

class Statewise {
  Statewise({
    this.active,
    this.confirmed,
    this.deaths,
    this.deltaconfirmed,
    this.deltadeaths,
    this.deltarecovered,
    this.lastupdatedtime,
    this.migratedother,
    this.recovered,
    this.state,
    this.statecode,
    this.statenotes,
  });

  String active;
  String confirmed;
  String deaths;
  String deltaconfirmed;
  String deltadeaths;
  String deltarecovered;
  String lastupdatedtime;
  String migratedother;
  String recovered;
  String state;
  String statecode;
  String statenotes;

  factory Statewise.fromJson(Map<String, dynamic> json) => Statewise(
        active: json["active"],
        confirmed: json["confirmed"],
        deaths: json["deaths"],
        deltaconfirmed: json["deltaconfirmed"],
        deltadeaths: json["deltadeaths"],
        deltarecovered: json["deltarecovered"],
        lastupdatedtime: json["lastupdatedtime"],
        migratedother: json["migratedother"],
        recovered: json["recovered"],
        state: json["state"],
        statecode: json["statecode"],
        statenotes: json["statenotes"],
      );
}
