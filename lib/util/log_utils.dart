import 'dart:convert' as convert;
import 'package:common_utils/common_utils.dart';
import 'package:flutter_itachi/res/constant.dart';

class Log {
  static const String tag = 'ITACHI-LOG';

  static void init() {
    LogUtil.init(isDebug: !Constant.inProduction);
  }

  static void d(String msg, {String tag = tag}) {
    if (!Constant.inProduction) {
      LogUtil.v(msg, tag: tag);
    }
  }

  static void e(String msg, {String tag = tag}) {
    if (!Constant.inProduction) {
      LogUtil.e(msg, tag: tag);
    }
  }

  static void json(String msg, {String tag = tag}) {
    if (!Constant.inProduction) {
      try {
        final dynamic data = convert.json.decode(msg);
        if (data is Map) {
        }
      } catch(e) {
        LogUtil.e(msg, tag: tag);
      }
    }
  }

  // https://github.com/Milad-Akarie/pretty_dio_logger
  static void _printMap(Map data, {String tag = tag, int tabs = 1, bool isListItem = false, bool isLast = false}) {

  }

  // https://github.com/Milad-Akarie/pretty_dio_logger
  static void _printList(List list, {String tag = tag, int tabs = 1}) {

  }

  static String _indent([int tabCount = 1]) => '  ' * tabCount;
}

