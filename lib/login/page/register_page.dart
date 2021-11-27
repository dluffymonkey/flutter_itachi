import 'package:flutter/material.dart';
import 'package:flutter_itachi/login/widgets/my_text_field.dart';
import 'package:flutter_itachi/res/resources.dart';
import 'package:flutter_itachi/util/change_notifier_manage.dart';
import 'package:flutter_itachi/util/other_utils.dart';
import 'package:flutter_itachi/util/toast_utils.dart';
import 'package:flutter_itachi/widgets/my_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_itachi/widgets/my_button.dart';
import 'package:flutter_itachi/widgets/my_scroll_view.dart';

/// design/1注册登录/index.html#artboard11
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with ChangeNotifierMixin {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _vCodeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  final FocusNode _nodeText3 = FocusNode();
  bool _clickable = false;

  @override
  Map<ChangeNotifier?, List<VoidCallback>?>? changeNotifier() {
    final List<VoidCallback> callbacks = <VoidCallback>[_verify];
    return <ChangeNotifier, List<VoidCallback>?>{
      _nameController: callbacks,
      _vCodeController: callbacks,
      _passwordController: callbacks,
      _nodeText1: null,
      _nodeText2: null,
      _nodeText3: null,
    };
  }

  void _verify() {
    final String name = _nameController.text;
    final String vCode = _vCodeController.text;
    final String password = _passwordController.text;
    bool clickable = true;
    if (name.isEmpty || name.length < 11) {
      clickable = false;
    }
    if (vCode.isEmpty || vCode.length < 6) {
      clickable = false;
    }
    if (password.isEmpty || password.length < 6) {
      clickable = false;
    }

    /// 状态不一样再刷新，避免不必要的setState
    if (clickable != _clickable) {
      setState(() {
        _clickable = clickable;
      });
    }
  }

  void _register() {
    Toast.show('点击注册！！！');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context)!.register,
      ),
      body: MyScrollView(
        keyboardConfig: Utils.getKeyboardActionsConfig(context, <FocusNode>[_nodeText1, _nodeText2, _nodeText3]),
        crossAxisAlignment: CrossAxisAlignment.center,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
        children: _buildBody(),
      ),
    );
  }

  List<Widget> _buildBody() {
    return <Widget>[
      Text(
        AppLocalizations.of(context)!.openYourAccount,
        style: TextStyles.textBold26,
      ),
      Gaps.vGap16,
      MyTextField(
        key: const Key('phone'),
        controller: _nameController,
        focusNode: _nodeText1,
        maxLength: 11,
        hintText: AppLocalizations.of(context)!.inputPhoneHint,
        keyboardType: TextInputType.phone,
      ),
      Gaps.vGap8,
      MyTextField(
        key: const Key('vcode'),
        controller: _vCodeController,
        focusNode: _nodeText2,
        maxLength: 6,
        hintText: AppLocalizations.of(context)!.inputVerificationCodeHint,
        keyboardType: TextInputType.number,
        getVCode: () async {
          if (_nameController.text.length == 11) {
            Toast.show(AppLocalizations.of(context)!.verificationButton);

            /// 一般可以在这里发送真正的请求，请求成功返回true
            return true;
          } else {
            Toast.show(AppLocalizations.of(context)!.inputPhoneInvalid);
            return false;
          }
        },
      ),
      Gaps.vGap8,
      MyTextField(
        key: const Key('password'),
        keyName: 'password',
        controller: _passwordController,
        focusNode: _nodeText3,
        maxLength: 16,
        isInputPwd: true,
        hintText: AppLocalizations.of(context)!.inputPasswordHint,
        keyboardType: TextInputType.visiblePassword,
      ),
      Gaps.vGap24,
      MyButton(
          key: const Key('register'),
          text: AppLocalizations.of(context)!.register,
          onPressed: _clickable ? _register : null
      ),
    ];
  }
}
