import 'package:flutter/material.dart';
import 'package:flutter_itachi/util/change_notifier_manage.dart';

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

  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
