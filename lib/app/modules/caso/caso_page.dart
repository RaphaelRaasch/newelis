import 'package:elis/app/modules/store/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/getwidget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'caso_controller.dart';

class CasoPage extends StatefulWidget {
  final String title;
  const CasoPage({Key key, this.title = "Caso"}) : super(key: key);

  @override
  _CasoPageState createState() => _CasoPageState();
}

class _CasoPageState extends ModularState<CasoPage, CasoController> {
  //use 'controller' variable to access controller

  UserStore user = Modular.get();
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
      appBar: GFAppBar(
        backgroundColor: Colors.black54,
        title: Text('Casos'),
        actions: <Widget>[
          GFIconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              controller.setCaso();
            },
            type: GFButtonType.transparent,
          ),
        ],
      ),
      body: Observer(
        builder: (context) {
          if (controller.caso.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Stack(
              children: [
                Container(
                  height: sh,
                  width: sh,
                  child: ListView.builder(
                    itemCount: controller.caso.length,
                    itemBuilder: (context, index) {
                      var caso = controller.caso[index];
                      if (caso.status == false) {
                        return SizedBox();
                      } else {
                        return GestureDetector(
                          onTap: () {
                            Modular.link
                                .pushNamed('/commentcaso', arguments: caso);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: sw * 0.01,
                              vertical: sh * 0.01,
                            ),
                            child: Container(
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: sw * 0.1),
                                    height: sh * 0.05,
                                    width: sw,
                                    color: Colors.white,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(caso.nome),
                                        Text(caso.createdAt),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: sw,
                                    padding: EdgeInsets.symmetric(
                                        vertical: sh * 0.02,
                                        horizontal: sw * 0.06),
                                    color: Colors.white,
                                    child: Text(caso.descricao),
                                  ),
                                  caso.author == user.userModel.username
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ),
                                                onPressed: () {
                                                  controller.idcaso =
                                                      caso.id.toString();
                                                  controller.deletCaso();
                                                },
                                              ),
                                            ),
                                          ],
                                        )
                                      : Text(caso.author)
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.elasticOut,
                  bottom: controller.card == true ? 0 : -sh * 0.8,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: sh * 0.03, horizontal: sw * 0.03),
                    height: sh * 0.5,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: sh * 0.01),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(sw),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 2,
                                    color: Colors.grey,
                                    offset: Offset(2, 2),
                                  )
                                ]),
                            padding:
                                EdgeInsets.symmetric(horizontal: sw * 0.05),
                            child: TextFormField(
                              onChanged: (value) {
                                controller.casonome = value;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Nome', border: InputBorder.none),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: sh * 0.01),
                          child: Container(
                            height: sh * 0.3,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2,
                                  color: Colors.grey,
                                  offset: Offset(2, 2),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                sh * 0.02,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: sw * 0.03, vertical: sh * 0.01),
                            child: TextFormField(
                              minLines: null,
                              maxLines: null,
                              maxLength: 250,
                              expands: true,
                              onChanged: (value) {
                                controller.casodescricao = value;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Descrição',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
