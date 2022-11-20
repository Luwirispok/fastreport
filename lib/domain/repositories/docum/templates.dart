abstract class TemplatesRepository {
  ///Получение всех шаблонов
  ///
  /// /api/rp/v1/Exports/Folder/{id}/CountFolderAndFiles[?searchPattern&useRegex]
  getAllTemplates(String id) {}

  ///Создание шаблона
  ///
  /// /api/rp/v1/Templates/Folder/{id}/File
  createTemplate(String id, String name, String base64) {}
  readTemplate() {}
  updateTemplate(String fileId, String name) {}
  deleteTemplate(String id) {}
  readyTemplateReport() {}
  exportTemplate() {}
  downloadTemplate() {}
}

abstract class GetIdentRepository {
  ///Получение id Папки
  ///
  /// https://fastreport.cloud/api/rp/v1/Templates/Root
  getIdForFolder() {}
}
