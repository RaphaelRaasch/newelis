import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'caso_admin_controller.dart';

class CasoAdminPage extends StatefulWidget {
  final String title;
  const CasoAdminPage({Key key, this.title = "CasoAdmin"}) : super(key: key);

  @override
  _CasoAdminPageState createState() => _CasoAdminPageState();
}

class _CasoAdminPageState
    extends ModularState<CasoAdminPage, CasoAdminController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    controller.getCaso();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          height: sh * 0.9,
          child: Observer(builder: (_) {
            if (controller.caso.isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: controller.caso.length,
                itemBuilder: (context, index) {
                  var caso = controller.caso[index];
                  if (caso.status == true) {
                    return SizedBox();
                  } else {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: sh * 0.02),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: sh * 0.02,
                          horizontal: sw * 0.03,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  color: Colors.black26,
                                  offset: Offset(2, 2))
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(caso.author),
                                Text(caso.createdAt)
                              ],
                            ),
                            SizedBox(
                              height: sh * 0.03,
                            ),
                            Text(caso.descricao),
                            SizedBox(
                              height: sh * 0.03,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: sh * 0.05,
                                  child: Row(
                                    children: [
                                      IconButton(
                                          icon: Icon(
                                            Icons.check_circle,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            controller.check = true;
                                            controller.aproveCaso();
                                          })
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }
                },
              );
            }
          }),
        ));
  }
}
