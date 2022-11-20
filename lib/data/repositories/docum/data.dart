import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fastreport/data/repositories/apiRequests.dart';
import 'package:fastreport/domain/repositories/docum/data.dart';

class DataRepositoryImpl {
  Future<Map<String, dynamic>> getCountData(String id) async {
    return await ApiRequest.getApiHelper(
      Dio(),
      {
        'subscription id': id,
        'take': 19,
      },
      '/api/data/v1/DataSources',
    );
  }

  getAllData(String id) async {
    return await ApiRequest.getApiHelper(
      Dio(),
      {
        'subscription id': id,
        'take': 120,
      },
      '/api/data/v1/DataSources',
    );
  }

  createDataSources(String subscriptionId, String name, String base64, String typeFile) async {
    log(
      {
        "name": "$name",
        "connectionString": "$base64",
        'subscriptionId': subscriptionId,
        "connectionType": typeFile,
      }.toString(),
    );
    await ApiRequest.postApiHelper(
      Dio(),
      {
        "name": "$name",
        "connectionString": "$base64",
        'subscriptionId': subscriptionId,
        "connectionType": typeFile,
      },
      '/api/data/v1/DataSources',
    );
  }

  @override
  readDataSources() async {}

  updateDataSources(
    String id,
    String dataUpdate,
  ) async {
    await ApiRequest.putApiHelper(
      dio: Dio(),
      path: '/api/data/v1/DataSources/$id/ConnectionString',
      data: {"connectionString": dataUpdate},
    );
  }

  renameDataSources(
    String id,
    String newName,
  ) async {
    await ApiRequest.putApiHelper(
      dio: Dio(),
      path: '/api/data/v1/DataSources/$id/rename',
      data: {"name": newName},
    );
  }

  deleteDataSources(
    String id,
  ) async {
    await ApiRequest.deleteApiHelper(
      dio: Dio(),
      path: '/api/data/v1/DataSources/$id',
    );
  }

  exportDataSources() {}

  downloadDataSources() {}

  readyDataSourcesReport() {}
}
