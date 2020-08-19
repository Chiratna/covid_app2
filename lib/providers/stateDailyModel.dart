import 'dart:convert';

Daily dailyFromJson(String str) => Daily.fromJson(json.decode(str));

class Daily {
  Daily({
    this.statesDaily,
  });

  List<StatesDaily> statesDaily;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        statesDaily: List<StatesDaily>.from(
            json["states_daily"].map((x) => StatesDaily.fromJson(x))),
      );
}

class StatesDaily {
  StatesDaily({
    this.stateDetails,
    this.status,
  });
  Map<String, dynamic> stateDetails;
  Status status;

  factory StatesDaily.fromJson(
    Map<String, dynamic> json,
  ) =>
      StatesDaily(
        status: statusValues.map[json['status']],
        stateDetails: json,
      );
}

enum Status { CONFIRMED, RECOVERED, DECEASED }

final statusValues = EnumValues({
  "Confirmed": Status.CONFIRMED,
  "Deceased": Status.DECEASED,
  "Recovered": Status.RECOVERED
});

class EnumValues<T> {
  Map<String, T> map;
  EnumValues(this.map);
}

class StateDetails {
  String code;
  int cases;

  StateDetails({
    this.code,
    this.cases,
  });
}
