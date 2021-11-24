import 'package:azlistview/azlistview.dart';
import 'package:flutter_itachi/generated/base/json_convert_content.dart';

class BankEntity with JsonConvert<BankEntity>, ISuspensionBean {

  BankEntity({this.id, this.bankName, this.firstLetter});

  int? id;
  String? bankName;
  String? firstLetter;

  @override
  String getSuspensionTag() {
    return firstLetter ?? '';
  }
}