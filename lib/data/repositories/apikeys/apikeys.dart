import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fastreport/data/repositories/apiRequests.dart';
import 'package:fastreport/domain/repositories/docum/templates.dart';

import '../../../domain/repositories/apikeys/apikeys.dart';

class ApiKeysImpl implements ApiKeysRepository {
  @override
  getAllTokens() async {
    return await ApiRequest.getApiHelper(
      Dio(),
      {'': ''},
      '/api/manage/v1/ApiKeys',
    );
  }
}
