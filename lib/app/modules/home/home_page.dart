import 'package:elis/app/modules/home/drawer/drawer_widget.dart';
import 'package:elis/app/modules/store/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/getwidget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  UserStore user = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: GFAppBar(
        backgroundColor: Colors.black54,
        title: Text(user.userModel.username),
        actions: <Widget>[
          GFIconButton(
            icon: Icon(
              MdiIcons.locationExit,
              color: Colors.white,
            ),
            onPressed: () {
              Modular.to.pushReplacementNamed('/');
            },
            type: GFButtonType.transparent,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
