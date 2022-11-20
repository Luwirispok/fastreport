import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fastreport/data/repositories/apiRequests.dart';
import 'package:fastreport/domain/repositories/docum/reports.dart';

class ReportsRepositoryImpl implements ReportsRepository {

  Future<Map<String, dynamic>> getCountReports(id) async {
    return await ApiRequest.getApiHelper(
      Dio(),
      {'': ''},
      '/api/rp/v1/Reports/Folder/$id/CountFolderAndFiles',
    );
  }

  @override
  getAllReports(id, take) async {
    take = int.parse(take) > 120 ? '120' : take;
    return await ApiRequest.getApiHelper(
      Dio(),
      {'': ''},
      '/api/rp/v1/Reports/Folder/$id/ListFolderAndFiles?take=$take',
    );
  }

  @override
  createReport(id, name, base64) async {
    await ApiRequest.postApiHelper(
      Dio(),
      {"name": "$name", "content": "$base64"},
      '/api/rp/v1/Reports/Folder/$id/File',
    );
  }

  @override
  readReport() async {}

  @override
  updateReport(
      String id,
      String name,
      ) async {
    await ApiRequest.putApiHelper(
      dio: Dio(),
      path: '/api/rp/v1/Reports/File/$id/Rename',
      data: {"name": "$name.frx"},
    );
  }

  @override
  deleteReport(
      String id,
      ) async {
    await ApiRequest.deleteApiHelper(
      dio: Dio(),
      path: '/api/rp/v1/Reports/File/$id/ToBin',
    );
  }

  exportReport() {}
  downloadReport() {}
  readyReportReport() {}
}
