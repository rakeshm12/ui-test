import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ui_test/models/data_model.dart';

class DataController extends GetxController {
  Future<DataModel> fetchData() async {
    final data = await rootBundle.loadString('assets/task.json');
    final body = json.decode(data);

    return DataModel.fromJson(body);
  }
}
