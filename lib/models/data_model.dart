import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.data,
  });

  final List<Data> data;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Data {
  Data({
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  final String name;
  final String email;
  final String phoneNumber;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    email: json["email"],
    phoneNumber: json["phonenUmber"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phonenUmber": phoneNumber,
  };
}