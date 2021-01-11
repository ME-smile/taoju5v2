/*
 * @Description: 用户信息详情
 * @Author: iamsmiling
 * @Date: 2020-12-21 16:34:44
 * @LastEditTime: 2021-01-11 14:46:57
 */
import 'package:get/get.dart';
import 'package:taojuwu/app/constants/x_gender.dart';
import 'package:taojuwu/app/ui/widgets/bloc/city_picker/x_city_picker.dart';
import 'package:taojuwu/app/utils/json_convert_kit.dart';

String getCustomerType(int code) {
  Map map = {0: '初谈客户', 1: '意向客户', 2: '跟进客户', 3: '成交客户'};
  return map[code] ?? map[0];
}

class CustomerDetailModel {
  String id;
  String name;
  String tel;
  String age;
  String wx;
  DateTime enterTime;
  int shopId;
  String type;
  CustomerAddressModel address;
  XGender gender;
  CustomerDetailModel();
  CustomerDetailModel.fromJson(Map json) {
    id = "${json['id']}";
    name = json['client_name'];
    tel = json['client_mobile'];
    type = getCustomerType(json["client_type"]);
    age = "${json['client_age']}";
    wx = json['client_wx'];
    enterTime = JsonConvertKit.getDateTimeFromMillseconds(
        GetUtils.isNullOrBlank(json['enter_time']) ? 0 : json['enter_time']);
    shopId = json['shop_id'];
    address = CustomerAddressModel.fromJsom(json);
    gender = getGenderById(JsonConvertKit.asInt(json['client_sex']));
  }

  Map toJson() => {
        'id': id,
        'client_name': name,
        'client_mobile': tel,
        'client_wx': wx,
        'client_sex': getGenderId(gender),
        'enter_time': JsonConvertKit.formatDateTime(enterTime),
        'province_id': address.address.provicne.id,
        'city_id': address.address.city.id,
        'district_id': address.address.district.id,
        'detail_address': address.detailAddress,
        'client_age': age,
      };
}

class CustomerAddressModel {
  AddressModel address;
  String detailAddress;
  int addressId;

  CustomerAddressModel.fromJsom(Map json) {
    address = AddressModel.fromId(
        JsonConvertKit.asInt(json['province_id']),
        JsonConvertKit.asInt(json['city_id']),
        JsonConvertKit.asInt(json['district_id']));

    detailAddress = json['detail_address'];
  }

  Map toJson() => {
        "province_id": address.provicne.id,
        "city_id": address.city.id,
        "district_id": address.district.id,
        "detail_address": detailAddress,
        "province_name": address.provicne.name,
        "city_name": address.city.name,
        "district_name": address.district.name
      };
}
