/*
 * @Description: 用户信息详情
 * @Author: iamsmiling
 * @Date: 2020-12-21 16:34:44
 * @LastEditTime: 2020-12-29 13:26:54
 */
import 'package:taojuwu/app/utils/json_convert_kit.dart';

class CustomerDetailModel {
  int id;
  String name;
  String tel;
  int age;
  String wx;
  String enterTime;
  int shopId;
  CustomerAddressModel address;
  CustomerGenderModel gender;
  CustomerDetailModel();
  CustomerDetailModel.fromJson(Map json) {
    id = json['id'];
    name = json['client_name'];
    tel = json['client_mobile'];
    age = json['client_age'];
    wx = json['client_wx'];
    enterTime = JsonConvertKit.formatDateTime(
        JsonConvertKit.getDateTimeFromMillseconds(json['enter_time']));
    shopId = json['shop_id'];
    address = CustomerAddressModel.fromJsom(json);
    gender = CustomerGenderModel(json['client_sex']);
  }
}

class CustomerGenderModel {
  int id;
  String name;

  static const Map<int, String> dict = {0: "未知", 1: "男", 2: "女"};
  CustomerGenderModel(int id) {
    this.id = id;
    this.name = dict[id];
  }

  Map toJson() => {"id": id, "name": name};
}

class CustomerAddressModel {
  String provinceName;
  String cityName;
  String districtName;
  int provinceId;
  int cityId;
  int districtId;
  String detailAddress;
  int addressId;

  CustomerAddressModel.fromJsom(Map json) {
    provinceId = json['province_id'];
    cityId = json['city_id'];
    districtId = json['district_id'];
    detailAddress = json['detail_address'];
    provinceName = json['province_name'];
    cityName = json['city_name'];
    districtName = json['district_name'];
  }

  Map toJson() => {
        "province_id": provinceId,
        "city_id": cityId,
        "district_id": districtId,
        "detail_address": detailAddress,
        "province_name": provinceName,
        "city_name": cityName,
        "district_name": districtName
      };
}
