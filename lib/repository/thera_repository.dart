import 'dart:convert';

import 'package:http/http.dart';

import '../model/thera_model.dart';

class TheraRepository {
  Future<dynamic> getData({required int unitId}) async {
    try {
      Uri request = Uri.https("private-919c41-yippy.apiary-mock.com", "thera", {"unit_id": unitId.toString()});
      final response = await get(request);

      if (response.statusCode == 200) {
        return Thera.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> getDetail({required String trxCode}) async {
    try {
      Uri request = Uri.https("private-919c41-yippy.apiary-mock.com", "detail", {"trx_code": trxCode});
      final response = await get(request);

      if (response.statusCode == 200) {
        return TheraDetail.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load data');
    }
  }
}