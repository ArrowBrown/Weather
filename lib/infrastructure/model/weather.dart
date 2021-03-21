import 'dart:convert';

List<Weather> weatherFromJson(String str) => List<Weather>.from(
      json.decode(str).map(
            (x) => Weather.fromJson(x),
          ),
    );
String weatherToJson(List<Weather> data) => json.encode(
      List<dynamic>.from(
        data.map(
          (x) => x.toJson(),
        ),
      ),
    );

class Weather {
  Weather({
    this.inputIndex,
    this.cityStates,
    this.zipcodes,
  });

  int inputIndex;
  List<CityState> cityStates;
  List<Zipcode> zipcodes;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        inputIndex: json["input_index"],
        cityStates: List<CityState>.from(
          json["city_states"].map(
            (x) => CityState.fromJson(x),
          ),
        ),
        zipcodes: List<Zipcode>.from(
          json["zipcodes"].map(
            (x) => Zipcode.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "input_index": inputIndex,
        "city_states": List<dynamic>.from(
          cityStates.map(
            (x) => x.toJson(),
          ),
        ),
        "zipcodes": List<dynamic>.from(
          zipcodes.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class CityState {
  CityState({
    this.city,
    this.stateAbbreviation,
    this.state,
    this.mailableCity,
  });

  String city;
  String stateAbbreviation;
  String state;
  bool mailableCity;

  factory CityState.fromJson(Map<String, dynamic> json) => CityState(
        city: json["city"],
        stateAbbreviation: json["state_abbreviation"],
        state: json["state"],
        mailableCity: json["mailable_city"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "state_abbreviation": stateAbbreviation,
        "state": state,
        "mailable_city": mailableCity,
      };
}

class Zipcode {
  Zipcode({
    this.zipcode,
    this.zipcodeType,
    this.defaultCity,
    this.countyFips,
    this.countyName,
    this.stateAbbreviation,
    this.state,
    this.latitude,
    this.longitude,
    this.precision,
  });

  String zipcode;
  String zipcodeType;
  String defaultCity;
  String countyFips;
  String countyName;
  String stateAbbreviation;
  String state;
  double latitude;
  double longitude;
  String precision;

  factory Zipcode.fromJson(Map<String, dynamic> json) => Zipcode(
        zipcode: json["zipcode"],
        zipcodeType: json["zipcode_type"],
        defaultCity: json["default_city"],
        countyFips: json["county_fips"],
        countyName: json["county_name"],
        stateAbbreviation: json["state_abbreviation"],
        state: json["state"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        precision: json["precision"],
      );

  Map<String, dynamic> toJson() => {
        "zipcode": zipcode,
        "zipcode_type": zipcodeType,
        "default_city": defaultCity,
        "county_fips": countyFips,
        "county_name": countyName,
        "state_abbreviation": stateAbbreviation,
        "state": state,
        "latitude": latitude,
        "longitude": longitude,
        "precision": precision,
      };
}
