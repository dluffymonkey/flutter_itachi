import 'package:fluro/fluro.dart';
import 'package:flutter_itachi/routers/i_router.dart';
import 'package:flutter_itachi/store/page/store_audit_page.dart';

class StoreRouter implements IRouterProvider {
  static String auditPage = '/store/audit';
  static String auditResultPage = '/store/auditResult';

  void initRouter(FluroRouter router) {
    router.define(auditPage, handler: Handler(handlerFunc: (_, __) => const StoreAuditPage()));
  }
}