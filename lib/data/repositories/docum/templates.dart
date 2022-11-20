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
    String fileId,
    String name,
  ) async {
    await ApiRequest.postApiHelper(
      Dio(),
      {"name": "$name.frx"},
      '/api/rp/v1/Templates/File/$fileId/Rename',
    );
  }

  deleteTemplate() {}
  readyTemplateReport() {}
  exportTemplate() {}
  downloadTEmplate() {}
}
