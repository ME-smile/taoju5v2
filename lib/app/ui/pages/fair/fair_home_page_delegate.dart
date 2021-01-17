/*
 * @Description: 测试fair
 * @Author: iamsmiling
 * @Date: 2021-01-11 22:55:36
 * @LastEditTime: 2021-01-11 22:57:01
 */
import 'package:fair/fair.dart';

import 'theme.dart';

class MyHomePageDelegate extends FairDelegate {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Map<String, PropertyValue> bindValue() {
    var value = super.bindValue();
    value['_counter'] = () => _counter;
    return value;
  }

  @override
  Map<String, Function> bindFunction() {
    var fun = super.bindFunction();
    fun['_incrementCounter'] = _incrementCounter;
    fun['ThemeStyle.headline4'] = (props) => ThemeStyle.headline4(context);
    return fun;
  }
}
