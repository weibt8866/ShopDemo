import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Setting extends StatefulWidget {
  Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting>
    with SingleTickerProviderStateMixin, KeepAliveParentDataMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("setting"),
      ),
      body: Text("setting"),
    );
  }

  @override
  void detach() {}

  @override
  bool get keptAlive => true;
}
