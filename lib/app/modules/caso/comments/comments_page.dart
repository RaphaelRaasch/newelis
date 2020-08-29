import 'package:elis/app/modules/model/caso_model.dart';
import 'package:elis/app/modules/store/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/getwidget.dart';
import 'comments_controller.dart';

class CommentsPage extends StatefulWidget {
  final String title;
  final CasoModel comment;
  const CommentsPage({Key key, this.title = "Comments", @required this.comment})
      : super(key: key);

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState
    extends ModularState<CommentsPage, CommentsController> {
  UserStore user = Modular.get();
  //use 'controller' variable to access controller
  @override
  void initState() {
    controller.id = widget.comment.id.toString();
    controller.getCasoComentario();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: GFAppBar(
        backgroundColor: Colors.black54,
        title: Text(widget.comment.nome),
      ),
      body: Observer(
        builder: (context) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: sh * 0.9,
                      width: sw,
                      padding: EdgeInsets.symmetric(vertical: sh * 0.01),
                      color: Colors.white,
                      child: Observer(
                        builder: (context) {
                          if (controller.casocomentario.isEmpty) {
                            return Center(
                              child: Text('Nenhum Comentario'),
                            );
                          } else {
                            return ListView.builder(
                              itemCount: controller.casocomentario.length,
                              itemBuilder: (context, index) {
                                var comentario =
                                    controller.casocomentario[index];
                                if (comentario.status == false) {
                                  return SizedBox();
                                } else {
                                  return ListTile(
                                    title: Text(comentario.author),
                                    subtitle: Text(comentario.descricao),
                                    trailing: comentario.author ==
                                            user.userModel.username
                                        ? IconButton(
                                            icon: Icon(Icons.delete),
                                            color: Colors.red,
                                            onPressed: () {
                                              controller.commentId =
                                                  comentario.id.toString();
                                              controller.deleteCasoComentario();
                                            },
                                          )
                                        : SizedBox(),
                                  );
                                }
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
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
                                controller.descricao = value;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Descrição',
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          controller.setCasoComentario();
        },
        child: Icon(
          Icons.add,
          color: Colors.black54,
        ),
      ),
    );
  }
}
