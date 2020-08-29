import 'package:elis/app/modules/store/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mask_shifter/mask_shifter.dart';
import 'package:masked_text/masked_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'curso_controller.dart';

class CursoPage extends StatefulWidget {
  final String title;
  const CursoPage({Key key, this.title = "Curso"}) : super(key: key);

  @override
  _CursoPageState createState() => _CursoPageState();
}

class _CursoPageState extends ModularState<CursoPage, CursoController> {
  //use 'controller' variable to access controller
  UserStore user = Modular.get();
  @override
  void initState() {
    controller.getCurso();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: GFAppBar(
        backgroundColor: Colors.black54,
        title: Text('Cursos'),
        actions: <Widget>[
          GFIconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              controller.setCurso();
            },
            type: GFButtonType.transparent,
          ),
        ],
      ),
      body: Observer(
        builder: (context) {
          if (controller.curso.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Stack(
              children: [
                Container(
                  child: ListView.builder(
                    itemCount: controller.curso.length,
                    itemBuilder: (context, index) {
                      var curso = controller.curso[index];
                      if (curso.status == false) {
                        return Container(
                          height: sh * 0.9,
                          child: Center(
                            child: Text('Ainda não existem cursos cadastrados'),
                          ),
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            Modular.link
                                .pushNamed('/commentcurso', arguments: curso);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: sw * 0.01,
                              vertical: sh * 0.01,
                            ),
                            child: Container(
                              padding:
                                  EdgeInsets.symmetric(vertical: sh * 0.02),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      color: Colors.black26,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
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
                                        Text(curso.nome),
                                        Text(curso.createdAt),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: sw,
                                    padding: EdgeInsets.symmetric(
                                        vertical: sh * 0.02,
                                        horizontal: sw * 0.06),
                                    color: Colors.white,
                                    child: Text(curso.descricao),
                                  ),
                                  curso.author == user.userModel.username
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
                                                  controller.id =
                                                      curso.id.toString();
                                                  controller
                                                      .deletcursoComentario();
                                                },
                                              ),
                                            ),
                                          ],
                                        )
                                      : Text(curso.author)
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
                                controller.cursonome = value;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Nome', border: InputBorder.none),
                            ),
                          ),
                        ),
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
                                controller.cursodescricao = value;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Descrição',
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
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
                                controller.local = value;
                              },
                              decoration: InputDecoration(
                                hintText: 'Local',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: sh * 0.01),
                              child: Container(
                                  width: sw * 0.4,
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: sw * 0.05),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      controller.qtdhoras = value;
                                    },
                                    inputFormatters: [
                                      MaskedTextInputFormatterShifter(
                                        maskONE: "XX:XX",
                                        maskTWO: "XX:XX",
                                      ),
                                    ],
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Tempo',
                                    ),
                                  )),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: sh * 0.01),
                              child: Container(
                                  width: sw * 0.4,
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: sw * 0.05),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      controller.data = value;
                                    },
                                    inputFormatters: [
                                      MaskedTextInputFormatterShifter(
                                        maskONE: "XX/XX",
                                        maskTWO: "XX/XX",
                                      ),
                                    ],
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Data',
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: sh * 0.01),
                              child: Container(
                                  width: sw * 0.4,
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: sw * 0.05),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      controller.hora = value;
                                    },
                                    inputFormatters: [
                                      MaskedTextInputFormatterShifter(
                                        maskONE: "XX:XX",
                                        maskTWO: "XX:XX",
                                      ),
                                    ],
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Horario',
                                    ),
                                  )),
                            ),
                          ],
                        )
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