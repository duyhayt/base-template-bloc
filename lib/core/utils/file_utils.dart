import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

///Tạo một folder TRONG CACHE và return path
Future<String> createCacheFolder({required folderName}) async {
  final tempDir = await getTemporaryDirectory();
  final dir = Directory('${tempDir.path}/$folderName');
  var status = await Permission.storage.request();
  if (!status.isGranted) {
    await Permission.storage.request();
  }
  if ((await dir.exists())) {
    return dir.path;
  } else {
    dir.create();
    return dir.path;
  }
}

///Xóa một folder TRONG CACHE và return path
void clearCacheFolder({required folderName}) async {
  final tempDir = await getTemporaryDirectory();
  final dir = Directory('${tempDir.path}/$folderName');
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }
  dir.deleteSync(recursive: true);
  dir.create();
}