abstract class ExportsRepository {
  ///Получение всех шаблонов
  ///
  /// /api/rp/v1/Exports/Folder/{id}/CountFolderAndFiles[?searchPattern&useRegex]
  getAllExports(String id, String take) {}

  ///Создание шаблона
  ///
  /// /api/rp/v1/Exports/Folder/{id}/File
  createExport(String id, String name, String base64) {}
  readExport() {}
  updateExport(String fileId, String name) {}
  deleteExport(String id) {}
  readyExportReport() {}
  exportExport() {}
  downloadExport() {}
}

abstract class GetIdentRepository {
  ///Получение id Папки
  ///
  /// https://fastreport.cloud/api/rp/v1/Exports/Root
  getIdForFolder() {}
}
