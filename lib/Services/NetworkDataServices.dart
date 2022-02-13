import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_practical/Services/AppException.dart';
import 'package:gym_practical/models/GymModel.dart';

class NetworkDataServices{
  BuildContext? context;

  Future<List<GymModel>> getResponse() async {
    dynamic responseJson;
    try {
      // final response = await http.get(Uri.parse(baseUrl));
      // responseJson = returnResponse(response);
      String data = await rootBundle.loadString("assets/data.json");
      responseJson = jsonDecode(data);
      print("responseJson == > " +responseJson.toString());
      final gyms = responseJson['gyms'] as List<dynamic>;
      final listResult = gyms.map((e) => GymModel.fromJson(e)).toList();

      print("this list result "+ listResult.toString());

      print("this response : "+ gyms.toString());

      return listResult;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }
}
