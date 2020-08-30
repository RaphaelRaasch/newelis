import 'package:elis/app/modules/store/profile_store.dart';
import 'package:elis/app/modules/store/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mask_shifter/mask_shifter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'profile_controller.dart';

class ProfilePage extends StatefulWidget {
  final String title;
  const ProfilePage({Key key, this.title = "Profile"}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ModularState<ProfilePage, ProfileController> {
  //use 'controller' variable to access controller
  UserStore userStore = Modular.get();
  ProfileStore profileStore = Modular.get();

  @override
  void initState() {
    controller.psicologo = profileStore.profileModel.id.toString();
    controller.getFormacao();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: GFAppBar(
        backgroundColor: Colors.black54,
        title: Text(userStore.userModel.username),
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
      body: SingleChildScrollView(
        child: Observer(
          builder: (context) {
            if (controller.formacao.isEmpty) {
              return Container(
                height: sh * 0.9,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return Stack(
                children: [
                  Container(
                    height: sh,
                    width: sw,
                    padding: EdgeInsets.symmetric(
                        horizontal: sw * 0.05, vertical: sh * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userStore.userModel.username,
                          style: TextStyle(
                              color: Colors.black, fontSize: sh * 0.025),
                        ),
                        Text(
                          profileStore.profileModel.crp.toString(),
                          style: TextStyle(
                              color: Colors.black, fontSize: sh * 0.025),
                        ),
                        Container(
                          height: sh * 0.7,
                          child: ListView.builder(
                            itemCount: controller.formacao.length,
                            itemBuilder: (context, index) {
                              var formacao = controller.formacao[index];
                              return GFAccordion(
                                title: formacao.nome,
                                contentChild: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(formacao.instituicao),
                                          Text(formacao.dataConclusao),
                                        ],
                                      ),
                                      Text(formacao.titulo),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
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
                      height: sh * 0.6,
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
                                  controller.nome = value;
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
                                ],
                              ),
                              padding:
                                  EdgeInsets.symmetric(horizontal: sw * 0.05),
                              child: TextFormField(
                                onChanged: (value) {
                                  controller.instituicao = value;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Instituição',
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: sh * 0.01),
                            child: Container(
                                width: sw,
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
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    //controller.qtdhoras = value;
                                  },
                                  inputFormatters: [
                                    MaskedTextInputFormatterShifter(
                                      maskONE: "XX/XX/XXXX",
                                      maskTWO: "XX/XX/XXXX",
                                    ),
                                  ],
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Data da Formação',
                                  ),
                                )),
                          ),
                          GFAccordion(
                            title: controller.comboTitulo.isEmpty
                                ? 'Titulo'
                                : controller.comboTitulo,
                            contentChild: Container(
                              width: sw * 0.4,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FlatButton(
                                    onPressed: () {
                                      controller.comboTitulo = 'GRADUAÇÃO';
                                    },
                                    child: Text('Graduação'),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      controller.comboTitulo = 'Mestrado';
                                    },
                                    child: Text('Mestrado'),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      controller.comboTitulo = 'DOUTORADO';
                                    },
                                    child: Text('Doutorado'),
                                  ),
                                ],
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addFormacao();
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.black54,
        ),
      ),
    );
  }
}
