import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_itachi/util/handle_error_utils.dart';
import 'package:flutter_itachi/util/log_utils.dart';
import 'package:sp_util/sp_util.dart';

Future<void> main() async {

  /// sp初始化
  await SpUtil.getInstance();

  /// 1.22 预览功能: 在输入频率与显示刷新率不匹配情况下提供平滑的滚动效果
  // GestureBinding.instance?.resamplingEnabled = true;
  /// 异常处理
  handleError(() => runApp(MyApp()));

  /// 隐藏状态栏。为启动页、引导页设置。完成后修改回显示状态栏。
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
}

class MyApp extends StatelessWidget {
  MyApp({key? key, this.home, this.theme}) : super(key: key) {
    Log.init();
    // initDio();
    // Routes.initRoutes();
    // initQuickActions();
  }

  final Widget? home;
  final ThemeData? theme;
}

