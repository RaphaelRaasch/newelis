import 'package:elis/app/modules/store/profile_store.dart';
import 'package:elis/app/modules/store/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/getwidget.dart';
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    color: Colors.black54.withOpacity(0.9),
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
                                ]),
                            padding:
                                EdgeInsets.symmetric(horizontal: sw * 0.05),
                            child: TextFormField(
                              onChanged: (value) {
                                controller.titulo = value;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Titulo', border: InputBorder.none),
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
                                controller.instituicao = value;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Instituição',
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
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
