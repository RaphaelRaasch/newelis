import 'package:elis/app/modules/auth/form/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/getwidget.dart';
import 'auth_controller.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key key, this.title = "Auth"}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends ModularState<AuthPage, AuthController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.purple[300],
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: sw * 0.03, vertical: sh * 0.01),
            child: Container(
                height: sh * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(sh * 0.02),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      color: Colors.black12,
                      offset: Offset(2, 2),
                    )
                  ],
                ),
                child: Observer(
                  builder: (context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FormWidget(
                          hint: 'Username',
                          obscure: false,
                          onChanged: (value) {
                            controller.username = value;
                          },
                          type: TextInputType.emailAddress,
                        ),
                        FormWidget(
                          hint: 'Password',
                          obscure: true,
                          onChanged: (value) {
                            controller.password = value;
                          },
                          type: TextInputType.text,
                        ),
                        SizedBox(
                          height: sh * 0.1,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: sw * 0.1),
                          child: controller.loading == true
                              ? GFLoader(type: GFLoaderType.ios)
                              : GFButton(
                                  disabledColor: Colors.grey[200],
                                  disabledTextColor: Colors.white,
                                  size: sh * 0.05,
                                  onPressed: controller.username.isEmpty ||
                                          controller.password.isEmpty
                                      ? null
                                      : () {
                                          controller.auth();
                                        },
                                  text: "Login",
                                  shape: GFButtonShape.pills,
                                ),
                        ),
                      ],
                    );
                  },
                )),
          ),
        ),
      ),
    );
  }
}
