import 'package:elis/app/modules/home/drawer/drawer_widget.dart';
import 'package:elis/app/modules/store/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
  void initState() {
    controller.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
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
        body: Observer(
          builder: (context) {
            if (controller.homeviewmodel.isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                padding: EdgeInsets.symmetric(
                    horizontal: sw * 0.06, vertical: sh * 0.03),
                height: sh,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Top Casos',
                      style: TextStyle(
                        fontSize: sh * 0.03,
                      ),
                    ),
                    Container(
                      height: sh * 0.5,
                      child: ListView.builder(
                        itemCount: controller.homeviewmodel.length,
                        itemBuilder: (context, index) {
                          var caso = controller.homeviewmodel[index];

                          return Container(
                            padding: EdgeInsets.symmetric(vertical: sh * 0.02),
                            child: Container(
                              height: sh * 0.06,
                              child: (Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(caso.caso.author),
                                      Text(caso.comentario.length.toString())
                                    ],
                                  ),
                                  Text(caso.caso.nome),
                                ],
                              )),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ));
  }
}
