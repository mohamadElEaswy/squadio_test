import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:squadio_test/src/features/details/domain/model/details_model.dart';
import 'package:squadio_test/src/features/details/domain/model/images_model.dart';
import 'package:squadio_test/src/network/network.dart';

class DetailsProvider extends ChangeNotifier {
  final String data = '  الحمد لله';

  DetailsModel? singleDetailModel;

  bool loading = true;
  bool error = false;

  Future<DetailsModel> getPersonDetails(String personId) async {
    singleDetailModel = null;
    // loading = true;
    Response response =
        await NetworkHelper.getDetalsData(url: 'person/$personId');
    singleDetailModel = DetailsModel.fromJson(response.data);
    await getImages(personId);
    if (response.statusCode == 200) {
      loading = false;
      notifyListeners();
    } else {
      error = true;
      notifyListeners();
    }
    return DetailsModel.fromJson(response.data);
  }

  ImagesModel? imagesModel;

  Future<ImagesModel> getImages(String personId) async {
    imagesModel = null;
    Response response = await NetworkHelper.getImagesList(personId);
    imagesModel = ImagesModel.fromJson(response.data);
    notifyListeners();
    return ImagesModel.fromJson(response.data);
  }
}
