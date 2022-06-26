// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeData _$HomeDataFromJson(Map<String, dynamic> json) => HomeData(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: json['total_results'] as int?,
      totalPages: json['total_pages'] as int?,
    );

Map<String, dynamic> _$HomeDataToJson(HomeData instance) => <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      profilePath: json['profile_path'] as String?,
      adult: json['adult'] as bool,
      id: json['id'] as int,
      // knownFor: json['known_for'] != null ?
      //     (json['known_for'])
      //         .map((e) => PopularPerson.fromJson(e as Map<String, dynamic>))
      //         .toList() : null,
      name: json['name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'profile_path': instance.profilePath,
      'adult': instance.adult,
      'id': instance.id,
      // 'known_for': instance.knownFor,
      'name': instance.name,
      'popularity': instance.popularity,
    };

PopularPerson _$PopularPersonFromJson(Map<String, dynamic> json) =>
    PopularPerson(
      posterPath: json['poster_path'] as String?,
      adult: json['adult'],
      overview: json['overview'] as String,
      originalTitle: json['original_title'] as String?,
      genreIds:
          (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      id: json['id'] as int,
      title: json['title'] as String?,
      backdropPath: json['backdrop_path'] as String,
      popularity: (json['popularity'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int,
      // video: json['video'] as bool,
      voteAverage: json['vote_average'],
      firstAirDate: json['first_air_date'] == null
          ? null
          : DateTime.parse(json['first_air_date'] as String),
      name: json['name'] as String?,
      originalName: json['original_name'] as String?,
    );

Map<String, dynamic> _$PopularPersonToJson(PopularPerson instance) =>
    <String, dynamic>{
      'poster_path': instance.posterPath,
      'adult': instance.adult,
      'overview': instance.overview,
      'original_title': instance.originalTitle,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'title': instance.title,
      'backdrop_path': instance.backdropPath,
      'popularity': instance.popularity,
      'vote_count': instance.voteCount,
      // 'video': instance.video,
      'vote_average': instance.voteAverage,
      'first_air_date': instance.firstAirDate?.toIso8601String(),
      'name': instance.name,
      'original_name': instance.originalName,
    };