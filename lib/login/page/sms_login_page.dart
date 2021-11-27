import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_itachi/login/login_router.dart';
import 'package:flutter_itachi/login/widgets/my_text_field.dart';
import 'package:flutter_itachi/res/resources.dart';
import 'package:flutter_itachi/routers/fluro_navigator.dart';
import 'package:flutter_itachi/util/change_notifier_manage.dart';
import 'package:flutter_itachi/util/other_utils.dart';
import 'package:flutter_itachi/util/toast_utils.dart';
import 'package:flutter_itachi/widgets/my_app_bar.dart';
import 'package:flutter_itachi/widgets/my_button.dart';
import 'package:flutter_itachi/widgets/my_scroll_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SMSLoginPage extends StatefulWidget {
  const SMSLoginPage({Key? key}) : super(key: key);

  @override
  _SMSLoginPageState createState() => _SMSLoginPageState();
}

class _SMSLoginPageState extends State<SMSLoginPage> with ChangeNotifierMixin {

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _vCodeController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  bool _clickable = false;

  @override
  Map<ChangeNotifier?, List<VoidCallback>?>? changeNotifier() {
    final List<VoidCallback> callback = <VoidCallback>[_verify];
    return <ChangeNotifier?, List<VoidCallback>?>{
      _phoneController: callback,
      _vCodeController: callback,
      _nodeText1: null,
      _nodeText2: null,
    };
  }

  void _verify() {
    final String name = _phoneController.text;
    final String vCode = _vCodeController.text;
    bool clickable = true;
    if (name.isEmpty || name.length < 11) {
      clickable = false;
    }
    if (vCode.isEmpty || vCode.length < 6) {
      clickable = false;
    }
    if (_clickable != clickable) {
      setState(() {
        _clickable = clickable;
      });
    }
  }

  void _login() {
    Toast.show('去登录！');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: MyScrollView(
        keyboardConfig: Utils.getKeyboardActionsConfig(context, <FocusNode>[_nodeText1, _nodeText2]),
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
        children: _buildBody(),
      ),
    );
  }

  List<Widget> _buildBody() {
    return <Widget>[
      Text(
        AppLocalizations.of(context)!.verificationCodeLogin,
        style: TextStyles.textBold26,
      ),
      Gaps.vGap16,
      MyTextField(
        focusNode: _nodeText1,
        controller: _phoneController,
        maxLength: 11,
        keyboardType: TextInputType.phone,
        hintText: AppLocalizations.of(context)!.inputPhoneHint,
      ),
      Gaps.vGap8,
      MyTextField(
        focusNode: _nodeText2,
        controller: _vCodeController,
        maxLength: 6,
        keyboardType: TextInputType.number,
        hintText: AppLocalizations.of(context)!.inputVerificationCodeHint,
        getVCode: () {
          Toast.show(AppLocalizations.of(context)!.getVerificationCode);
          return Future<bool>.value(true);
        },
      ),
      Gaps.vGap8,
      Container(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
            text: AppLocalizations.of(context)!.registeredTips,
            style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: Dimens.font_sp14),
            children: <TextSpan>[
              TextSpan(
                text: AppLocalizations.of(context)!.register,
                style: TextStyle(
                  color: Theme.of(context).errorColor,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    NavigatorUtils.push(context, LoginRouter.registerPage);
                  },
              ),
              TextSpan(text: Utils.getCurrentLocale() == 'zh' ? '。' : '.'),
            ],
          ),
        ),
      ),
      Gaps.vGap24,
      MyButton(
        onPressed: _clickable ? _login : null,
        text: AppLocalizations.of(context)!.login,
      ),
      Container(
        height: 40.0,
        alignment: Alignment.centerRight,
        child: GestureDetector(
          child: Text(
            AppLocalizations.of(context)!.forgotPasswordLink,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          onTap: () => NavigatorUtils.push(context, LoginRouter.resetPasswordPage),
        ),
      ),
    ];
  }
}
