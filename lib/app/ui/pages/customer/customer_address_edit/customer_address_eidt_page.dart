/*
 * @Description: 填写收货地址页面
 * @Author: iamsmiling
 * @Date: 2020-12-22 11:19:05
 * @LastEditTime: 2021-01-11 15:37:12
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/ui/pages/customer/customer_address_edit/customer_address_edit_controller.dart';
import 'package:taojuwu/app/ui/widgets/bloc/city_picker/x_city_picker.dart';
import 'package:taojuwu/app/ui/widgets/common/button/x_check_button.dart';
import 'package:taojuwu/app/ui/widgets/common/textfield/x_label_text_field.dart';
import 'package:taojuwu/app/ui/widgets/common/textfield/x_selector_text_field.dart';

class CustomerAddressEditPage extends GetView<CustomerAddressEditController> {
  const CustomerAddressEditPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("填写收货地址"),
      ),
      body: GetBuilder<CustomerAddressEditController>(builder: (_) {
        return SingleChildScrollView(
          child: Column(
            children: [
              XLabelTextField(
                label: "联系人",
                initialValue: _.customer?.name,
                onChanged: (String text) {
                  _.customer?.name = text;
                },
              ),
              GetBuilder<CustomerAddressEditController>(
                id: "gender",
                builder: (_) {
                  return Row(
                    children: [
                      for (CustomerGenderOptionModel e in _.genderOptions)
                        XCheckButton(
                            target: e,
                            callback: () => _.selectGender(e),
                            child: Text(e.name))
                    ],
                  );
                },
              ),
              XLabelTextField(
                label: "手机号",
                initialValue: _.customer?.tel,
                onChanged: (String text) {
                  _.customer?.tel = text;
                },
              ),
              XSelectorTextField<AddressModel>(
                  label: Text("区域地址"),
                  onValueChange: (AddressModel result) {
                    _.customer?.address?.address = result;
                  },
                  initialValue: _.customer?.address?.address,
                  onFuture: () => showXCityPicker(context,
                      addressResult: _.customer?.address?.address)),
              XLabelTextField(
                label: "门牌号",
                initialValue: _.customer?.address?.detailAddress,
                onChanged: (String text) {
                  _.customer?.address?.detailAddress = text;
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
