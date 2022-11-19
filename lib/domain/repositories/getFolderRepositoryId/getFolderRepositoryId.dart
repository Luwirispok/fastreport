import 'package:dio/dio.dart';
import 'package:fastreport/data/repositories/apiRequests.dart';
import 'package:fastreport/domain/repositories/docum/templates.dart';

class GetIdentRepositoryImp implements GetIdentRepository {
  @override
  getIdForFolder() async {
    return ApiRequest.getApiHelper(
      Dio(),
      {'': ''},
      '/api/rp/v1/Templates/Root',
    );
  }
}
