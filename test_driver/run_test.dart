import 'dart:io';

Future<void> main() async {
  print('== テスト開始 ==');

//  final outputFile = File('test_driver/test_output.txt');

  // String deviceListCommand = 'xcrun xctrace list devices';

  // var deviceListCommandResult =
  //     await Process.run('bash', ['-c', deviceListCommand]);

  // print(deviceListCommandResult.stdout);

  // // ユーザーにデバイスIDを選択させる
  // print('使用するデバイスIDを選択してください（コピペするかIDを入力してください）:');
  // final deviceId = stdin.readLineSync()?.trim() ?? '';

  // if (deviceId.isEmpty) {
  //   logger.i('デバイスIDが無効です。プログラムを終了します。');
  //   return;
  // }

  const deviceId = '9310372C-A2A6-48B6-8487-61808CC636B7';

  //テストを実行する
  String command =
      'flutter drive --driver=test_driver/integration_test.dart --target=integration_test/example_test.dart -d $deviceId';

  var result = await Process.run('bash', ['-c', command]);

  if (result.stderr.isNotEmpty) {
    print('=== エラー発生 ===');
    print(result.stderr);
  }

//   try {
// //    await outputFile.writeAsString(result.stdout);
// //    print('ログがファイルに保存されました: ${outputFile.path}');
//   } catch (e) {
//     print('ファイルへの書き込み中にエラーが発生しました: $e');
//   }
  print('== テスト終了 ==');
}
