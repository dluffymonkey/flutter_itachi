import 'package:fluro/fluro.dart';
import 'package:fluro/src/fluro_router.dart';
import 'package:flutter_itachi/routers/i_router.dart';
import 'package:flutter_itachi/shop/select_address_page.dart';

class ShopRouter implements IRouterProvider {

  static String addressSelectPage = '/shop/addressSelect';

  @override
  void initRouter(FluroRouter router) {
    router.define(addressSelectPage, handler: Handler(handlerFunc: (_, __) => const AddressSelectPage()));
  }


}