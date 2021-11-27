import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_itachi/res/resources.dart';
import 'package:flutter_itachi/util/theme_utils.dart';
import 'package:flutter_itachi/widgets/load_image.dart';

class StateLayout extends StatelessWidget {
  const StateLayout({
    Key? key,
    required this.type,
    this.hintText
  }) : super(key: key);

  final StateType type;
  final String? hintText;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (type == StateType.loading)
          const CupertinoActivityIndicator(radius: 16)
        else
          if (type != StateType.empty)
            Opacity(
              opacity: context.isDark ? 0.5 : 1,
              child: LoadAssetImage(
                'state/${type.img}',
                width: 120,
              ),
            ),
        const SizedBox(width: double.infinity, height: Dimens.gap_dp16,),
        Text(
          hintText ?? type.hintText,
          style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: Dimens.font_sp14),
        ),
        Gaps.vGap50,
      ],
    );
  }
}

enum StateType {
  /// 订单
  order,
  /// 商品
  goods,
  /// 无网络
  network,
  /// 消息
  message,
  /// 无提现账户
  account,
  /// 加载中
  loading,
  /// 空
  empty
}

extension StateTypeExtension on StateType {
  String get img => <String>[
    'zwdd', 'zwsp',
    'zwwl', 'zwxx',
    'zwzh', '', ''
  ][index];

  String get hintText => <String>[
  '暂无订单', '暂无商品',
  '无网络连接', '暂无消息',
  '马上添加提现账号吧', '', ''
  ][index];
}