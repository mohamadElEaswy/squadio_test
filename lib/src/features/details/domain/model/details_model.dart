// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'details_model.g.dart';

@JsonSerializable()
class DetailsModel {
  DetailsModel({
    required this.adult,
    required this.alsoKnownAs,
    required this.biography,
    required this.birthday,
    required this.deathday,
    required this.gender,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.knownForDepartment,
    required this.name,
    required this.placeOfBirth,
    required this.popularity,
    required this.profilePath,
  });

  final bool adult;
  final List<String> alsoKnownAs;
  final String biography;
  final DateTime birthday;
  final dynamic deathday;
  final int gender;
  final dynamic homepage;
  final int id;
  final String imdbId;
  final String knownForDepartment;
  final String name;
  final String placeOfBirth;
  final double popularity;
  final String profilePath;

  factory DetailsModel.fromJson(Map<String, dynamic> json) =>
      _$DetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsModelToJson(this);
}
