import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_itachi/net/dio_utils.dart';
import 'package:flutter_itachi/res/constant.dart';
import 'package:flutter_itachi/routers/not_found_page.dart';
import 'package:flutter_itachi/setting/provider/locale_provider.dart';
import 'package:flutter_itachi/setting/provider/theme_provider.dart';
import 'package:flutter_itachi/util/device_utils.dart';
import 'package:flutter_itachi/util/handle_error_utils.dart';
import 'package:flutter_itachi/util/log_utils.dart';
import 'package:flutter_itachi/util/theme_utils.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_itachi/net/intercept.dart';

Future<void> main() async {
//  debugProfileBuildsEnabled = true;
//  debugPaintLayerBordersEnabled = true;
//  debugProfilePaintsEnabled = true;
//  debugRepaintRainbowEnabled = true;

  /// 确保初始化完成
  WidgetsFlutterBinding.ensureInitialized();

  /// 去除URL中的“#”(hash)，仅针对Web。默认为setHashUrlStrategy
  /// 注意本地部署和远程部署时`web/index.html`中的base标签，https://github.com/flutter/flutter/issues/69760
  setPathUrlStrategy();

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
  MyApp({Key? key, this.home, this.theme}) : super(key: key) {
    Log.init();
    initDio();
    // Routes.initRoutes();
    // initQuickActions();
  }

  final Widget? home;
  final ThemeData? theme;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  void initDio() {
    final List<Interceptor> interceptors = <Interceptor>[];
    
    /// 统一添加身份验证请求头
    interceptors.add(AuthInterceptor());
    
    /// 刷新Token
    interceptors.add(TokenInterceptor());
    
    ///打印Log(生产模式去除)
    if (!Constant.inProduction) {
      interceptors.add(LoggingInterceptor());
    }

    /// 适配数据(根据自己的数据结构，可自行选择添加)
    interceptors.add(AdapterInterceptor());
    configDio(
      baseUrl: 'https://api.github.com/',
      interceptors: interceptors,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget app = MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => LocaleProvider())
        ],
      child: Consumer2<ThemeProvider, LocaleProvider>(
        builder: (_, ThemeProvider provider, LocaleProvider localeProvider, __) {
          return _buildMaterialApp(provider, localeProvider);
        },
      ),
    );

    return OKToast(
      child: app,
      backgroundColor: Colors.black54,
      textPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      radius: 20.0,
      position: ToastPosition.bottom,
    );
  }

  Widget _buildMaterialApp(ThemeProvider provider, LocaleProvider localeProvider) {
    return MaterialApp(
      title: 'Flutter Itachi',
      // showPerformanceOverlay: true, //显示性能标签
      // debugShowCheckedModeBanner: false, // 去除右上角debug的标签
      // checkerboardRasterCacheImages: true,
      // showSemanticsDebugger: true, // 显示语义视图
      // checkerboardOffscreenLayers: true, // 检查离屏渲染

      theme: theme ?? provider.getTheme(),
      darkTheme: provider.getTheme(isDarkMode: true),
      themeMode: provider.getThemeMode(),
      // home: home ?? const SplashPage(),
      // onGenerateRoute: Routers.router.generator,
      // localizationsDelegates: ,
      // supportedLocales: ,
      locale: localeProvider.locale,
      navigatorKey: navigatorKey,
      builder: (BuildContext context, Widget? child) {
        /// 仅针对安卓
        if (Device.isAndroid) {
          /// 切换深色模式会触发此方法，这里设置导航栏颜色
          ThemeUtils.setSystemNavigationBar(provider.getThemeMode());
        }

        /// 保证文字大小不受手机系统设置影响 https://www.kikt.top/posts/flutter/layout/dynamic-text/
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
        );
      },

      /// 因为使用了fluro，这里设置主要针对Web
      onUnknownRoute: (_) {
        return MaterialPageRoute<void>(
            builder: (BuildContext content) => const NotFoundPage(),
        );
      },
      restorationScopeId: 'app',
    );
  }
}

