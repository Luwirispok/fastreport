import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fastreport/data/repositories/apiRequests.dart';
import 'package:fastreport/domain/repositories/docum/templates.dart';

class TemplatesRepositoryImpl implements TemplatesRepository {
  @override
  getAllTemplates(id) async {
    await ApiRequest.getApiHelper(
      Dio(),
      {'': ''},
      '/api/rp/v1/Templates/Folder/$id/ListFolderAndFiles?skip=0&take=99&orderBy=None&desc=false&searchPattern=',
    );
  }

  @override
  createTemplate(id, name, base64) {
    log(id);
    log(name);
    log(base64);
    ApiRequest.postApiHelper(
      Dio(),
      {"name": '$name.frx', 'content': '$base64'},
      '/api/rp/v1/Templates/Folder/$id/File',
    );
  }

  readTemplate() {}
  updateTemplate() {}
  deleteTemplate() {}
  readyTemplateReport() {}
  exportTemplate() {}
  downloadTEmplate() {}
}
