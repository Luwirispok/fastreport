import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fastreport/data/repositories/apiRequests.dart';
import 'package:fastreport/domain/repositories/docum/templates.dart';

class TemplatesRepositoryImpl implements TemplatesRepository {
  @override
  getAllTemplates(id) async {
    return await ApiRequest.getApiHelper(
      Dio(),
      {'': ''},
      '/api/rp/v1/Templates/Folder/$id/ListFolderAndFiles?skip=0&take=99&orderBy=None&desc=false&searchPattern=',
    );
  }

  @override
  createTemplate(id, name, base64) async {
    await ApiRequest.postApiHelper(
      Dio(),
      {"name": "$name", "content": "$base64"},
      '/api/rp/v1/Templates/Folder/$id/File',
    );
  }

  @override
  readTemplate() async {}

  @override
  updateTemplate(
    String id,
    String name,
  ) async {
    await ApiRequest.putApiHelper(
      dio: Dio(),
      path: '/api/rp/v1/Templates/File/$id/Rename',
      data: {"name": "$name.frx"},
    );
  }

  @override
  deleteTemplate(
    String id,
  ) async {
    await ApiRequest.deleteApiHelper(
      dio: Dio(),
      path: '/api/rp/v1/Templates/File/$id/ToBin',
    );
  }

  exportTemplate() {}
  downloadTemplate() {}
  readyTemplateReport() {}
}
