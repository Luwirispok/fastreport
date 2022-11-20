abstract class DataRepository {
  ///Получение всех шаблонов
  ///
  /// /api/rp/v1/DataSources/Folder/{id}/CountFolderAndFiles[?searchPattern&useRegex]
  getAllData(String id) {}

  ///Создание шаблона
  ///
  /// /api/rp/v1/DataSources/Folder/{id}/File
  createDataSources(String id, String name, String base64, String typeFile) {}
  readDataSources() {}
  updateDataSources(String fileId, String name) {}
  deleteDataSources(String id) {}
  readyDataSourcesReport() {}
  exportDataSources() {}
  downloadDataSources() {}
}

abstract class GetIdentRepository {
  ///Получение id Папки
  ///
  /// https://fastreport.cloud/api/rp/v1/DataSources/Root
  getIdForFolder() {}
}
