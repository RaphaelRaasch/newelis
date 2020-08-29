import 'package:elis/app/modules/store/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/components/drawer/gf_drawer.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DrawerWidget extends StatelessWidget {
  UserStore usr = Modular.get();
  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return GFDrawer(
      child: usr.userModel.staff == false
          ? ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: sh * 0.1,
                  color: Colors.black54,
                ),
                ListTile(
                  leading: Icon(MdiIcons.accountBox),
                  title: Text('Profile'),
                  onTap: () async {
                    Modular.to.pushNamed('/home/profile');
                  },
                ),
                ListTile(
                  leading: Icon(MdiIcons.messageBulleted),
                  title: Text('Casos'),
                  onTap: () async {
                    Modular.to.pushNamed('/caso');
                  },
                ),
                ListTile(
                  leading: Icon(MdiIcons.book),
                  title: Text('Cursos'),
                  onTap: () {
                    Modular.to.pushNamed('/curso');
                  },
                ),
              ],
            )
          : ListView(
              children: [
                Container(
                  height: sh * 0.1,
                  color: Colors.black54,
                ),
                ListTile(
                  leading: Icon(MdiIcons.messageBulleted),
                  title: Text('Casos'),
                  onTap: () async {
                    Modular.to.pushNamed('/admincaso');
                  },
                ),
              ],
            ),
    );
  }
}
