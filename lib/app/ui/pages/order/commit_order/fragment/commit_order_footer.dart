/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-01-07 22:13:38
 * @LastEditTime: 2021-01-11 16:32:01
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/ui/dialog/order/deposit.dart';
import 'package:taojuwu/app/ui/dialog/order/note.dart';
import 'package:taojuwu/app/ui/pages/order/commit_order/commit_order_controller.dart';
import 'package:taojuwu/app/ui/widgets/bloc/x_count_picker.dart';
import 'package:taojuwu/app/ui/widgets/common/textfield/x_selector_text_field.dart';
import 'package:taojuwu/app/utils/common_kit.dart';

class CommitOrderFooter extends GetView<CommitOrderController> {
  const CommitOrderFooter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          XSelectorTextField<DateTime>(
            label: Expanded(
                child: Text(
              "客户意向测量时间",
              textAlign: TextAlign.end,
            )),
            initialValue: controller.params.measureTime,
            onValueChange: (DateTime date) {
              controller.params.measureTime = date;
            },
            onStringify: (DateTime date) {
              return CommonKit.formatDateTime(date);
            },
            onFuture: () => showDatePicker(
                context: context,
                lastDate: DateTime.now(),
                firstDate: DateTime(1970),
                initialDate: DateTime.now()),
          ),
          XSelectorTextField<DateTime>(
            label: Expanded(
                child: Text(
              "客户意向安装时间",
              textAlign: TextAlign.end,
            )),
            initialValue: controller.params.installTime,
            onValueChange: (DateTime date) {
              controller.params.installTime = date;
            },
            onStringify: (DateTime date) {
              return CommonKit.formatDateTime(date);
            },
            onFuture: () => showDatePicker(
                context: context,
                lastDate: DateTime.now(),
                firstDate: DateTime(1970),
                initialDate: DateTime.now()),
          ),
          XSelectorTextField<String>(
              label: Expanded(
                  child: Text(
                "窗数",
                textAlign: TextAlign.end,
              )),
              onValueChange: (String val) {
                controller.params.windowCount = val;
              },
              onFuture: () => showCountPicker(context,
                  defaultValue: controller.params.windowCount,
                  optionList: List.generate(10,
                      (index) => "${(index + 1) < 10 ? index + 1 : '10+'}"))),
          XSelectorTextField<String>(
            onValueChange: (String text) {
              controller.params.deposit = text;
            },
            onFuture: () => showDepositDialog(context,
                initialValue: controller.params.deposit),
            label: Expanded(
                child: Text(
              "定金",
              textAlign: TextAlign.end,
            )),
          ),
          XSelectorTextField<String>(
            onValueChange: (String value) {
              controller.params.deposit = value;
            },
            onFuture: () =>
                showNoteDialog(context, initialValue: controller.params.note),
            label: Expanded(
                child: Text(
              "备注",
              textAlign: TextAlign.end,
            )),
          ),
        ],
      ),
    );
  }
}
