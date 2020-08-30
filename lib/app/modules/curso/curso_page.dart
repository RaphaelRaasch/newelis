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
            return Center(
              child: Text('Nehnum curso Cadastrado'),
            );
          } else {
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: sh,
                    child: ListView.builder(
                      itemCount: controller.curso.length,
                      itemBuilder: (context, index) {
                        var curso = controller.curso[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: sw * 0.03, vertical: sh * 0.01),
                          child: GestureDetector(
                            onTap: () {
                              Modular.link
                                  .pushNamed('/commentcurso', arguments: curso);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: sw * 0.03, vertical: sh * 0.02),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      color: Colors.black26,
                                      offset: Offset(2, 2),
                                    )
                                  ]),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(curso.author),
                                        Text(curso.data)
                                      ],
                                    ),
                                    SizedBox(
                                      height: sh * 0.03,
                                    ),
                                    Text(curso.descricao),
                                    SizedBox(
                                      height: sh * 0.03,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(curso.local),
                                        Text('Duração ${curso.qtdHoras}'),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        curso.author == user.userModel.username
                                            ? IconButton(
                                                icon: Icon(Icons.delete),
                                                color: Colors.red,
                                                onPressed: () {
                                                  controller
                                                      .deletcurso(curso.id);
                                                },
                                              )
                                            : SizedBox(),
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                        );
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
                      height: sh * 0.7,
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
                                  ),
                                ],
                              ),
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
                                  controller.cursodescricao = value;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Descrição',
                                ),
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
              ),
            );
          }
        },
      ),
    );
  }
}
