import 'package:json_annotation/json_annotation.dart';

part 'images_model.g.dart';

@JsonSerializable()
class ImagesModel {
  ImagesModel({
    required this.id,
    required this.profiles,
  });

  final int id;
  final List<Profile> profiles;

  factory ImagesModel.fromJson(Map<String, dynamic> json) => _$ImagesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesModelToJson(this);
}

@JsonSerializable()
class Profile {
  Profile({
    required this.aspectRatio,
    required this.height,
    required this.iso6391,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  final double aspectRatio;
  final int height;
  final dynamic iso6391;
  final String filePath;
  final double voteAverage;
  final int voteCount;
  final int width;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
