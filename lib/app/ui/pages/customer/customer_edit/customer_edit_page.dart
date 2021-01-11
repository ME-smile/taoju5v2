/*
 * @Description: 编辑客户页面
 * @Author: iamsmiling
 * @Date: 2020-12-22 09:59:00
 * @LastEditTime: 2021-01-11 14:42:41
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:taojuwu/app/constants/x_gender.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/routes/app_pages.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_edit/customer_edit_controller.dart';
import 'package:taojuwu/app/ui/widgets/bloc/city_picker/x_city_picker.dart';
import 'package:taojuwu/app/ui/widgets/bloc/x_count_picker.dart';
import 'package:taojuwu/app/ui/widgets/bloc/x_gender_picker.dart';
import 'package:taojuwu/app/ui/widgets/common/textfield/x_label_text_field.dart';
import 'package:taojuwu/app/ui/widgets/common/textfield/x_selector_text_field.dart';
import 'package:taojuwu/app/utils/common_kit.dart';

class CustomerEditPage extends StatelessWidget {
  const CustomerEditPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(

            ///如果是从商品详情进去 则显示编辑客户 否则显示添加客户
            RegExp(AppRoutes.customerDetail).hasMatch(Get.routing.previous)
                ? "编辑客户"
                : "添加客户"),
        actions: [
          TextButton(
              onPressed: () => Get.toNamed(AppRoutes.customerList),
              child: Text("选择已有客户"))
        ],
      ),
      body: GetBuilder<CustomerEditController>(builder: (_) {
        return SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Container(
                  color: XColors.hintColor,
                  width: Get.width,
                  padding: EdgeInsets.symmetric(
                      horizontal: XDimens.gap32, vertical: XDimens.gap10),
                  child: Text("基本信息"),
                ),
                XLabelTextField(
                  label: "姓名",
                  initialValue: _.target.name,
                  onChanged: (String str) {
                    _.target.name = str;
                  },
                ),
                XSelectorTextField<XGender>(
                  label: Text("性别"),
                  onValueChange: (XGender gender) {
                    _.target.gender = gender;
                  },
                  initialValue: _.target.gender,
                  onStringify: getGenderName,
                  onFuture: () =>
                      showGenderPicker(context, defaultGender: _.target.gender),
                ),
                XSelectorTextField<String>(
                  label: Text("年龄"),
                  initialValue: _.target.age,
                  onValueChange: (String value) {
                    _.target.age = value;
                  },
                  onFuture: () => showCountPicker(context,
                      optionList:
                          List.generate(70, (index) => "${index + 10}")),
                ),
                XLabelTextField(
                  label: "手机号",
                  initialValue: _.target.tel,
                  onChanged: (String str) {
                    _.target.tel = str;
                  },
                ),
                XLabelTextField(
                  label: "微信号",
                  initialValue: _.target.wx,
                  onChanged: (String str) {
                    _.target.wx = str;
                  },
                ),
                Container(
                  color: XColors.hintColor,
                  width: Get.width,
                  padding: EdgeInsets.symmetric(
                      horizontal: XDimens.gap32, vertical: XDimens.gap10),
                  child: Text("特征信息"),
                ),
                XSelectorTextField<DateTime>(
                  label: Text("入店时间"),
                  initialValue: _.target.enterTime,
                  onValueChange: (DateTime date) {
                    _.target.enterTime = date;
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
                XSelectorTextField<AddressModel>(
                    label: Text("区域地址"),
                    onValueChange: (AddressModel result) {
                      _.target.address.address = result;
                    },
                    initialValue: _.target.address.address,
                    onStringify: (AddressModel result) => result.toString(),
                    onFuture: () => showXCityPicker(context,
                        addressResult: _.target.address.address)),
                XLabelTextField(
                  label: "详细地址",
                  initialValue: _.target.wx,
                  onChanged: (String str) {
                    _.target.wx = str;
                  },
                ),
              ],
            ),
          ),
        );
      }),
      bottomNavigationBar: ElevatedButton(
        onPressed: Get.find<CustomerEditController>().edit,
        child: Text("确定"),
      ),
    );
  }
}
