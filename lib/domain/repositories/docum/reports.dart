abstract class ReportsRepository {
  ///Получение всех шаблонов
  ///
  /// /api/rp/v1/Exports/Folder/{id}/CountFolderAndFiles[?searchPattern&useRegex]
  getAllReports(String id, String take) {}

  ///Создание шаблона
  ///
  /// /api/rp/v1/Reports/Folder/{id}/File
  createReport(String id, String name, String base64) {}
  readReport() {}
  updateReport(String fileId, String name) {}
  deleteReport(String id) {}
  readyReportReport() {}
  exportReport() {}
  downloadReport() {}
}

abstract class GetIdentRepository {
  ///Получение id Папки
  ///
  /// https://fastreport.cloud/api/rp/v1/Reports/Root
  getIdForFolder() {}
}
