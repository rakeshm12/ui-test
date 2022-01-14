
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ui_test/models/data_model.dart';

class JsonData{
  Future<DataModel> fetchData(BuildContext ctx) async {
    final data = await DefaultAssetBundle.of(ctx).loadString('assets/task.json');
    final body = json.decode(data);

    return DataModel.fromJson(body);
  }
}