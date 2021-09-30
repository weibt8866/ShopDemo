import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Toast {
  static clear() => BotToast.cleanAll();

  // 显示文字
  static text(String text) => {
        Toast.clear(),
        BotToast.showText(text: text, align: const Alignment(0, 0))
      };

  static success({String? text}) => {
        Toast.clear(),
        BotToast.showCustomLoading(
            clickClose: true,
            duration: Duration(seconds: 2),
            toastBuilder: (void Function() cancelFunc) {
              return Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white),
                  child: Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Column(
                      children: [
                        Icon(
                          Icons.check,
                          size: 30,
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(text ?? "成功"))
                      ],
                    ),
                  ));
            })
      };

  static loading({String? text}) => {
        Toast.clear(),
        BotToast.showCustomLoading(
            toastBuilder: (void Function() cancelFunc) => Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
                child: Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Column(
                    children: [
                      CupertinoActivityIndicator(
                        radius: 15,
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Text(text ?? "加载中..."))
                    ],
                  ),
                )),
            duration: const Duration(seconds: 10),
            align: const Alignment(0, 0))
      };

  static error({String? text}) => {
        Toast.clear(),
        BotToast.showCustomLoading(
            toastBuilder: (void Function() cancelFunc) => Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
                child: Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Column(
                    children: [
                      Icon(Icons.close, size: 30),
                      Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Text(text ?? "加载中..."))
                    ],
                  ),
                )),
            duration: const Duration(seconds: 2),
            align: const Alignment(0, 0))
      };
}
