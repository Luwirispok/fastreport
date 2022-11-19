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

  createTemplate() {}
  readTemplate() {}
  updateTemplate() {}
  deleteTemplate() {}
  readyTemplateReport() {}
  exportTemplate() {}
  downloadTEmplate() {}
}
