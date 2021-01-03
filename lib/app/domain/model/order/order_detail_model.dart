/*
 * @Description: 订单详情数据模型
 * @Author: iamsmiling
 * @Date: 2020-12-22 14:26:35
 * @LastEditTime: 2020-12-22 14:33:48
 */

class OrderDetailModelWrapper {
  OrderDetailModel orderDetailModel;
  OrderDetailModelWrapper.fromJson(Map json) {
    orderDetailModel = OrderDetailModel.fromJson(json['order']);
  }
}

class OrderDetailModel {
  int id;
  String no;
  int type;
  int clientId;
  String userName;
  int buyerId;
  String buyerIp;
  int isShowExpress;
  String buyerMessage;
  String buyerInvoice;
  String receiverMobile;
  int receiverProvince;
  int receiverCity;
  int receiverDistrict;
  String receiverAddress;
  String receiverZip;
  String receiverName;
  int shopId;
  String shopName;
  int sellerStar;
  String sellerMemo;
  int consignTimeAdjust;
  String goodsMoney;
  String orderMoney;
  int point;
  String pointMoney;
  String couponMoney;
  int couponId;
  String userMoney;
  String userPlatformMoney;
  String promotionMoney;
  String shippingMoney;
  String payMoney;
  String refundMoney;
  String coinMoney;
  int givePoint;
  String giveCoin;
  int orderStatus;
  int payStatus;
  int shippingStatus;
  int reviewStatus;
  int feedbackStatus;
  int isEvaluate;
  String taxMoney;
  int shippingCompanyId;
  int givePointType;
  int payTime;
  int shippingTime;
  int signTime;
  int consignTime;
  int createTime;
  int updateTime;
  int finishTime;
  int isDeleted;
  int operatorType;
  int operatorId;
  String refundBalanceMoney;
  String fixedTelephone;
  int tuangouGroupId;
  String distributionTimeOut;
  int isVirtual;
  int promotionType;
  int promotionId;
  String orderCloseReason;
  String orderRemark;
  int measureInstallStatus;
  String measureTime;
  int realityMeasureTime;
  String installTime;
  int realityInstallTime;
  List measureManuscriptsPicture;
  String orderWindowNum;
  String orderEarnestMoney;
  String tailMoney;
  String orderEstimatedPrice;
  String adjustMoney;
  String adjustMoneyRemark;
  String realityPayMoney;
  int noticeStatus;
  String installRemark;
  String installPicture;
  int isApartment;
  String apartmentName;
  String tag;
  String clientName;

  OrderDetailModel.fromJson(Map json) {
    id = json['order_id'];
    no = json['order_no'];
    type = json['order_type'];
    clientId = json['client_id'];
    userName = json['user_name'];
    buyerId = json['buyer_id'];
    buyerIp = json['buyer_ip'];
    buyerMessage = json['buyer_message'];
    buyerInvoice = json['buyer_invoice'];
    receiverMobile = json['receiver_mobile'];
    receiverProvince = json['receiver_province'];
    receiverCity = json['receiver_city'];
    receiverDistrict = json['receiver_district'];
    receiverAddress = json['receiver_address'];
    receiverZip = json['receiver_zip'];
    receiverName = json['receiver_name'];
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    sellerStar = json['seller_star'];
    sellerMemo = json['seller_memo'];
    consignTimeAdjust = json['consign_time_adjust'];
    goodsMoney = json['goods_money'];
    orderMoney = json['order_money'];
    point = json['point'];
    pointMoney = json['point_money'];
    couponMoney = json['coupon_money'];
    couponId = json['coupon_id'];
    userMoney = json['user_money'];
    userPlatformMoney = json['user_platform_money'];
    promotionMoney = json['promotion_money'];
    shippingMoney = json['shipping_money'];
    payMoney = json['pay_money'];
    refundMoney = json['refund_money'];
    coinMoney = json['coin_money'];
    givePoint = json['give_point'];
    giveCoin = json['give_coin'];
  }
}
