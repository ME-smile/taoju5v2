/*
 * @Description:订单备注弹窗
 * @Author: iamsmiling
 * @Date: 2021-01-11 16:06:45
 * @LastEditTime: 2021-01-11 16:22:23
 */

import 'package:flutter/material.dart';

Future showNoteDialog(BuildContext context, {String initialValue}) {
  return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return _NoteDialog(
          initialValue: initialValue,
        );
      });
}

class _NoteDialog extends StatefulWidget {
  final String initialValue;
  const _NoteDialog({Key key, this.initialValue}) : super(key: key);

  @override
  __NoteDialogState createState() => __NoteDialogState();
}

class __NoteDialogState extends State<_NoteDialog> {
  String _value;

  @override
  void initState() {
    _value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "备注",
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: TextFormField(
              initialValue: widget.initialValue,
              keyboardType: TextInputType.number,
              autofocus: true,
              onChanged: (String text) {
                _value = text;
              },
              decoration: InputDecoration(
                  filled: true,
                  hintText: '元',
                  fillColor: const Color(0xFFF2F2F2),
                  contentPadding: EdgeInsets.all(10)),
            ),
          ),
          Row(
            children: [
              OutlineButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("取消"),
              ),
              SizedBox(
                width: 24,
              ),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(_value),
                  child: Text("确定"))
            ],
          )
        ],
      ),
    );
  }
}
