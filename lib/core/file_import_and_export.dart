import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';

class FileImportAndExport {
  Future<Map<String, dynamic>?> importFileToBase64() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      log(file.name);
      log(file.bytes.toString());
      log(file.size.toString());
      log(file.extension.toString());
      log(file.path.toString());
    }

    if (result != null) {
      File file = File(result.files.single.path!);
      // log(file.toString());
      var fileBytes = file.readAsBytesSync();
      // log(fileBytes.toString());
      String base64 = base64Encode(fileBytes);
      log(base64);
      return {
        'base64': base64,
        'name': result.files.first.name,
      };
    } else {
      return null;
    }
  }

  Future<String?> selectDirToSaveFile() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    log(selectedDirectory ?? '');
    return selectedDirectory;
  }

  // Future<String> getFilePath({String? catalog}) async {
  //   String appDocumentsPath;
  //   if(catalog == null){
  //     Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
  //     appDocumentsPath = '${appDocumentsDirectory.path}/export';
  //   } else {
  //     appDocumentsPath = catalog;
  //   }
  //     String filePath = '$catalog/text.txt';
  //     await Directory('$catalog/ttt').create();
  //     log(appDocumentsPath);
  //     return filePath;
  //
  // }
  //
  // void saveFile() async {
  //   // await FileSaver.instance.saveFile('text', Uint8List.fromList('elements'.codeUnits) , 'png');
  //   File file = File(await getFilePath());
  //   log(file.path);
  //   file.writeAsString("This is my demo text that will be saved to : demoTextFile.txt");
  // }
}
