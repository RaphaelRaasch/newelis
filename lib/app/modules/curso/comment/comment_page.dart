import 'package:elis/app/modules/model/curso_model.dart';
import 'package:elis/app/modules/store/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/getwidget.dart';
import 'comment_controller.dart';

class CommentPage extends StatefulWidget {
  final String title;
  final CursoModel comment;
  const CommentPage({Key key, this.title = "Comment", @required this.comment})
      : super(key: key);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends ModularState<CommentPage, CommentController> {
  //use 'controller' variable to access controller
  UserStore user = Modular.get();
  @override
  void initState() {
    controller.idcurso = widget.comment.id.toString();
    controller.getcurso();
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
      body: Container(
        height: sh,
        child: Observer(
          builder: (context) {
            if (controller.curso.isEmpty) {
              return Center(
                child: Text('Nenhum Comentario'),
              );
            } else {
              return Stack(
                children: [
                  Container(
                    height: sh,
                    width: sw,
                    child: ListView.builder(
                      itemCount: controller.curso.length,
                      itemBuilder: (context, index) {
                        var curso = controller.curso[index];
                        if (curso.status == false) {
                          return SizedBox();
                        } else {
                          return ListTile(
                            title: Text(curso.author),
                            subtitle: Text(curso.descricao),
                            trailing: curso.author == user.userModel.username
                                ? IconButton(
                                    icon: Icon(Icons.delete),
                                    color: Colors.red,
                                    onPressed: () {
                                      controller.cursoid = curso.id.toString();
                                      //controller.deleteCasoComentario();
                                    },
                                  )
                                : SizedBox(),
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
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          controller.setCursoComentario();
        },
        child: Icon(
          Icons.add,
          color: Colors.black54,
        ),
      ),
    );
  }
}
