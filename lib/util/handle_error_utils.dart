import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_itachi/res/constant.dart';

void handleError(void Function() body) {
  /// 重写Flutter异常回调
  FlutterError.onError = (FlutterErrorDetails details) {
    if (!Constant.inProduction) {
      /// Debug时，直接将异常信息打印
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    }
  };

  /// 使用runZonedGuarded捕获Flutter未捕获的异常
  runZonedGuarded(body, (Object error, StackTrace stackTrace) async {
    await _reportError(error, stackTrace);
  });
}

Future<void> _reportError(Object error, StackTrace stackTrace) async {
  if (!Constant.inProduction) {
    debugPrintStack(
      stackTrace: stackTrace,
      label: error.toString(),
      maxFrames: 100,
    );
  } else {
    /// 将异常信息收集并上传到服务器。可以直接使用类似`flutter_bugly`插件处理异常上报
  }
}