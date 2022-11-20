import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fastreport/data/repositories/apiRequests.dart';
import 'package:fastreport/domain/repositories/docum/exports.dart';

class ExportsRepositoryImpl implements ExportsRepository {

  Future<Map<String, dynamic>> getCountExports(id) async {
    return await ApiRequest.getApiHelper(
      Dio(),
      {'': ''},
      '/api/rp/v1/Exports/Folder/$id/CountFolderAndFiles',
    );
  }

  @override
  getAllExports(id, take) async {
    take = int.parse(take) > 120 ? '120' : take;
    return await ApiRequest.getApiHelper(
      Dio(),
      {'': ''},
      '/api/rp/v1/Exports/Folder/$id/ListFolderAndFiles?take=$take',
    );
  }

  @override
  createExport(id, name, base64) async {
    await ApiRequest.postApiHelper(
      Dio(),
      {"name": "$name", "content": "$base64"},
      '/api/rp/v1/Exports/Folder/$id/File',
    );
  }

  @override
  readExport() async {}

  @override
  updateExport(
      String id,
      String name,
      ) async {
    await ApiRequest.putApiHelper(
      dio: Dio(),
      path: '/api/rp/v1/Exports/File/$id/Rename',
      data: {"name": "$name.frx"},
    );
  }

  @override
  deleteExport(
      String id,
      ) async {
    await ApiRequest.deleteApiHelper(
      dio: Dio(),
      path: '/api/rp/v1/Exports/File/$id/ToBin',
    );
  }

  exportExport() {}
  downloadExport() {}
  readyExportReport() {}
}
