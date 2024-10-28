import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as path_provider;

/// アプリケーションのドキュメントディレクトリのパスを取得する。
///
/// `web` の場合は空文字を返す。
Future<String> getApplicationDocumentsDirectoryPath() async {
  if (kIsWeb) {
    return '';
  } else {
    final directory = await path_provider.getApplicationDocumentsDirectory();
    return directory.path;
  }
}

/// ファイルパスを取得する。
///
/// `web` の場合はファイル名をそのまま返す。
///
/// `web` 以外の場合はドキュメントディレクトリにファイル名を結合したパスを返す。
Future<String> getFilePath(String fileName) async {
  final directoryPath = await getApplicationDocumentsDirectoryPath();
  if (kIsWeb) {
    return fileName;
  } else {
    return p.join(directoryPath, fileName);
  }
}
