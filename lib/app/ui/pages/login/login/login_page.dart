/*
 * @Description: 登录
 * @Author: iamsmiling
 * @Date: 2020-12-28 16:07:58
 * @LastEditTime: 2020-12-29 09:50:40
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/ui/pages/login/login/login_controller.dart';
import 'package:taojuwu/app/ui/widgets/bloc/x_sms_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<LoginController>(
          builder: (_) {
            return Column(
              children: [
                Text("登录方式指示器"),
                GetBuilder<LoginController>(
                  id: "mode",
                  builder: (_) {
                    return Row(
                      children: [
                        Row(
                          children: [
                            Text("密码登录"),
                            Checkbox(
                                value: _.loginMode == LoginMode.password,
                                onChanged: (bool flag) {
                                  _.loginMode = LoginMode.password;
                                  _.update(["mode"]);
                                }),
                          ],
                        ),
                        Row(
                          children: [
                            Text("验证码登录"),
                            Checkbox(
                                value: _.loginMode == LoginMode.sms,
                                onChanged: (bool flag) {
                                  _.loginMode = LoginMode.sms;
                                  _.update(["mode"]);
                                }),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                Form(
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(hintText: "请输入手机号码"),
                        onChanged: (String text) {
                          _.paramModel.mobile = text;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(hintText: "请输入密码"),
                        onChanged: (String text) {
                          _.paramModel.password = text;
                        },
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(hintText: "请输入验证码"),
                        onChanged: (String text) {
                          _.paramModel.code = text;
                        },
                      ),
                    ],
                  ),
                ),
                XSmsButton(
                  onFuture: _.getSms,
                ),
                TextButton(onPressed: _.login, child: Text("登录"))
              ],
            );
          },
        ),
      ),
    );
  }
}
