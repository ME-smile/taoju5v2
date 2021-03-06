/*
 * @Description: 订单商品卡片
 * @Author: iamsmiling
 * @Date: 2021-01-04 15:46:09
 * @LastEditTime: 2021-01-12 14:33:42
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:taojuwu/app/domain/model/order/order_model.dart';
import 'package:taojuwu/app/domain/model/order/order_status.dart';
import 'package:taojuwu/app/domain/model/order/order_type.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taojuwu/app/res/x_colors.dart';
import 'package:taojuwu/app/res/x_dimens.dart';

///选品单
class _SelectOrderCard extends StatelessWidget {
  final OrderModel order;
  final OrderProductModel product;
  const _SelectOrderCard({Key key, this.order, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(XDimens.gap32),
            color: XColors.primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 180.h,
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: CachedNetworkImage(imageUrl: product.image),
                  ),
                ),
                Expanded(
                    child: SizedBox(
                  height: 180.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: XDimens.gap32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product.name,
                                    style: TextStyle(
                                        fontSize: XDimens.sp28,
                                        color: XColors.textColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    product.statusName,
                                    style: TextStyle(
                                        fontSize: XDimens.sp26,
                                        color: XColors.pinkColor),
                                  )
                                ],
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.symmetric(
                                    vertical: XDimens.gap8),
                                child: Text(
                                    "¥${product.price.toStringAsFixed(2)}"),
                              )
                            ],
                          ),
                        ),
                        DefaultTextStyle(
                            style: TextStyle(
                                fontSize: XDimens.sp24,
                                color: XColors.tipTextColor),
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("客户:${order.customerName}"),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(bottom: XDimens.gap4),
                                      child: Text("订单编号:${order.no}"))
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: XDimens.gap32, horizontal: XDimens.gap32),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "应收定金:",
                      style: TextStyle(
                          fontSize: XDimens.sp24,
                          color: XColors.weightGreyTextColor),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: XDimens.gap4),
                      child: Text(
                        "¥${order.prepayment.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: XDimens.sp28),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: XDimens.gap8),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "创建时间:${order.createTime}",
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///未测量的测量单
class _UnMeasuredOrderCard extends StatelessWidget {
  final OrderModel order;
  final OrderProductModel product;
  const _UnMeasuredOrderCard({Key key, this.order, this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(XDimens.gap32),
            color: XColors.primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 180.h,
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: CachedNetworkImage(imageUrl: product.image),
                  ),
                ),
                Expanded(
                    child: SizedBox(
                  height: 180.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: XDimens.gap32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    order.typeName,
                                    style: TextStyle(
                                        fontSize: XDimens.sp28,
                                        color: XColors.textColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    product.statusName,
                                    style: TextStyle(
                                        fontSize: XDimens.sp26,
                                        color: XColors.pinkColor),
                                  )
                                ],
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.symmetric(
                                    vertical: XDimens.gap8),
                                child: Text("${order.windowCount}扇"),
                              )
                            ],
                          ),
                        ),
                        DefaultTextStyle(
                            style: TextStyle(
                                fontSize: XDimens.sp24,
                                color: XColors.tipTextColor),
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("客户:${order.customerName}"),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(bottom: XDimens.gap4),
                                      child: Text("订单编号:${order.no}"))
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: XDimens.gap32, horizontal: XDimens.gap32),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "应收定金:",
                      style: TextStyle(
                          fontSize: XDimens.sp24,
                          color: XColors.weightGreyTextColor),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: XDimens.gap4),
                      child: Text(
                        "¥${order.prepayment.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: XDimens.sp28),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: XDimens.gap8),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "创建时间:${order.createTime}",
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///测量完成的测量单
class _MeasuredOrderCard extends StatelessWidget {
  final OrderModel order;
  final OrderProductModel product;
  const _MeasuredOrderCard({Key key, this.order, this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(XDimens.gap32),
            color: XColors.primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 180.h,
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: CachedNetworkImage(imageUrl: product.image),
                  ),
                ),
                Expanded(
                    child: SizedBox(
                  height: 180.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: XDimens.gap32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product.name,
                                    style: TextStyle(
                                        fontSize: XDimens.sp28,
                                        color: XColors.textColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    product.statusName,
                                    style: TextStyle(
                                        fontSize: XDimens.sp26,
                                        color: XColors.pinkColor),
                                  )
                                ],
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.symmetric(
                                    vertical: XDimens.gap8),
                                child: Text(
                                    "¥${product.price.toStringAsFixed(2)}"),
                              )
                            ],
                          ),
                        ),
                        DefaultTextStyle(
                            style: TextStyle(
                                fontSize: XDimens.sp24,
                                color: XColors.tipTextColor),
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("空间:${product.room}"),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(bottom: XDimens.gap4),
                                      child: Text(
                                          "宽:${product.width}米 高:${product.height}"))
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: XDimens.gap32, horizontal: XDimens.gap32),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "应收定金:",
                      style: TextStyle(
                          fontSize: XDimens.sp24,
                          color: XColors.weightGreyTextColor),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: XDimens.gap4),
                      child: Text(
                        "¥${order.prepayment.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: XDimens.sp28),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: XDimens.gap8),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "创建时间:${order.createTime}",
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderProductCard extends StatelessWidget {
  final OrderModel order;
  final OrderProductModel product;
  const OrderProductCard(
      {Key key, @required this.product, @required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: XColors.primaryColor,
      child: Column(
        children: [
          ///选品单
          Visibility(
            visible: order.orderType == OrderType.selectionOrder,
            child: _SelectOrderCard(order: order, product: product),
          ),

          ///测量单
          Visibility(
            visible: order.orderType == OrderType.measureOrder,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///测量未完成测量
                Visibility(
                  visible: order.orderStatus <= OrderStatus.toBeMeasured,
                  child: _UnMeasuredOrderCard(order: order, product: product),
                ),

                ///测量完成
                Visibility(
                  visible: order.orderStatus > OrderStatus.toBeMeasured,
                  child: _MeasuredOrderCard(order: order, product: product),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
