/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-01-07 22:13:38
 * @LastEditTime: 2021-01-16 14:48:23
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
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
      margin: EdgeInsets.only(top: XDimens.gap16),
      color: XColors.primaryColor,
      child: Column(
        children: [
          XSelectorTextField<DateTime>(
            label: Expanded(
                child: Text(
              "客户意向测量时间",
              textAlign: TextAlign.end,
            )),
            initialValue: controller.params.optionalParams.measureTime,
            onValueChange: (DateTime date) {
              controller.params.optionalParams.measureTime = date;
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
                child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "客户意向安装时间",
                textAlign: TextAlign.end,
              ),
            )),
            initialValue: controller.params.optionalParams.installTime,
            onValueChange: (DateTime date) {
              controller.params.optionalParams.installTime = date;
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
                controller.params.optionalParams.windowCount = val;
              },
              onFuture: () => showCountPicker(context,
                  defaultValue: controller.params.optionalParams.windowCount,
                  optionList: List.generate(10,
                      (index) => "${(index + 1) < 10 ? index + 1 : '10+'}"))),
          XSelectorTextField<String>(
            onValueChange: (String text) {
              controller.params.optionalParams.deposit = text;
            },
            onFuture: () => showDepositDialog(context,
                initialValue: controller.params.optionalParams.deposit),
            label: Expanded(
                child: Text(
              "定金",
              textAlign: TextAlign.end,
            )),
          ),
          XSelectorTextField<String>(
            onValueChange: (String value) {
              controller.params.optionalParams.deposit = value;
            },
            onFuture: () => showNoteDialog(context,
                initialValue: controller.params.optionalParams.note),
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
