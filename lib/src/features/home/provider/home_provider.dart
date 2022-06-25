import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:squadio_test/src/network/network.dart';
import '../model/home_data_model.dart';

class HomeProvider extends ChangeNotifier {
  late HomeData homeData;
  late List<Result> homeList;
  bool homeLoading = false;
  Future<HomeData> getHomeData() async {
    homeLoading = true;
    notifyListeners();
    Response response = await NetworkHelper.getHomeData(url: 'person/popular');
    HomeData data = HomeData.fromJson(response.data);
    homeData = data;
    homeList = data.results;
    homeLoading = false;
    notifyListeners();
    return data;
  }

  Future getMoreData(int page) async {
    homeLoading = true;
    late HomeData paginationData;
    await NetworkHelper.getHomeData(url: 'person/popular', page: page).then(
      (value) {
        paginationData = HomeData.fromJson(value.data);
        homeList.addAll(paginationData.results);
      },
    );
    homeLoading = false;
    notifyListeners();
  }
}
