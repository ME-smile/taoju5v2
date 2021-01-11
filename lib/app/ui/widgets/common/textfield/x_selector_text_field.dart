/*
 * @Description: 选择器
 * @Author: iamsmiling
 * @Date: 2021-01-07 21:18:35
 * @LastEditTime: 2021-01-11 13:41:39
 */
import 'package:flutter/material.dart';
import 'package:taojuwu/app/res/x_icons.dart';
import 'package:taojuwu/app/type_defs/type_defs.dart';

class XSelectorTextField<T> extends StatefulWidget {
  final Widget label;
  final T initialValue;
  final String hintText;
  final TextDirection contentTextTextDirection;
  final StringifyCallback<T> onStringify;
  final FutureCallback<T> onFuture;
  final Function(T value) onValueChange;
  const XSelectorTextField(
      {Key key,
      @required this.label,
      this.initialValue,
      @required this.onFuture,
      this.contentTextTextDirection = TextDirection.rtl,
      this.hintText = "请选择",
      this.onStringify,
      this.onValueChange})
      : super(key: key);

  @override
  _XSelectorTextFieldState<T> createState() => _XSelectorTextFieldState<T>();
}

class _XSelectorTextFieldState<T> extends State<XSelectorTextField<T>> {
  String _value;
  String _stringify(T value) {
    if (widget.onStringify == null) {
      return value?.toString();
    }
    return widget.onStringify(value);
  }

  @override
  void initState() {
    super.initState();

    _value = _stringify(widget.initialValue);
  }

  Future _onTap() {
    return widget.onFuture().then((value) {
      if (value == null) return;
      widget.onValueChange(value);
      setState(() {
        _value = _stringify(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        child: Row(
          children: [
            widget.label,
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      onTap: _onTap,
                      textAlign: TextAlign.end,
                      textDirection: widget.contentTextTextDirection,
                      decoration:
                          InputDecoration(hintText: _value ?? widget.hintText),
                    ),
                  ),
                  Icon(XIcons.next)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
