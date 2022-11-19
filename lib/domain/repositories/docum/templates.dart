abstract class TemplatesRepository {
  ///Получение всех шаблонов
  ///
  /// /api/rp/v1/Exports/Folder/{id}/CountFolderAndFiles[?searchPattern&useRegex]
  getAllTemplates(String id) {}

  ///Создание шаблона
  ///
  /// /api/rp/v1/Templates/Folder/{id}/File
  createTemplate() {}
  readTemplate() {}
  updateTemplate() {}
  deleteTemplate() {}
  readyTemplateReport() {}
  exportTemplate() {}
  downloadTEmplate() {}
}

abstract class GetIdentRepository {
  ///Получение id Папки
  ///
  /// https://fastreport.cloud/api/rp/v1/Templates/Root
  getIdForFolder() {}
}
