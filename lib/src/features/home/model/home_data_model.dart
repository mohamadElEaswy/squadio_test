import 'package:json_annotation/json_annotation.dart';

part 'home_data_model.g.dart';

// HomeData welcomeFromJson(String str) => HomeData.fromJson(json.decode(str));

// String welcomeToJson(HomeData data) => json.encode(data.toJson());
@JsonSerializable()
class HomeData {
  HomeData({
    required this.page,
    required this.results,
    this.totalResults,
    this.totalPages,
  });

  int page;
  List<Result> results;
  int? totalResults;
  int? totalPages;

  factory HomeData.fromJson(Map<String, dynamic> json) =>
      _$HomeDataFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataToJson(this);
}

@JsonSerializable()
class Result {
  Result({
    this.profilePath,
    required this.adult,
    required this.id,
    // required this.knownFor,
    required this.name,
    required this.popularity,
  });

  String? profilePath;
  bool adult;
  int id;
  //  List<PopularPerson> knownFor;
  String name;
  double popularity;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class PopularPerson {
  PopularPerson({
    this.posterPath,
    this.adult,
    required this.overview,
    // this.releaseDate,
    this.originalTitle,
    required this.genreIds,
    required this.id,
    // required this.mediaType,
    // required this.originalLanguage,
    this.title,
    required this.backdropPath,
    this.popularity,
    required this.voteCount,
    // required this.video,
    required this.voteAverage,
    this.firstAirDate,
    // required this.originCountry,
    this.name,
    this.originalName,
  });

  String? posterPath;
  bool? adult;
  String overview;
  // DateTime? releaseDate;
  String? originalTitle;
  List<int> genreIds;
  int id;
  // MediaType mediaType;
  // OriginalLanguage originalLanguage;
  String? title;
  String backdropPath;
  double? popularity;
  int voteCount;
  // bool video;
  dynamic voteAverage;
  DateTime? firstAirDate;
  // List<String> originCountry;
  String? name;
  String? originalName;

  factory PopularPerson.fromJson(Map<String, dynamic> json) =>
      _$PopularPersonFromJson(json);

  Map<String, dynamic> toJson() => _$PopularPersonToJson(this);
}
