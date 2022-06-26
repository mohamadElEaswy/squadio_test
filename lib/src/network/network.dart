import 'package:dio/dio.dart';

class NetworkHelper {
  static Dio? dio;
  static const _imageUrl = 'https://image.tmdb.org/t/p/w500/';
  static String imageUrl(String path) => _imageUrl + path;

  static String imagesUrl(String id) => 'person/$id/images?api_key=$apiKey';

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

// https://api.themoviedb.org/3/83056528c7a4f5e750fb0e302e0a5c9f/person/popular/
  static const String apiKey = '83056528c7a4f5e750fb0e302e0a5c9f';
  static Future<Response> getHomeData({
    required String url,
    int? page,
  }) async {
    return await dio!.get('$url?api_key=$apiKey&page=$page');
  }

  static Future<Response> getDetalsData({
    required String url,
  }) async {
    return await dio!.get('$url?api_key=$apiKey');
  }

  static Future<Response> getImagesList(String id) async {
    return await dio!.get(imagesUrl(id));
  }

  // static Stream<Response<dynamic>> getStreamData({
  //   required String url,
  //   // Map<String, dynamic>? query,
  //   String lang = 'en',
  //   // required int page,
  //   // String? token = '',
  // }) async* {
  //   // dio!.options.headers = {
  //   //   'Content-Type': 'application/json',
  //   //   'lang': lang,
  //   //   'Authorization': token,
  //   // };
  //   yield* Stream.periodic(
  //     const Duration(seconds: 1),
  //     (_) {
  //       return dio!.get('$url?api_key=$apiKey');
  //     },
  //   ).asyncMap((event) async => await event);
  // }
}
