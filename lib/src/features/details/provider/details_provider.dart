import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:squadio_test/src/features/details/domain/model/details_model.dart';
import 'package:squadio_test/src/network/network.dart';

class DetailsProvider extends ChangeNotifier {
  final String data = '  الحمد لله';

  late DetailsModel singleDetailModel;
  
  Future<DetailsModel> getPersonDetails(String personId) async {
    Response response =
        await NetworkHelper.getDetalsData(url: 'person/$personId');
        print(response.data);
    return DetailsModel.fromJson(response.data);
  }
}
