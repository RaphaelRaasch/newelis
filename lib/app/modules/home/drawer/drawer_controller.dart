import 'package:mobx/mobx.dart';

part 'drawer_controller.g.dart';

class DrawerController = _DrawerControllerBase with _$DrawerController;

abstract class _DrawerControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
